import 'package:flutter/material.dart';
import 'Tela_inicio.dart';

class TelaResultado extends StatelessWidget {
  final int score;
  final int total;

  TelaResultado({required this.score, required this.total});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Você acertou $score de $total!",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Tela_inicio()),
                );
              },
              child: Text("Reiniciar Quiz"),
            ),
          ],
        ),
      ),
    );
  }
}
