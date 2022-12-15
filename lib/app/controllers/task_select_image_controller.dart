import 'package:paula/app/controllers/task_controller.dart';
import 'package:paula/app/model/task_select_image_model.dart';
import 'package:paula/app/model/words.dart';

class TaskSelectImageController extends TaskController {
  late TaskSelectImageModel vogaisA;
  late TaskSelectImageModel vogaisE;
  late TaskSelectImageModel vogaisU;
  late TaskSelectImageModel vogaisI;
  late TaskSelectImageModel vogaisI2;
  late TaskSelectImageModel vogaisO;
  late TaskSelectImageModel vogaisO2;
  Words words = Words();
  String cardSelected = "";

  TaskSelectImageController() {
    vogaisA = TaskSelectImageModel(
        title: "Selecione a imagem que começa com a letra “A”:",
        answer: words.words[4].text, // arvore
        audio: "paula_selectionImage_A.mp3",
        words: [
          words.words[5], //escada
          words.words[6], //oculos
          words.words[4], //arvore
          words.words[7], //uva
        ]);

    vogaisE = TaskSelectImageModel(
        title: "Selecione a imagem que começa com a letra “E”:",
        answer: words.words[5].text, //escada
        audio: "paula_selectionImage_E.mp3",
        words: [
          words.words[5], //escada
          words.words[14], //ceneta
          words.words[2], //apito
          words.words[23], //padaria
        ]);

    vogaisI = TaskSelectImageModel(
        title: "Selecione a imagem que começa com a letra “I”:",
        answer: words.words[20].text, //IOIO
        audio: "paula_selectionImage_I.mp3",
        words: [
          words.words[21], //meia
          words.words[14], //caneta
          words.words[6], //oculos
          words.words[20], //ioio
        ]);

    vogaisI2 = TaskSelectImageModel(
        title: "Selecione a imagem que começa com a letra “I”:",
        answer: words.words[19].text, //iguana
        audio: "paula_selectionImage_I.mp3",
        words: [
          words.words[23], //padaria
          words.words[19], //iguana
          words.words[38], //sorvete
          words.words[28], //elefante
        ]);

    vogaisO = TaskSelectImageModel(
        title: "Selecione a imagem que começa com a letra “O”:",
        answer: words.words[22].text, //OVO
        audio: "paula_selectionImage_O.mp3",
        words: [
          words.words[5], //escada
          words.words[14], //ceneta
          words.words[22], //ovo
          words.words[17], //dado
        ]);

    vogaisO2 = TaskSelectImageModel(
        title: "Selecione a imagem que começa com a letra “O”:",
        answer: words.words[37].text, //olho
        audio: "paula_selectionImage_O.mp3",
        words: [
          words.words[30], //igreja
          words.words[32], //urso
          words.words[37], //olho
          words.words[16], //cavalo
        ]);

    vogaisU = TaskSelectImageModel(
        title: "Selecione a imagem que começa com a letra “U”:",
        answer: words.words[7].text, //uva
        audio: "paula_selectionImage_U.mp3",
        words: [
          words.words[13], //bola
          words.words[7], //uva
          words.words[24], //onibus
          words.words[5], //escada
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

  TaskSelectImageModel getVogaisI2() {
    return vogaisI2;
  }

  TaskSelectImageModel getVogaisO() {
    return vogaisO;
  }

  TaskSelectImageModel getVogaisO2() {
    return vogaisO2;
  }

  @override
  bool verify(covariant TaskSelectImageModel task) {
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
