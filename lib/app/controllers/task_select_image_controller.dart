import 'package:paula/app/model/task_select_image_model.dart';
import 'package:paula/app/model/words.dart';

class TaskSelectImageController {
  late TaskSelectImageModel vogaisA;
  late TaskSelectImageModel vogaisE;
  late TaskSelectImageModel vogaisU;
  late TaskSelectImageModel vogaisI;
  late TaskSelectImageModel vogaisO;
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
        ]);
    vogaisE = TaskSelectImageModel(
        title: "Qual imagem começa com a letra “E”:",
        answer: words.words[5].text, //escada
        words: [
          words.words[5], //escada
          words.words[14], //ceneta
          words.words[2], //apito
          words.words[23], //padaria
        ]);
    vogaisU = TaskSelectImageModel(
        title: "Qual imagem começa com a letra “U”:",
        answer: words.words[7].text, //uva
        words: [
          words.words[13], //bola
          words.words[7], //uva
          words.words[24], //onibus
          words.words[5], //escada
        ]);
    vogaisI = TaskSelectImageModel(
        title: "Qual imagem começa com a letra “I”:",
        answer: words.words[20].text, //escada
        words: [
          words.words[21], //meia
          words.words[14], //caneta
          words.words[6], //oculos
          words.words[20], //ioio
        ]);
    vogaisO = TaskSelectImageModel(
        title: "Qual imagem começa com a letra “O”:",
        answer: words.words[22].text, //escada
        words: [
          words.words[5], //escada
          words.words[14], //ceneta
          words.words[22], //ovo
          words.words[17], //dado
        ]);

  }

  TaskSelectImageModel getVogaisA() {
    return vogaisA;
  }
  TaskSelectImageModel getVogaisE() {
    return vogaisE;
  }
  TaskSelectImageModel getVogaisU() {
    return vogaisU;
  }
  TaskSelectImageModel getVogaisI() {
    return vogaisI;
  }
  TaskSelectImageModel getVogaisO() {
    return vogaisO;
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
    vogaisU.isCorrect = false;
    vogaisI.isCorrect = false;
    vogaisO.isCorrect = false;
    cardSelected = "";
  }
}
