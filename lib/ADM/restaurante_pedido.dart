import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrdersManagement extends StatelessWidget {
  const OrdersManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders Management'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('orders')
            .where('feito', isEqualTo: 0)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Erro ao carregar os pedidos');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          List<QueryDocumentSnapshot> orders =
          snapshot.data!.docs.cast<QueryDocumentSnapshot>();

          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              QueryDocumentSnapshot order = orders[index];
              List<dynamic> items = order['itens'];
              double price = order['preço'];

              return ListTile(
                title: Text('Itens: ${items.join(', ')}'),
                subtitle: Text('Preço: R\$ $price'),
                trailing: ElevatedButton(
                  onPressed: () {
                    // Alterar o campo "feito" para 1
                    FirebaseFirestore.instance
                        .collection('orders')
                        .doc(order.id)
                        .update({'feito': 1});
                  },
                  child: const Text('Remover'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
