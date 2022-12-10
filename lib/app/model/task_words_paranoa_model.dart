import 'package:paula/app/model/word.dart';

class TaskWordsParanoaModel {
  final String title;
  final List<Word> words;
  final String audio;

  bool isCorrect;

  TaskWordsParanoaModel({
    this.title = "AQUI ESTÃO ALGUNS EXEMPLOS DE PALAVRAS DO PARANOÁ",
    this.isCorrect = false,
    required this.words,
    required this.audio,
  });
}
