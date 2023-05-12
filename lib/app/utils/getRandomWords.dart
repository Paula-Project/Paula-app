import 'package:paula/app/model/word.dart';
import '../model/words.dart';

List<Word> getRandomWords(List<String> vogalList, int numWords) {
  Words words = Words();

  List<Word> filteredWords = words.wordsList
      .where((word) => vogalList.any((vowel) => word.text.startsWith(vowel)))
      .toList();

  filteredWords.shuffle();

  List<Word> selectedWords = filteredWords.take(numWords).toList();
  return selectedWords;
}
