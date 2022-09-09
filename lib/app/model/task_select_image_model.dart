import 'package:paula/app/model/word.dart';

class TaskSelectImageModel {
  TaskSelectImageModel({
    required this.answer,
    required this.words,
  });
  final List<Word> words;
  final String answer;
}
