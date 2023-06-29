import 'package:paula/app/controllers/tasks/task_controller.dart';
import 'package:paula/app/model/paranoa_words.dart';
import 'package:paula/app/model/task_vogal_selection_model.dart';
import 'package:paula/app/model/words.dart';

class TaskVogalSelectionController implements TaskController {
  late TaskVogalSelectionModel taskA1;
  late TaskVogalSelectionModel taskA2;
  late TaskVogalSelectionModel taskE1;
  late TaskVogalSelectionModel taskE2;
  late TaskVogalSelectionModel taskI1;
  late TaskVogalSelectionModel taskI2;
  late TaskVogalSelectionModel taskO1;
  late TaskVogalSelectionModel taskO2;
  late TaskVogalSelectionModel taskU1;
  late TaskVogalSelectionModel taskU2;
  late TaskVogalSelectionModel taskParanoa;
  late TaskVogalSelectionModel taskParanoaA1;
  late TaskVogalSelectionModel taskParanoaA2;
  late TaskVogalSelectionModel taskParanoaA3;
  late TaskVogalSelectionModel taskParanoaA4;

  Words words = Words();
  ParanoaWords paranoaWords = ParanoaWords();
  TaskVogalSelectionController() {
    taskA1 = TaskVogalSelectionModel(words: [
      words.wordsList[15], //CAPA
      words.wordsList[10] //LATA
    ], audio: "paula_vowelSelection.mp3");

    taskA2 = TaskVogalSelectionModel(words: [
      words.wordsList[38], //Bala
      words.wordsList[39] //Faca
    ], audio: "paula_vowelSelection.mp3");

    taskE1 = TaskVogalSelectionModel(words: [
      words.wordsList[5], //escada
      words.wordsList[14] //caneta
    ], audio: "paula_vowelSelection.mp3");

    taskE2 = TaskVogalSelectionModel(words: [
      words.wordsList[25], //seta
      words.wordsList[1] //Antena
    ], audio: "paula_vowelSelection.mp3");

    taskI1 = TaskVogalSelectionModel(words: [
      words.wordsList[21], //Meia
      words.wordsList[37] //isca
    ], audio: "paula_vowelSelection.mp3");

    taskI2 = TaskVogalSelectionModel(words: [
      words.wordsList[21], //Meia
      words.wordsList[30] //igreja
    ], audio: "paula_vowelSelection.mp3");

    taskO1 = TaskVogalSelectionModel(words: [
      words.wordsList[13], //Bola
      words.wordsList[20] //ioio
    ], audio: "paula_vowelSelection.mp3");

    taskO2 = TaskVogalSelectionModel(words: [
      words.wordsList[22], //ovo
      words.wordsList[17] //dado
    ], audio: "paula_vowelSelection.mp3");

    taskU1 = TaskVogalSelectionModel(words: [
      words.wordsList[7], //Uva
      words.wordsList[32] //Urso
    ], audio: "paula_vowelSelection.mp3");

    taskU2 = TaskVogalSelectionModel(words: [
      words.wordsList[24], //Onibus
      words.wordsList[33] //unha
    ], audio: "paula_vowelSelection.mp3");

    taskParanoa = TaskVogalSelectionModel(words: [
      paranoaWords.wordsList[12], //paranoa
    ], audio: "paula_vowelSelection.mp3");

    taskParanoaA1 = TaskVogalSelectionModel(words: [
      paranoaWords.wordsList[15], //mãe
    ], audio: "paula_vowelSelection.mp3");

    taskParanoaA2 = TaskVogalSelectionModel(words: [
      paranoaWords.wordsList[16], //pai
    ], audio: "paula_vowelSelection.mp3");

    taskParanoaA3 = TaskVogalSelectionModel(words: [
      paranoaWords.wordsList[33], //escola
    ], audio: "paula_vowelSelection.mp3");
    taskParanoaA4 = TaskVogalSelectionModel(words: [
      paranoaWords.wordsList[30], //capivara
    ], audio: "paula_vowelSelection.mp3");
  }

  TaskVogalSelectionModel getTaskA1() {
    return taskA1;
  }

  TaskVogalSelectionModel getTaskA2() {
    return taskA2;
  }

  TaskVogalSelectionModel getTaskE1() {
    return taskE1;
  }

  TaskVogalSelectionModel getTaskE2() {
    return taskE2;
  }

  TaskVogalSelectionModel getTaskI1() {
    return taskI1;
  }

  TaskVogalSelectionModel getTaskI2() {
    return taskI2;
  }

  TaskVogalSelectionModel getTaskO1() {
    return taskO1;
  }

  TaskVogalSelectionModel getTaskO2() {
    return taskO2;
  }

  TaskVogalSelectionModel getTaskU1() {
    return taskU1;
  }

  TaskVogalSelectionModel getTaskU2() {
    return taskU2;
  }

  TaskVogalSelectionModel getTaskParanoa() {
    return taskParanoa;
  }

  TaskVogalSelectionModel getTaskParanoaA1() {
    return taskParanoaA1;
  }

  TaskVogalSelectionModel getTaskParanoaA2() {
    return taskParanoaA2;
  }

  TaskVogalSelectionModel getTaskParanoaA3() {
    return taskParanoaA3;
  }

  TaskVogalSelectionModel getTaskParanoaA4() {
    return taskParanoaA4;
  }

  @override
  bool verify(covariant TaskVogalSelectionModel task) {
    task.isCorrect = task.vogaisSelecionadas
            .every((element) => task.lettersCorrect.contains(element)) &&
        task.vogaisSelecionadas.length == task.lettersCorrect.length;
    return task.isCorrect;
  }

  reset() {
    taskA1.clear();
    taskA2.clear();
    taskE1.clear();
    taskE2.clear();
    taskI1.clear();
    taskO1.clear();
    taskO2.clear();
    taskU1.clear();
    taskU2.clear();
    taskParanoa.clear();
  }
}
