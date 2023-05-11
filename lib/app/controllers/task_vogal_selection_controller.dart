import 'package:paula/app/controllers/task_controller.dart';
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

  Words words = Words();
  TaskVogalSelectionController() {
    taskA1 = TaskVogalSelectionModel(words: [
      words.words[15], //CAPA
      words.words[10] //LATA
    ], audio: "paula_vowelSelection.mp3");

    taskA2 = TaskVogalSelectionModel(words: [
      words.words[52], //Bala
      words.words[53] //Faca
    ], audio: "paula_vowelSelection.mp3");

    taskE1 = TaskVogalSelectionModel(words: [
      words.words[5], //escada
      words.words[14] //caneta
    ], audio: "paula_vowelSelection.mp3");

    taskE2 = TaskVogalSelectionModel(words: [
      words.words[25], //seta
      words.words[28] //elefante
    ], audio: "paula_vowelSelection.mp3");

    taskI1 = TaskVogalSelectionModel(words: [
      words.words[9], //abacaxi
      words.words[39] //isca
    ], audio: "paula_vowelSelection.mp3");

    taskI2 = TaskVogalSelectionModel(words: [
      words.words[21], //Meia
      words.words[30] //igreja
    ], audio: "paula_vowelSelection.mp3");

    taskO1 = TaskVogalSelectionModel(words: [
      words.words[13], //Bola
      words.words[20] //ioio
    ], audio: "paula_vowelSelection.mp3");

    taskO2 = TaskVogalSelectionModel(words: [
      words.words[22], //ovo
      words.words[17] //dado
    ], audio: "paula_vowelSelection.mp3");

    taskU1 = TaskVogalSelectionModel(words: [
      words.words[7], //Uva
      words.words[31] //Urso
    ], audio: "paula_vowelSelection.mp3");

    taskU2 = TaskVogalSelectionModel(words: [
      words.words[24], //Onibus
      words.words[33] //unha
    ], audio: "paula_vowelSelection.mp3");

    taskParanoa = TaskVogalSelectionModel(words: [
      words.words[36], //paranoa
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
