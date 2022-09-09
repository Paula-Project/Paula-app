import 'package:paula/app/model/word.dart';

class TaskSelectImageModel {
  TaskSelectImageModel({
    required this.answer,
    required this.words,
    required this.isCorrect,
  });
  final List<Word> words;
  final String answer;
  bool isCorrect;
}
