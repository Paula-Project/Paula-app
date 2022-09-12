import 'package:paula/app/model/word.dart';

class TaskVogalSelectionModel {
  TaskVogalSelectionModel({
    this.title = "SELECIONE AS VOGAIS",
    this.isCorrect = false,
    required this.words,
  });

  final String title;
  final List<Word> words;
  bool isCorrect;
}
