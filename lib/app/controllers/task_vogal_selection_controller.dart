import 'package:paula/app/model/task_vogal_selection_model.dart';
import 'package:paula/app/model/words.dart';

class TaskVogalSelectionController {
  final List<String> vogaisSelecionadas = [];
  final List<String> vogais = ['A', 'E', 'I', 'O', 'U'];
  late TaskVogalSelectionModel task1;
  late TaskVogalSelectionModel task2;
  late TaskVogalSelectionModel task3;
  Words words = Words();
  TaskVogalSelectionController() {
    task1 = TaskVogalSelectionModel(words: [words.words[14], words.words[7]]);
    task2 = TaskVogalSelectionModel(words: [words.words[22], words.words[2]]);
    task3 = TaskVogalSelectionModel(words: [words.words[4], words.words[19]]);
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

  void addVogal(String vogal) {
    vogaisSelecionadas.add(vogal);
  }

  void removeVogal(String vogal) {
    vogaisSelecionadas.remove(vogal);
  }

  bool verifyAnswer(task) {
    return vogaisSelecionadas
            .every((element) => getVogais(task).contains(element)) &&
        vogaisSelecionadas.isNotEmpty;
  }

  getVogais(task) {
    List wordsVogais = [];
    task.words.forEach((element) {
      element.text.runes.forEach((letter) {
        if (vogais
            .contains(String.fromCharCode(letter).toUpperCase().toString())) {
          wordsVogais.add(String.fromCharCode(letter).toUpperCase().toString());
        }
      });
    });
    return wordsVogais;
  }

  reset() {
    vogaisSelecionadas.clear();
  }
}
