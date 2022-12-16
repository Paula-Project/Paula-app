import 'package:paula/app/controllers/task_controller.dart';
import 'package:paula/app/model/letters.dart';
import '../model/task_mark_vowel_model.dart';

class TaskMarkVowelController extends TaskController {
  int vowelSelected = 0;
  late TaskMarkVowelModel task1;
  late TaskMarkVowelModel task2;
  late TaskMarkVowelModel task3;
  late TaskMarkVowelModel task4;
  late TaskMarkVowelModel task5;
  Letters letters = Letters();

  TaskMarkVowelController() {
    task1 = TaskMarkVowelModel(
        audio: 'audios/paula/paula_selection_A.mp3', //A
        vowels: [
          letters.letters[0], // A
          letters.letters[4], // E
          letters.letters[20], // U
          letters.letters[8], // I
        ],
        answer: 'A');
    task2 = TaskMarkVowelModel(
        audio: 'audios/paula/paula_selection_E.mp3', // E
        vowels: [
          letters.letters[20], // U
          letters.letters[14], // O
          letters.letters[4], // E
          letters.letters[8], // I
        ],
        answer: 'E');
    task3 = TaskMarkVowelModel(
        audio: 'audios/paula/paula_selection_U.mp3', // U
        vowels: [
          letters.letters[8], // I
          letters.letters[20], // U
          letters.letters[14], // O
          letters.letters[0], // A
        ],
        answer: 'U');
    task4 = TaskMarkVowelModel(
        audio: 'audios/paula/paula_selection_I.mp3', // I
        vowels: [
          letters.letters[0], // A
          letters.letters[4], // E
          letters.letters[20], // U
          letters.letters[8], // I
        ],
        answer: 'I');
    task5 = TaskMarkVowelModel(
        audio: 'audios/paula/paula_selection_O.mp3', // O
        vowels: [
          letters.letters[14], // O
          letters.letters[8], // I
          letters.letters[20], // U
          letters.letters[4], // E
        ],
        answer: 'O');
  }

  TaskMarkVowelModel getTask1() {
    return task1;
  }

  TaskMarkVowelModel getTask2() {
    return task2;
  }

  TaskMarkVowelModel getTask3() {
    return task3;
  }

  TaskMarkVowelModel getTask4() {
    return task4;
  }

  TaskMarkVowelModel getTask5() {
    return task5;
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
    task1.reset();
    task2.reset();
    task3.reset();
    task4.reset();
    task5.reset();
  }
}
