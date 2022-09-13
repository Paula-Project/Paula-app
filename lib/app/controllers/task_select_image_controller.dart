import 'package:paula/app/model/task_select_image_model.dart';
import 'package:paula/app/model/words.dart';

class TaskSelectImageController {
  late TaskSelectImageModel vogaisA;
  late TaskSelectImageModel vogaisE;
  Words words = Words();
  String cardSelected = "";
  TaskSelectImageController() {
    vogaisA = TaskSelectImageModel(
        title: "Qual imagem começa com a letra “A”:",
        answer: words.words[4].text, // arvore
        words: [
          words.words[5], //escada
          words.words[6], //oculos
          words.words[4], //arvore
          words.words[7], //uva
        ],
        isCorrect: false);
    vogaisE = TaskSelectImageModel(
        title: "Qual imagem começa com a letra “E”:",
        answer: words.words[5].text, //escada
        words: [
          words.words[5], //escada
          words.words[14], //ceneta
          words.words[2], //apito
          words.words[23], //padaria
        ],
        isCorrect: false);
  }

  TaskSelectImageModel getVogaisA() {
    return vogaisA;
  }

  TaskSelectImageModel getVogaisE() {
    return vogaisE;
  }

  bool verify(TaskSelectImageModel task) {
    if (cardSelected == task.answer) {
      task.isCorrect = true;
      return true;
    } else {
      task.isCorrect = false;
      return false;
    }
  }

  void reset() {
    vogaisA.isCorrect = false;
    vogaisE.isCorrect = false;
    cardSelected = "";
  }
}
