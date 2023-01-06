import 'package:paula/app/model/word.dart';

class TaskCompleteWordModel {
  final String title;
  final List<Word> words;
  final List<String> lessonVowels;
  final String audio;
  bool isCorrect;

  TaskCompleteWordModel({
    this.title = "COMPLETE AS PALAVRAS",
    this.isCorrect = false,
    this.audio = "paula_completeWords.mp3",
    required this.words,
    required this.lessonVowels,
  });
}
