import 'package:get/get.dart';
import 'package:paula/app/controllers/task_controller.dart';
import 'package:paula/app/model/letter.dart';
import 'package:paula/app/model/letters.dart';
import 'package:paula/app/model/task_mark_vowel_model.dart';

class TaskMarkVowelController extends TaskController {
  int vowelSelected = 0;
  late TaskMarkVowelModel task;
  Letters letters = Letters();

  TaskMarkVowelController();

  TaskMarkVowelModel getTask(String letter) {
    List<Letter> listLetterVowels = [
      letters.lettersVowels[0],
      letters.lettersVowels[1],
      letters.lettersVowels[2],
      letters.lettersVowels[3],
      letters.lettersVowels[4],
    ];
    listLetterVowels.removeWhere((element) => element.text == letter);
    listLetterVowels.removeLast();
    for (Letter e in letters.lettersVowels) {
      listLetterVowels.addIf(e.text == letter, e);
    }
    listLetterVowels.shuffle();
    task = TaskMarkVowelModel(
        answer: letter,
        audio: 'audios/paula/paula_selection_$letter.mp3',
        vowels: listLetterVowels);
    return task;
  }

  void selectCard(TaskMarkVowelModel task, String cardSelected) {
    task.cardSelected = cardSelected;
  }

  @override
  bool verify(covariant TaskMarkVowelModel task) {
    if (task.cardSelected == task.answer) {
      task.isCorrect = true;
      return true;
    } else {
      task.isCorrect = false;
      return false;
    }
  }

  void reset() {
    task.reset();
  }
}
