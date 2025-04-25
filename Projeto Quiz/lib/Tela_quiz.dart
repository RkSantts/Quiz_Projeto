import 'package:flutter/material.dart';
import 'Tela_resultado.dart';
import 'Questoes.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestion = 0;
  int score = 0;

  final List<Questao> questions = [
    Questao(
      questionText: "Qual é a capital do Brasil?",
      options: ["Brasília", "Rio de Janeiro", "São Paulo", "Salvador"],
      correctIndex: 0,
      imageUrl:
          "https://upload.wikimedia.org/wikipedia/commons/0/00/Brasilia-Congresso.jpg",
    ),
    // Adicione mais perguntas aqui
  ];

  void answerQuestion(int index) {
    if (index == questions[currentQuestion].correctIndex) {
      score++;
    }

    Future.delayed(Duration(seconds: 1), () {
      if (currentQuestion < questions.length - 1) {
        setState(() {
          currentQuestion++;
        });
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder:
                (context) =>
                    TelaResultado(score: score, total: questions.length),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestion];

    return Scaffold(
      appBar: AppBar(
        title: Text('Pergunta ${currentQuestion + 1} de ${questions.length}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(question.imageUrl),
            SizedBox(height: 20),
            Text(question.questionText, style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            ...List.generate(question.options.length, (index) {
              return ElevatedButton(
                onPressed: () => answerQuestion(index),
                child: Text(question.options[index]),
              );
            }),
          ],
        ),
      ),
    );
  }
}
