import 'package:paula/app/model/word.dart';

class TaskCompleteWordModel {

  final String title;
  final List<Word> words;
  final List<String> lessonVowels;
  bool isCorrect;


  TaskCompleteWordModel({
    this.title = "COMPLETE AS PALAVRAS",
    this.isCorrect = false,
    required this.words,
    required this.lessonVowels,
  });



}
