import 'package:flutter/material.dart';

class CuponTela extends StatefulWidget {
  const CuponTela({Key? key}) : super(key: key);

  @override
  _CuponTelaState createState() => _CuponTelaState();
}

class _CuponTelaState extends State<CuponTela> {
  String _cupon = '';
  bool _applied = false;

  void _applyCupon() {
    if (_cupon == 'cupom') {
      // Aplicar desconto
      setState(() {
        _applied = true;
      });
    } else {
      // Cupom inválido
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Cupom Inválido'),
          content: const Text('Por favor, insira um cupom válido.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cupom de Desconto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'Insira o cupom',
              ),
              onChanged: (value) {
                setState(() {
                  _cupon = value;
                });
              },
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _applyCupon,
              child: const Text('Aplicar'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                textStyle: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            if (_applied)
              const SizedBox(
                height: 20.0,
                child: Text(
                  'Cupom aplicado com sucesso!',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
