import 'package:paula/app/model/task_words_exemple_model.dart';
import 'package:paula/app/model/word.dart';
import 'package:paula/app/model/words.dart';

class TaskWordsExempleController {
  late TaskWordsExempleModel task;
  Words words = Words();

  TaskWordsExempleController();

  List<Word> getRandomWords(String letter) {
    List<Word> filteredWords =
        words.words.where((word) => word.text.startsWith(letter)).toList();
    filteredWords.shuffle();
    List<Word> selectedWords = filteredWords.take(4).toList();
    return selectedWords;
  }

  TaskWordsExempleModel getTask(String letter) {
    List<Word> wordsRandom = getRandomWords(letter);
    wordsRandom.shuffle();
    Map<String, List<String>> jsonMock = {
      "A": ["A", "Á", "À", "Â", "Ã"],
      "E": ["E", "É", "Ê", "Ẽ"],
      "I": ["I", "Í", "Ì"],
      "O": ["O", "Õ", "Ô"],
      "U": ["U"]
    };
    List<String> letters = [];
     if (jsonMock.containsKey(letter)) {
      letters = jsonMock[letter]!;
    }
    TaskWordsExempleModel task = TaskWordsExempleModel(
      title: "Você encontra a letra \"$letter\" em muitas palavras, como:",
      letter: letters,
      audio: "paula_lessonExample_$letter.mp3",
      words: [
        wordsRandom[0],
        wordsRandom[1],
        wordsRandom[2],
        wordsRandom[3],
      ],
    );
    return task;
  }
}
