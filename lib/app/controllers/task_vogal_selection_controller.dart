import 'package:paula/app/controllers/task_controller.dart';
import 'package:paula/app/model/task_model.dart';
import 'package:paula/app/model/task_vogal_selection_model.dart';
import 'package:paula/app/model/words.dart';

class TaskVogalSelectionController implements TaskController {
  late TaskVogalSelectionModel task1;
  late TaskVogalSelectionModel task2;
  late TaskVogalSelectionModel task3;
  late TaskVogalSelectionModel task4;
  late TaskVogalSelectionModel task5;
  Words words = Words();
  TaskVogalSelectionController() {
    task1 = TaskVogalSelectionModel(words: [
      words.words[14], //caneta
      words.words[7] //uva
    ], audio: "");
    task2 = TaskVogalSelectionModel(words: [
      words.words[22], //ovo
      words.words[2] //apito
    ], audio: "");
    task3 = TaskVogalSelectionModel(words: [
      words.words[4], //arvore
      words.words[19] //iguana
    ], audio: "");

    task4 = TaskVogalSelectionModel(words: [
      words.words[32], //urso
      words.words[30] //igreja
    ], audio: "");

    task5 = TaskVogalSelectionModel(words: [
      words.words[37], //olho
      words.words[39] //isca
    ], audio: "");
  }

  TaskVogalSelectionModel getTask1() {
    return task1;
  }

  TaskVogalSelectionModel getTask2() {
    return task2;
  }

  TaskVogalSelectionModel getTask3() {
    return task3;
  }

  TaskVogalSelectionModel getTask4() {
    return task4;
  }

  TaskVogalSelectionModel getTask5() {
    return task5;
  }

  @override
  bool verify(covariant TaskVogalSelectionModel task) {
    task.isCorrect = task.vogaisSelecionadas
            .every((element) => task.lettersCorrect.contains(element)) &&
        task.vogaisSelecionadas.length == task.lettersCorrect.length;
    return task.isCorrect;
  }

  reset() {
    task1.clear();
    task2.clear();
    task3.clear();
    task4.clear();
    task5.clear();
  }
}
