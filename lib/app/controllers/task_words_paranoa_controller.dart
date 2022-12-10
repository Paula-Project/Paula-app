import 'package:paula/app/model/task_words_paranoa_model.dart';
import 'package:paula/app/model/words.dart';

class TaskWordsParanoaController {
  late TaskWordsParanoaModel task1;
  Words words = Words();

  TaskWordsParanoaController() {
    task1 = TaskWordsParanoaModel(words: [
      words.words[36], //  PARANOA
    ], audio: "");
  }
  TaskWordsParanoaModel getTask1() {
    return task1;
  }
}
