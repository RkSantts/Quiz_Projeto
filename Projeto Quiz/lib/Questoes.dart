class Questao {
  final String questionText;
  final List<String> options;
  final int correctIndex;
  final String logoAsset;

  Questao({
    required this.questionText,
    required this.options,
    required this.correctIndex,
    required this.logoAsset,
  });
}
