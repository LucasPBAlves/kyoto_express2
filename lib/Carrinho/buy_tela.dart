import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'carrinho_model.dart';
import 'package:kyoto_express/Menu/pagamentos_tela.dart';

class CheckoutScreen extends StatefulWidget {
  final List<Cartao> cartoes; // Lista de cartões

  const CheckoutScreen({Key? key, required this.cartoes}) : super(key: key);

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  late SharedPreferences prefs;
  late String userDocumentId;
  String _selectedPaymentOption = '';
  late String dataS;

  final TextEditingController _moneyController = TextEditingController();

  List<Cartao> cartoes = [];

  @override
  void initState() {
    super.initState();
    initSharedPreferences();
  }

  Future<void> initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    userDocumentId = prefs.getString('userDocumentId') ?? '';

    fetchCartoes();
  }

  Future<void> fetchCartoes() async {
    final cartoesSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userDocumentId)
        .collection('cartoes')
        .get();

    cartoes = cartoesSnapshot.docs.map((doc) {
      final data = doc.data();
      return Cartao(
        id: doc.id,
        nome: doc['Nome'] ?? '',
        numero: doc['Numero'] ?? '',
        validade: doc['Validade'] ?? '',
        cvv: doc['CVV'] ?? '',
      );
    }).toList();

    setState(() {});
  }

  @override
  void dispose() {
    _moneyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dataS = ScopedModel.of<CartModel>(context, rebuildOnChange: true).cartItens;
    return Scaffold(

      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Total: R\$ ${ScopedModel
                      .of<CartModel>(context, rebuildOnChange: true)
                      .totalCartValue}',
                  style: const TextStyle(
                      fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Selecione um local de entrega:',
                  // Placeholder para o Place Picker
                  style: TextStyle(fontSize: 18.0),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Lógica para abrir o Place Picker
                  },
                  child: const Text('Selecionar local'),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Método de pagamento:',
                  style: TextStyle(fontSize: 18.0),
                ),
                const SizedBox(height: 16.0),
                ...cartoes.map((cartao) => ListTile(
                  leading: Radio<String>(
                    value: cartao.numero,
                    groupValue: _selectedPaymentOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedPaymentOption = value!;
                      });
                    },
                  ),
                  title: Text('Cartão ${getMaskedCardNumber(cartao.numero)}'),

                  trailing: const Icon(Icons.credit_card),
                )),
                ListTile(
                  leading: Radio<String>(
                    value: 'Dinheiro',
                    groupValue: _selectedPaymentOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedPaymentOption = value!;
                      });
                    },
                  ),
                  title: const Text('Dinheiro'),
                  trailing: const Icon(Icons.attach_money),
                ),
                Visibility(
                  visible: _selectedPaymentOption == 'Dinheiro',
                  child: TextFormField(
                    controller: _moneyController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Valor para troco',
                    ),
                  ),
                ),
                ListTile(
                  leading: Radio<String>(
                    value: 'Pix',
                    groupValue: _selectedPaymentOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedPaymentOption = value!;
                      });
                    },
                  ),
                  title: const Text('Pix'),
                  trailing: const Icon(Icons.qr_code),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    setData(
                      userDocumentId,
                      _selectedPaymentOption,
                      ScopedModel.of<CartModel>(context, rebuildOnChange: true)
                          .totalCartValue,

                    );
                  },
                  child: const Text('Confirmar compra'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void setData(String userDocumentId, String selectedPaymentOption,
      double totalCartValue) async {
    var db = FirebaseFirestore.instance;
    db.collection("orders").add(<String, dynamic>{
      "User": userDocumentId,
      "Pagamento": selectedPaymentOption,
      "Preço": totalCartValue,
      "feito": false,
      "entregue": false,
      "itens": dataS,

    }).then((DocumentReference doc) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('pedidoId', doc.id);
    });
  }

  String getMaskedCardNumber(String cardNumber) {
    if (cardNumber.length <= 4) {
      return cardNumber;
    } else {
      String maskedDigits = '*' * (cardNumber.length - 4);
      String lastFourDigits = cardNumber.substring(cardNumber.length - 4);
      return maskedDigits + lastFourDigits;
    }
  }}
