import 'package:paula/app/model/word.dart';

class TaskWordsExempleModel {
  final String title;
  final List<Word> words;
  final String audio;

  bool isCorrect;

  TaskWordsExempleModel({
    this.title = "AQUI ESTÃO ALGUNS EXEMPLOS DE PALAVRAS",
    this.isCorrect = false,
    required this.words,
    required this.audio,
  });
}
