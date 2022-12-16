import 'package:paula/app/model/task_model.dart';
import 'package:paula/app/model/word.dart';

class TaskSelectImageModel extends TaskModel {
  final List<Word> words;
  final String audio;
  String cardSelected;

  TaskSelectImageModel(
      {required String title,
      required String answer,
      required this.words,
      required this.audio,
      bool isCorrect = false,
      this.cardSelected = ""})
      : super(title: title, isCorrect: isCorrect, answer: answer);

  reset() {
    cardSelected = "";
    super.isCorrect = false;
  }
}
