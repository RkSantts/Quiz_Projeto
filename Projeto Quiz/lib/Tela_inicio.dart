import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Tela_quiz.dart';

class Tela_inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/maracana.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('lib/assets/LogoFla1.png', width: 150, height: 150),
              SizedBox(height: 20),
              Text(
                'Quiz sobre o Flamengo',
                style: GoogleFonts.bebasNeue(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[900],
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: TextStyle(fontSize: 20),
                  backgroundColor: Colors.red[900],
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuizPage()),
                  );
                },
                child: Text('Iniciar Quiz'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
