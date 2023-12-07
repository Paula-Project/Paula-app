import 'package:paula/app/model/task_model.dart';

class TaskDrawLetterModel extends TaskModel {
  final String letter;
  String response = "";
  TaskDrawLetterModel(
      {required String title,
      required String titleAudio,
      bool isCorrect = false,
      required this.letter})
      : super(
            title: title,
            titleAudio: titleAudio,
            isCorrect: isCorrect,
            answer: letter);
}
