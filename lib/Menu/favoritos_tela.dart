/*
import 'package:flutter/material.dart';
import 'product_list.dart';

class FavoritosTela extends StatefulWidget {
  @override
  _FavoritosTelaState createState() => _FavoritosTelaState();
}

class _FavoritosTelaState extends State<FavoritosTela> {
  List<products> favoritos = [];

  @override
  void initState() {
    super.initState();
    // Get favorites from product_list.dart
    favoritos = products.getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favoritos"),
      ),
      body: ListView.builder(
        itemCount: favoritos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favoritos[index].name),
            subtitle: Text(favoritos[index].price),
          );
        },
      ),
    );
  }
}
 */