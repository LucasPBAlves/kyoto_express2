import 'package:flutter/material.dart';

class Cartao {
  final String nome;
  final String numero;
  final String validade;
  final String cvv;

  Cartao({required this.nome, required this.numero, required this.validade, required this.cvv});
}

class Cartoes {
  List<Cartao> _cartoes = [
    Cartao(nome: 'Cartão 1', numero: '1234 5678 9012 3456', validade: '12/24', cvv: '123'),
    Cartao(nome: 'Cartão 2', numero: '2345 6789 0123 4567', validade: '10/25', cvv: '456'),
    Cartao(nome: 'Cartão 3', numero: '3456 7890 1234 5678', validade: '06/26', cvv: '789'),
  ];

  List<Cartao> get cartoes => _cartoes;

  void adicionarCartao(Cartao cartao) {
    _cartoes.add(cartao);
  }
}
