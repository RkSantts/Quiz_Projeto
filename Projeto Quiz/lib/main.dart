import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Tela_inicio.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Flamengo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(
          255,
          255,
          0,
          0,
        ), // fundo da tela
        primaryColor: Colors.red[900], // vermelho Flamengo
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.red[900],
          secondary: Colors.white,
        ),
        textTheme: GoogleFonts.bebasNeueTextTheme(Theme.of(context).textTheme),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red[900],
            foregroundColor: Colors.white,
            textStyle: TextStyle(fontSize: 18),
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),
      ),
      home: Tela_inicio(),
      debugShowCheckedModeBanner: false,
    );
  }
}
