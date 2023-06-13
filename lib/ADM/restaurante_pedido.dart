import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrdersManagement extends StatelessWidget {
  const OrdersManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciamento de Pedidos'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('orders')
            .where('feito', isEqualTo: false)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final orders = snapshot.data!.docs;

            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                final orderId = order.id;
                final orderData = order.data() as Map<String, dynamic>;

                return ListTile(
                  title: Text('Pedido ID: $orderId'),
                  subtitle: Text('Feito: ${orderData['feito']}'),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Detalhes do Pedido'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Pagamento: ${orderData['Pagamento']}'),
                              Text('Preço: ${orderData['Preço']}'),
                            ],
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                // Lógica para marcar o pedido como feito
                                FirebaseFirestore.instance
                                    .collection('orders')
                                    .doc(orderId)
                                    .update({'feito': true});

                                Navigator.of(context).pop();
                              },
                              child: const Text('Marcar como Feito'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('Erro ao carregar os pedidos.');
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
