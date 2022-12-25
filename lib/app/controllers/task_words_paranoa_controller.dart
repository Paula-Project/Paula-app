import 'package:paula/app/model/task_words_paranoa_model.dart';
import 'package:paula/app/model/words.dart';

class TaskWordsParanoaController {
  late TaskWordsParanoaModel task1;
  late TaskWordsParanoaModel task2;
  Words words = Words();

  TaskWordsParanoaController() {
    task1 = TaskWordsParanoaModel(words: [
      words.words[36], //  PARANOA
    ], audio: "");
    task2 = TaskWordsParanoaModel(
        title: "O paranoá está por toda parte, veja uns exemplos!",
        words: [
          words.words[40], //PARANOÁ CARNES
          words.words[42] // Paranoá Tintas
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
