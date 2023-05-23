import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'Carrinho/carrinho_model.dart';
import 'Menu/cartao.dart';

class CheckoutScreen extends StatefulWidget {
  final List<Cartao> cartoes; // Lista de cartões

  const CheckoutScreen({Key? key, required this.cartoes}) : super(key: key);

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String _selectedPaymentOption = '';
  final TextEditingController _moneyController = TextEditingController();

  @override
  void dispose() {
    _moneyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  'Total: R\$ ${ScopedModel.of<CartModel>(context, rebuildOnChange: true).totalCartValue}',
                  style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Selecione um local de entrega:', // Placeholder para o Place Picker
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
                ListTile(
                  leading: Radio<String>(
                    value: 'Cartão',
                    groupValue: _selectedPaymentOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedPaymentOption = value!;
                      });
                    },
                  ),
                  title: const Text('Cartão'),
                  trailing: const Icon(Icons.credit_card),
                ),
                if (_selectedPaymentOption == 'Cartão')
                  Container(
                    height: 200, // Defina uma altura fixa para evitar o erro de layout
                    child: ListView(
                      shrinkWrap: true,
                      children: widget.cartoes.map((cartao) => RadioListTile<String>(
                        value: cartao.numero,
                        groupValue: _selectedPaymentOption,
                        onChanged: (value) {
                          setState(() {
                            _selectedPaymentOption = value!;
                          });
                        },
                        title: Text(cartao.numero),
                        controlAffinity: ListTileControlAffinity.trailing,
                      )).toList(),
                    ),
                  ),
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
                    // Lógica para confirmar a compra
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
}
