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
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 0, 0),
        primaryColor: const Color.fromARGB(255, 34, 34, 34),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromARGB(255, 37, 37, 37),
          secondary: Colors.white,
        ),
        textTheme: GoogleFonts.bebasNeueTextTheme(Theme.of(context).textTheme),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 32, 32, 32),
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
