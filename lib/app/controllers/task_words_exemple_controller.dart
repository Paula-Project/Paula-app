import 'package:paula/app/model/task_words_exemple_model.dart';
import 'package:paula/app/model/words.dart';

class TaskWordsExempleController {
  late TaskWordsExempleModel taskA;
  late TaskWordsExempleModel taskE;
  late TaskWordsExempleModel taskI;
  late TaskWordsExempleModel taskO;
  late TaskWordsExempleModel taskU;

  Words words = Words();

  TaskWordsExempleController() {
    taskA = TaskWordsExempleModel(
        title: "Aqui estão alguns exemplos de objetos com “A”:",
        letter: ["A", "Á", "À", "Â", "Ã"],
        words: [
          words.words[8], // AVIÃO
          words.words[9], // ABACAXI
          words.words[3], // ARROZ
          words.words[4], // ARVORE
        ],
        audio: "");
    taskE = TaskWordsExempleModel(
        title: "Aqui estão alguns exemplos de objetos com “E”:",
        letter: ["E", "É", "Ê", 'Ẽ'],
        words: [
          words.words[26], // ESCOVA
          words.words[5], // ESCADA
          words.words[28], // ELEFANTE
          words.words[29], // ESTRELA
        ],
        audio: "");
    taskI = TaskWordsExempleModel(
        title: "Aqui estão alguns exemplos de objetos com “I”:",
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
        audio: "");
    taskO = TaskWordsExempleModel(
        title: "Aqui estão alguns exemplos de objetos com “O”:",
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
        audio: "");
    taskU = TaskWordsExempleModel(
        title: "Aqui estão alguns exemplos de objetos com “U”:",
        letter: [
          "U",
        ],
        words: [
          words.words[32], // URSO
          words.words[33], // UNHA
          words.words[34], // UM
          words.words[7], // UVA
        ],
        audio: "");
  }
  TaskWordsExempleModel getTaskA() {
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
