import 'package:paula/app/controllers/tasks/task_controller.dart';
import 'package:paula/app/model/task_draw_letter_model.dart';
import 'package:paula/app/model/task_model.dart';

class TaskDrawLetterController extends TaskController {
  late TaskDrawLetterModel taskA;
  late TaskDrawLetterModel taskE;
  late TaskDrawLetterModel taskI;
  late TaskDrawLetterModel taskO;
  late TaskDrawLetterModel taskU;

  TaskDrawLetterController() {
    taskA = TaskDrawLetterModel(
      title: "Você consegue escrever a letra A no espaço abaixo?",
      titleAudio: "paula_draw_letter_A.mp3",
      letter: "A",
    );
    taskE = TaskDrawLetterModel(
      title: "Você consegue escrever a letra E no espaço abaixo?",
      titleAudio: "paula_draw_letter_E.mp3",
      letter: "E",
    );
    taskI = TaskDrawLetterModel(
      title: "Você consegue escrever a letra I no espaço abaixo?",
      titleAudio: "paula_draw_letter_I.mp3",
      letter: "I",
    );
    taskO = TaskDrawLetterModel(
      title: "Você consegue escrever a letra O no espaço abaixo?",
      titleAudio: "paula_draw_letter_O.mp3",
      letter: "O",
    );
    taskU = TaskDrawLetterModel(
      title: "Você consegue escrever a letra U no espaço abaixo?",
      titleAudio: "paula_draw_letter_U.mp3",
      letter: "U",
    );
  }

  TaskDrawLetterModel getTaskA() {
    return taskA;
  }

  TaskDrawLetterModel getTaskE() {
    return taskE;
  }

  TaskDrawLetterModel getTaskI() {
    return taskI;
  }

  TaskDrawLetterModel getTaskO() {
    return taskO;
  }

  TaskDrawLetterModel getTaskU() {
    return taskU;
  }

  @override
  bool verify(covariant TaskDrawLetterModel task) {
    if (task.answer == task.response) {
      task.isCorrect = true;
      return true;
    }
    return false;
  }

  void reset() {
    taskA.isCorrect = false;
    taskE.isCorrect = false;
    taskI.isCorrect = false;
    taskO.isCorrect = false;
    taskU.isCorrect = false;
  }
}
