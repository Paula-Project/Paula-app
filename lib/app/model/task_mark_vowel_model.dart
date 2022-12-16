import 'package:paula/app/model/task_model.dart';

import 'letter.dart';

class TaskMarkVowelModel extends TaskModel {
  final List<Letter> vowels;
  final String audio;
  String cardSelected;

  TaskMarkVowelModel(
      {required String answer,
      required this.vowels,
      required this.audio,
      bool isCorrect = false,
      this.cardSelected = ""})
      : super(isCorrect: isCorrect, answer: answer);

  reset() {
    cardSelected = "";
    super.isCorrect = false;
  }
}
