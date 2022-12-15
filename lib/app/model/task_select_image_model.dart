import 'package:paula/app/model/task_model.dart';
import 'package:paula/app/model/word.dart';

class TaskSelectImageModel extends TaskModel {
  final List<Word> words;
  final String audio;

  TaskSelectImageModel(
      {required this.words,
      required this.audio,
      bool isCorrect = false,
      required String title,
      required String answer})
      : super(answer: answer, title: title, isCorrect: isCorrect);
}
