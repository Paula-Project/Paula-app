import 'package:paula/app/model/task_select_image_model.dart';
import 'package:paula/app/model/words.dart';

class TaskSelectImageController {
  late TaskSelectImageModel vogaisA;
  late TaskSelectImageModel vogaisE;
  Words words = Words();

  TaskSelectImageController() {
    vogaisA = TaskSelectImageModel(
        answer: words.words[4].text,
        words: [
          words.words[5],
          words.words[6],
          words.words[4],
          words.words[7],
        ],
        isCorrect: false);
    vogaisE = TaskSelectImageModel(
        answer: words.words[7].text,
        words: [
          words.words[5],
          words.words[6],
          words.words[4],
          words.words[7],
        ],
        isCorrect: false);
  }

  TaskSelectImageModel getVogaisA() {
    return vogaisA;
  }

  TaskSelectImageModel getVogaisE() {
    return vogaisE;
  }

  bool verifyAnswer(String answer, TaskSelectImageModel task) {
    if (answer == task.answer) {
      task.isCorrect = true;
      return true;
    } else {
      task.isCorrect = false;
      return false;
    }
  }
}
