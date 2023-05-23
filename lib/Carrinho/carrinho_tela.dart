import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'carrinho_model.dart';
class CartPage extends StatefulWidget {
  const CartPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return _CartPageState();
  }
}
class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFB22124),
          title: const Text("Carrinho"),
          actions: <Widget>[
            TextButton(
                child: const Text(
                  "Esvaziar carrinho",
                  style: TextStyle(color: Colors.yellow),
                ),
                onPressed: () => ScopedModel.of<CartModel>(context).clearCart())
          ],
        ),
        body: ScopedModel.of<CartModel>(context, rebuildOnChange: true)
            .cart.isEmpty
            ? const Center(
          child: Text("No items in Cart"),
        )
            : Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: ScopedModel.of<CartModel>(context,
                      rebuildOnChange: true)
                      .total,
                  itemBuilder: (context, index) {
                    return ScopedModelDescendant<CartModel>(
                      builder: (context, child, model) {
                        return ListTile(
                          title: Text(model.cart[index].title),
                          subtitle: Text("${model.cart[index].qty} x ${model.cart[index].price} = ${model.cart[index].qty *
                              model.cart[index].price}"),
                          trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () {
                                    model.updateProduct(model.cart[index],
                                        model.cart[index].qty + 1);
                                    // model.removeProduct(model.cart[index]);
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () {
                                    model.updateProduct(model.cart[index],
                                        model.cart[index].qty - 1);
                                    // model.removeProduct(model.cart[index]);
                                  },
                                ),
                              ]),
                        );
                      },
                    );
                  },
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Total: R\$ ${ScopedModel.of<CartModel>(context,
                        rebuildOnChange: true)
                        .totalCartValue}",
                    style: const TextStyle(
                        fontSize: 24.0, fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    child: const Text("Finalizar Compra"),
                    onPressed: () {Navigator.pushNamed(context, '/FinalizarCompra');},
                  ))
            ])));
  }
}