import 'package:flutter/material.dart';
import 'Tela_resultado.dart';
import 'Questoes.dart';
import 'dart:async';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestion = 0;
  int score = 0;
  int seconds = 30;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        setState(() {
          seconds--;
        });
      } else {
        timer.cancel();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder:
                (context) => TelaResultado(
                  score: score,
                  total: questions.length,
                  perdeuPorTempo: true,
                ),
          ),
        );
      }
    });
  }

  final List<Questao> questions = [
    Questao(
      questionText: "Quem é o maior artilheiro da história do Flamengo?",
      options: ["Zico", "Romário", "Gabigol", "Bruno Henrique"],
      correctIndex: 0,
      logoAsset: 'lib/assets/Artilheiro.png',
    ),
    Questao(
      questionText:
          "Em que ano o Flamengo conquistou sua primeira Taça Libertadores?",
      options: ["1972", "1992", "1981", "2009"],
      correctIndex: 2,
      logoAsset: 'assets/images/logo1.png',
    ),
    Questao(
      questionText:
          "Qual jogador do Flamengo foi eleito o melhor jogador da Copa do Mundo de 1982?",
      options: ["Leandro", "Sócrates", "Júnior", "Zico"],
      correctIndex: 3,
      logoAsset: 'assets/images/logo1.png',
    ),
    Questao(
      questionText:
          "Qual é o nome do estádio onde o Flamengo manda seus jogos?",
      options: ["Maracanã", "Allianz Parque", "Mineirão", "Morumbi"],
      correctIndex: 0,
      logoAsset: 'assets/images/logo1.png',
    ),
    Questao(
      questionText: "Qual foi o primeiro título mundial do Flamengo?",
      options: [
        "Copa do Mundo de Clubes 2019",
        "Copa Rio 1951",
        "Supercopa 2020",
        "Copa Intercontinental 1981",
      ],
      correctIndex: 3,
      logoAsset: 'assets/images/logo1.png',
    ),
    Questao(
      questionText:
          "Quem foi o técnico do Flamengo na conquista da Libertadores de 2019?",
      options: ["Abel Braga", "Jorge Jesus", "Dorival Júnior", "Renato Gaúcho"],
      correctIndex: 1,
      logoAsset: 'assets/images/logo1.png',
    ),
    Questao(
      questionText: "Qual jogador do Flamengo tem o apelido de 'Gabigol'?",
      options: [
        "Gabriel Barbosa",
        "Diego Ribas",
        "Filipe Luís",
        "Everton Ribeiro",
      ],
      correctIndex: 0,
      logoAsset: 'assets/images/logo1.png',
    ),
    Questao(
      questionText: "Em que ano o Flamengo foi fundado?",
      options: ["1895", "1902", "1922", "1891"],
      correctIndex: 0,
      logoAsset: 'assets/images/logo1.png',
    ),
    Questao(
      questionText:
          "Quem foi o maior rival do Flamengo no futebol carioca durante a década de 1980?",
      options: ["Fluminense", "River Plate", "Vasco", "Botafogo"],
      correctIndex: 2,
      logoAsset: 'assets/images/logo1.png',
    ),
    Questao(
      questionText:
          "Qual jogador do Flamengo foi o responsável por marcar o gol da vitória na final da Libertadores de 2019 contra o River Plate?",
      options: ["Bruno Henrique", "Gabigol", "Diego", "Arrascaeta"],
      correctIndex: 1,
      logoAsset: 'assets/images/logo1.png',
    ),
  ];

  void answerQuestion(int index) {
    if (index == questions[currentQuestion].correctIndex) {
      score++;
    }

    timer?.cancel();

    Future.delayed(Duration(seconds: 1), () {
      if (currentQuestion < questions.length - 1) {
        setState(() {
          currentQuestion++;
          seconds = 30;
          startTimer();
        });
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder:
                (context) => TelaResultado(
                  score: score,
                  total: questions.length,
                  perdeuPorTempo: false, // <-- AQUI FALSE
                ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestion];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 32, 32),
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Pergunta ${currentQuestion + 1} de ${questions.length}',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Image.asset('lib/assets/logoFla2.png', height: 40),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '$seconds s',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // centraliza verticalmente
              crossAxisAlignment:
                  CrossAxisAlignment.center, // centraliza horizontalmente
              children: [
                Image.asset(question.logoAsset, height: 150, width: 150),
                SizedBox(height: 20),
                Text(
                  question.questionText,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32),

                ...List.generate(question.options.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[900],
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 12,
                        ),
                        minimumSize: Size(double.infinity, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () => answerQuestion(index),
                      child: Text(
                        question.options[index],
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
