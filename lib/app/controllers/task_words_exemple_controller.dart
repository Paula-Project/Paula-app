import 'package:paula/app/model/task_words_exemple_model.dart';
import 'package:paula/app/model/word.dart';
import 'package:paula/app/model/words.dart';

class TaskWordsExempleController {
  late TaskWordsExempleModel taskA;
  late TaskWordsExempleModel taskE;
  late TaskWordsExempleModel taskI;
  late TaskWordsExempleModel taskO;
  late TaskWordsExempleModel taskU;

  Words words = Words();

  TaskWordsExempleController() {
  
    taskE = TaskWordsExempleModel(
        title: "Você encontra a letra “E” em muitas palavras, como:",
        letter: ["E", "É", "Ê", 'Ẽ'],
        words: [
          words.words[26], // ESCOVA
          words.words[5], // ESCADA
          words.words[28], // ELEFANTE
          words.words[29], // ESTRELA
        ],
        audio: "paula_lessonExample_E.mp3");
    taskI = TaskWordsExempleModel(
        title: "Você encontra a letra “I” em muitas palavras, como:",
        letter: [
          "I",
          "Í",
          "Ì",
        ],
        words: [
          words.words[19], // IGUANA
          words.words[20], // IOIO
          words.words[30], // IGREJA
          words.words[31], // IOGURTE
        ],
        audio: "paula_lessonExample_I.mp3");
    taskO = TaskWordsExempleModel(
        title: "Você encontra a letra “O” em muitas palavras, como:",
        letter: [
          "O",
          "Õ",
          "Ô",
        ],
        words: [
          words.words[22], // OVO
          words.words[6], // OCULOS
          words.words[24], // ONIBUS
          words.words[37], // OLHO
        ],
        audio: "paula_lessonExample_O.mp3");
    taskU = TaskWordsExempleModel(
        title: "Você encontra a letra “U” em muitas palavras, como:",
        letter: [
          "U",
        ],
        words: [
          words.words[32], // URSO
          words.words[33], // UNHA
          words.words[34], // UM
          words.words[7], // UVA
        ],
        audio: "paula_lessonExample_U.mp3");
  }
  TaskWordsExempleModel getTaskA(List<Word> words) {
    taskA = TaskWordsExempleModel(
        title: "Você encontra a letra “A” em muitas palavras, como:",
        letter: ["A", "Á", "À", "Â", "Ã"],
        words: [
          words[0], 
          words[1], 
          words[2], 
          words[3], 
        ],
        audio: "paula_lessonExample_A.mp3");
    return taskA;
  }

  TaskWordsExempleModel getTaskE() {
    return taskE;
  }

  TaskWordsExempleModel getTaskI() {
    return taskI;
  }

  TaskWordsExempleModel getTaskO() {
    return taskO;
  }

  TaskWordsExempleModel getTaskU() {
    return taskU;
  }
}
