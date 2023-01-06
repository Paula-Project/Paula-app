import 'package:paula/app/model/task_model.dart';
import 'package:paula/app/model/word.dart';

class TaskVogalSelectionModel extends TaskModel {
  TaskVogalSelectionModel({
    String title = "SELECIONE AS VOGAIS",
    bool isCorrect = false,
    required this.audio,
    required this.words,
  }) : super(title: title, isCorrect: isCorrect) {
    makeAnswers();
  }
  final List<Word> words;
  List<String> lettersCorrect = [];
  List<String> vogaisSelecionadas = [];
  final List<String> vogais = ['A', 'Á', 'E', 'I', 'O', 'U'];

  void makeAnswers() {
    for (int i = 0; i < words.length; i++) {
      String word = words[i].text;
      for (int i = 0; i < word.length; i++) {
        String letter = word[i].toUpperCase();
        if (vogais.contains(letter)) {
          lettersCorrect.add(letter);
        }
      }
    }
  }

  void addVogal(String vogal) {
    vogaisSelecionadas.add(vogal);
  }

  void removeVogal(String vogal) {
    vogaisSelecionadas.remove(vogal);
  }

  clear() {
    vogaisSelecionadas.clear();
  }

  final String audio;
}
