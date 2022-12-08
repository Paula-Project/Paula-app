import 'package:paula/app/model/task_words_exemple_model.dart';
import 'package:paula/app/model/words.dart';

class TaskWordsExempleController {
  late TaskWordsExempleModel task1;
  Words words = Words();

  TaskWordsExempleController() {
    task1 = TaskWordsExempleModel(words: [
      words.words[8], // AVIÃO
      words.words[9], // ABACAXI
      words.words[1], // ANTENA
      words.words[4], // ARVORE
    ], audio: "");
  }
  TaskWordsExempleModel getTask1() {
    return task1;
  }
}
