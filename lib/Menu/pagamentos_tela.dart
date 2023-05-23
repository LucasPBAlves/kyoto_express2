import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Cartao {
  final String id;
  final String nome;
  final String numero;
  final String validade;
  final String cvv;

  Cartao({
    required this.id,
    required this.nome,
    required this.numero,
    required this.validade,
    required this.cvv,
  });
}

class CartoesPage extends StatefulWidget {

  @override
  _CartoesPageState createState() => _CartoesPageState();
}

class _CartoesPageState extends State<CartoesPage> {
  late SharedPreferences prefs;
  late String userDocumentId;
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cartões'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Meus Cartões',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: cartoes.isEmpty
                ? const Center(
              child: Text('Nenhum cartão encontrado.'),
            )
                : ListView.builder(
              itemCount: cartoes.length + 1,
              itemBuilder: (context, index) {
                if (index == cartoes.length) {
                  return InkWell(
                    onTap: () {
                      // Ação para adicionar cartão
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Adicionar Cartão'),
                            content: const Text('Deseja adicionar um novo cartão?'),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Não'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/Cartao');
                                },
                                child: const Text('Sim'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Card(
                      child: ListTile(
                        title: Text('Adicionar cartão'),
                        leading: Icon(Icons.add),
                      ),
                    ),
                  );
                }

                final cartao = cartoes[index];

                return InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Informações do Cartão'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '**** **** **** ${cartao.numero.substring(cartao.numero.length - 4)}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('Nome: ${cartao.nome}'),
                              Text('Validade: ${cartao.validade}'),
                              Text('CVV: ${cartao.cvv.replaceAll(RegExp(r'\d'), '*')}'),

                            ],
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Fechar'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(
                        '**** **** **** ${cartao.numero.substring(cartao.numero.length - 4)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(cartao.nome),
                      trailing: Text(cartao.validade),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
