import 'package:paula/app/model/paranoa_words.dart';

import '../model/task_complete_word_model.dart';
import '../model/words.dart';

class TaskCompleteWordController {
  List<String> vowelsSelected = [];
  List<String> answers = [];
  late TaskCompleteWordModel task1;
  late TaskCompleteWordModel task2;
  late TaskCompleteWordModel task3;
  late TaskCompleteWordModel task4;
  late TaskCompleteWordModel task5;
  late TaskCompleteWordModel taskParanoa;
  late TaskCompleteWordModel taskTintas;
  Words words = Words();
  ParanoaWords paranoaWords = ParanoaWords();
  TaskCompleteWordController() {
    taskParanoa = TaskCompleteWordModel(
        title:
            'Você consegue escrever paranoá? Arraste as letras para formar a palavra.',
        audio: 'paula_paranoaWrite.mp3',
        words: [paranoaWords.wordsList[12]],
        lessonVowels: ['P', 'R', 'A', 'N', 'O', 'Á']);
    taskTintas = TaskCompleteWordModel(
        title:
            'Você consegue escrever essa palavra? Arraste as letras para formar a palavra.',
        audio: 'paula_palavraWrite.mp3',
        words: [paranoaWords.wordsList[10]],
        lessonVowels: ['T', 'I', 'N', 'A', 'S']);
    task1 = TaskCompleteWordModel(
      lessonVowels: ['A', 'E', 'U'],
      words: [
        words.wordsList[15], // Capa
        words.wordsList[7], // UVA
        words.wordsList[10], // LATA
      ],
    );
    task2 = TaskCompleteWordModel(
      lessonVowels: ['I', 'O'],
      words: [
        words.wordsList[22], // OVO
        words.wordsList[17], // DADO
        words.wordsList[20], // IOIO
      ],
    );
    task3 = TaskCompleteWordModel(
      lessonVowels: ['A', 'E', 'I', 'O', 'U'],
      words: [
        words.wordsList[21], // MEIA
        words.wordsList[13], // BOLA
        words.wordsList[15], // CAPA
      ],
    );
    task4 = TaskCompleteWordModel(
      lessonVowels: ['A', 'E', 'I', 'O', 'U'],
      words: [
        paranoaWords.wordsList[12], // PARANOÁ
        paranoaWords.wordsList[10], // TINTAS
        words.wordsList[35], // OLHO
      ],
    );
    task5 = TaskCompleteWordModel(
      lessonVowels: ['A', 'E', 'I', 'O', 'U'],
      words: [
        words.wordsList[11], // Bebida
        words.wordsList[14], // Caneta
        words.wordsList[30], // Igreja
      ],
    );
  }

  TaskCompleteWordModel getTask1() {
    return task1;
  }

  TaskCompleteWordModel getTask2() {
    return task2;
  }

  TaskCompleteWordModel getTask3() {
    return task3;
  }

  TaskCompleteWordModel getTask4() {
    return task4;
  }

  TaskCompleteWordModel getTask5() {
    return task5;
  }

  TaskCompleteWordModel getTaskParanoa() {
    return taskParanoa;
  }

  TaskCompleteWordModel getTaskTintas() {
    return taskTintas;
  }

  void makeAnswers(TaskCompleteWordModel task) {
    for (int i = 0; i < task.words.length; i++) {
      String word = task.words[i].text;

      for (int i = 0; i < word.length; i++) {
        String letter = word[i].toUpperCase();
        if (task.lessonVowels.contains(letter)) {
          answers.add(letter);
        }
      }
    }
  }

  void addVowelSelected(int position, String letter) {
    vowelsSelected[position] = letter;
  }

  bool verifyAnswer() {
    for (int i = 0; i < answers.length; i++) {
      if (vowelsSelected[i] != answers[i]) {
        return false;
      }
    }
    return true;
  }

  void reset() {
    vowelsSelected.clear();
    answers.clear();
  }
}
