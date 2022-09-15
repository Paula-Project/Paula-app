import 'letter.dart';

class TaskMarkVowelModel {

  final String title;
  final List<Letter> vowels;
  final String audio;
  final int answer;
  bool isCorrect;


  TaskMarkVowelModel({
    this.title = "COMPLETE AS PALAVRAS",
    this.isCorrect = false,
    required this.vowels,
    required this.audio,
    required this.answer,
  });



}
