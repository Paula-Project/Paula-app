import 'package:paula/app/controllers/task_controller.dart';
import 'package:paula/app/model/task_select_image_model.dart';
import 'package:paula/app/model/word.dart';
import 'package:paula/app/model/words.dart';

class TaskSelectImageController extends TaskController {
  late TaskSelectImageModel task;
  Words words = Words();


  TaskSelectImageController();

  List<Word> getRandomWords(String letter) {
    List<String> vogalList = ["A", "E", "I", "O", "U"];
    vogalList.removeAt(vogalList.indexOf(letter));
    List<Word> filteredWords = words.words
        .where((word) =>
            !word.text.startsWith(letter) &&
                word.text.startsWith(vogalList[0]) ||
            word.text.startsWith(vogalList[1]) ||
            word.text.startsWith(vogalList[2]) ||
            word.text.startsWith(vogalList[3]))
        .toList();
    filteredWords.shuffle();
    List<Word> selectedWords = filteredWords.take(3).toList();
    return selectedWords;
  }

  TaskSelectImageModel getTask(Word word, String letter) {
    List<Word> wordsRandom = getRandomWords(letter);
    wordsRandom.add(word);
    wordsRandom.shuffle();
    task = TaskSelectImageModel(
        title: "Selecione a imagem que começa com a som “$letter”:",
        answer: word.text, // arvore
        audio: "paula_selectionImage_$letter.mp3",
        words: [
          wordsRandom[0],
          wordsRandom[1],
          wordsRandom[2],
          wordsRandom[3],
        ]);
    return task;
  }
  @override
  bool verify(covariant TaskSelectImageModel task) {
    if (task.cardSelected == task.answer) {
      task.isCorrect = true;
      return true;
    } else {
      task.isCorrect = false;
      return false;
    }
  }

  void reset() {
    task.reset();
  }
}
