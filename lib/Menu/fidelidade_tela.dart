import 'package:flutter/material.dart';

class FidelidadeTela extends StatefulWidget {
  @override
  _FidelidadeTelaState createState() => _FidelidadeTelaState();
}

class _FidelidadeTelaState extends State<FidelidadeTela> {
  int points = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fidelidade"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            // Display loyalty points
            Text(
              "Pontos: $points",
              style: TextStyle(fontSize: 24.0),
            ),
            // Add loyalty points button
            SizedBox(
              height: 20.0,
            ),
            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                // Increment points
                points++;
              },
            ),
            // Discount message
            if (points >= 5)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Você tem direito a um desconto de 50%!"),
              ),
            // Redeem discount button
            if (points >= 5)
              FloatingActionButton(
                child: Text("Resgatar desconto"),
                onPressed: () {
                  // Redeem discount
                  // ...
                },
              ),
          ],
        ),
      ),
    );
  }
}