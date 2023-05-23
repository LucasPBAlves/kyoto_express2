import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cartao {
  final String id;
  final String nome;
  final String numero;
  final String validade;
  final String cvv;

  Cartao({required this.id, required this.nome, required this.numero, required this.validade, required this.cvv});
}

class Cartoes {
  List<Cartao> _cartoes = [];

  List<Cartao> get cartoes => _cartoes;

  Future<void> carregarCartoes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userDocumentId = prefs.getString('userDocumentId');

    var db = FirebaseFirestore.instance;
    final ref = await db
        .collection('users')
        .doc(userDocumentId)
        .collection('Cartões')
        .get();
    final docs = ref.docs;

    List<Cartao> cartoes = docs.map((doc) {
      return Cartao(
        id: doc.id,
        nome: doc['Nome'],
        numero: doc['Numero'],
        validade: doc['Validade'],
        cvv: doc['CVV'],
      );
    }).toList();

    _cartoes = cartoes;
  }

  void adicionarCartao(Cartao cartao) {
    _cartoes.add(cartao);
  }
}
