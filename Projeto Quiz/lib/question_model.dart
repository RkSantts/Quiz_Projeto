class Question {
  final String questionText;
  final List<String> options;
  final int correctIndex;
  final String imageUrl;

  Question({
    required this.questionText,
    required this.options,
    required this.correctIndex,
    required this.imageUrl,
  });
}
