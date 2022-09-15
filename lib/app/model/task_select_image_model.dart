import 'package:paula/app/model/word.dart';

class TaskSelectImageModel {
  TaskSelectImageModel({
    required this.title,
    required this.answer,
    required this.words,
    this.isCorrect = false,
  });
  final String title;
  final List<Word> words;
  final String answer;
  bool isCorrect;
}
