import 'package:paula/app/model/task_select_image_model.dart';
import 'package:paula/app/model/word.dart';
import 'package:paula/app/model/words.dart';

class TaskSelectImageController {
  late TaskSelectImageModel vogaisA;
  late TaskSelectImageModel vogaisE;
  Words words = Words();
  String cardSelected = "";

  TaskSelectImageController() {
    vogaisA = TaskSelectImageModel(answer: words.words[4].text, words: [
      words.words[5],
      words.words[6],
      words.words[4],
      words.words[7],
    ]);
    vogaisE = TaskSelectImageModel(answer: words.words[7].text, words: [
      words.words[5],
      words.words[6],
      words.words[4],
      words.words[7],
    ]);
  }

  TaskSelectImageModel getVogaisA() {
    return vogaisA;
  }
}
