import 'package:paula/app/model/paranoa_words.dart';
import 'package:paula/app/model/task_words_paranoa_model.dart';

class TaskWordsParanoaController {
  late TaskWordsParanoaModel task1;
  late TaskWordsParanoaModel task2;
  ParanoaWords words = ParanoaWords();

  TaskWordsParanoaController() {
    task1 = TaskWordsParanoaModel(words: [
      words.wordsList[12], //  PARANOA
    ], audio: "");
    task2 = TaskWordsParanoaModel(
        title: "O paranoá está por toda parte, veja uns exemplos!",
        words: [
          words.wordsList[0], //PARANOÁ CARNES
          words.wordsList[2] // Paranoá Tintas
        ],
        audio: "");
  }
  TaskWordsParanoaModel get getTask1 {
    return task1;
  }

  TaskWordsParanoaModel get getTask2 {
    return task2;
  }
}
