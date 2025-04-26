import 'package:flutter/material.dart';
import 'Tela_inicio.dart';

class TelaResultado extends StatelessWidget {
  final int score;
  final int total;
  final bool perdeuPorTempo;

  TelaResultado({
    required this.score,
    required this.total,
    this.perdeuPorTempo = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 32, 32),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                perdeuPorTempo ? "⏰ Tempo esgotado!" : "🏆 Quiz finalizado!",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: perdeuPorTempo ? Colors.redAccent : Colors.greenAccent,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              Text(
                "Você acertou $score de $total!",
                style: TextStyle(fontSize: 24, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[900],
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Tela_inicio()),
                  );
                },
                child: Text(
                  "Reiniciar Quiz",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
