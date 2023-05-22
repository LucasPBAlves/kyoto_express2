import 'package:flutter/material.dart';
import 'product_list.dart';

class ItemScreen extends StatelessWidget {
  final Product product;

  const ItemScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            // Image
            Image.network(product.imgUrl),
            // Title
            Text(product.title),
            // Price
            Text(product.price.toString()),
            // Description
            Text(product.description),
            // Category
            Text(product.category),
            // Subcategory
            //Text(product.subcategory),
          ],
        ),
      ),
    );
  }
}