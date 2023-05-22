import 'package:flutter/material.dart';
import 'package:kyoto_express/Autentica%C3%A7%C3%A3o/cartao_add.dart';
import '../Autenticação/cartao.dart';

class PagamentosTela extends StatefulWidget {
  const PagamentosTela({Key? key}) : super(key: key);

  @override
  PagamentosTelaState createState() => PagamentosTelaState();
}

class PagamentosTelaState extends State<PagamentosTela> {
  List<Cartao> _cartoes = [
    Cartao(numero: '1234 5678 9012 3456', validade: '12/23', cvv: '123', nome: ''),
    Cartao(numero: '9876 5432 1098 7654', validade: '06/25', cvv: '456', nome: ''),
  ];

  List<String> _transactions = [
    'Transaction 1',
    'Transaction 2',
    'Transaction 3',
    'Transaction 4',
  ];

  void _removerCartao(Cartao cartao) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Remover Cartão'),
          content: const Text('Tem certeza que deseja remover este cartão?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _cartoes.remove(cartao);
                });
                Navigator.of(context).pop();
              },
              child: const Text('Remover'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Cartões', style: TextStyle(color: Colors.black), textAlign: TextAlign.center),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (var cartao in _cartoes)
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.width * 0.4,
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[300],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(Icons.credit_card),
                    Text('**** **** **** ${cartao.numero.substring(12)}'),
                    ElevatedButton(
                      onPressed: () => _removerCartao(cartao),
                      child: const Text('Remover'),
                    ),
                  ],
                ),
              ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartaoScreen(),
                  ),
                ).then((cartao) {
                  if (cartao != null) {
                    setState(() {
                      _cartoes.add(cartao);
                    });
                  }
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.width * 0.4,
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[300],
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Icon(Icons.add),
                ),
              ),
            ),

          ],
        ),

      ),

    );
  }
}
