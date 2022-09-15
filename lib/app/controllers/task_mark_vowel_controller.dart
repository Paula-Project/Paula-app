import 'package:paula/app/model/letters.dart';
import '../model/task_mark_vowel_model.dart';

class TaskMarkVowelController{
  int vowelSelected = 0;
  late TaskMarkVowelModel task1;
  late TaskMarkVowelModel task2;
  late TaskMarkVowelModel task3;
  late TaskMarkVowelModel task4;
  late TaskMarkVowelModel task5;
  Letters letters = Letters();


  TaskMarkVowelController(){
    task1 = TaskMarkVowelModel(audio: 'audios/marqueA.ogg', //A
      vowels: [
        letters.letters[0], // A
        letters.letters[4], // E
        letters.letters[20], // U
        letters.letters[8], // I
      ],
    answer: 1);
    task2 = TaskMarkVowelModel(audio: 'audios/marqueA.ogg', // E
        vowels: [
          letters.letters[20], // U
          letters.letters[14], // O
          letters.letters[4], // E
          letters.letters[8], // I
        ],
        answer: 3);
    task3 = TaskMarkVowelModel(audio: 'audios/marqueA.ogg', // U
        vowels: [
          letters.letters[8], // I
          letters.letters[20], // U
          letters.letters[14], // O
          letters.letters[0], // A
        ],
        answer: 2);
    task4 = TaskMarkVowelModel(audio: 'audios/marqueA.ogg', // I
        vowels: [
          letters.letters[0], // A
          letters.letters[4], // E
          letters.letters[20], // U
          letters.letters[8], // I
        ],
        answer: 4);
    task5 = TaskMarkVowelModel(audio: 'audios/marqueA.ogg', // O
        vowels: [
          letters.letters[14], // O
          letters.letters[8], // I
          letters.letters[20], // U
          letters.letters[4], // E
        ],
        answer: 1);
  }

  TaskMarkVowelModel getTask1(){
    return task1;
  }
  TaskMarkVowelModel getTask2(){
    return task2;
  }
  TaskMarkVowelModel getTask3(){
    return task3;
  }
  TaskMarkVowelModel getTask4(){
    return task4;
  }
  TaskMarkVowelModel getTask5(){
    return task5;
  }

  void markVowel(int cardSelected){
    vowelSelected = cardSelected;
  }


  bool verifyAnswer(TaskMarkVowelModel task){
    if(task.answer == vowelSelected) return true;
    return false;
  }

  void reset(){
    vowelSelected = 0;
  }
}