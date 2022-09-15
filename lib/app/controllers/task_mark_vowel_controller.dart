import 'package:paula/app/model/letters.dart';
import '../model/task_mark_vowel_model.dart';

class TaskMarkVowelController{
  int vowelSelected = 0;
  late TaskMarkVowelModel task1;
  late TaskMarkVowelModel task2;
  late TaskMarkVowelModel task3;
  Letters letters = Letters();


  TaskMarkVowelController(){
    task1 = TaskMarkVowelModel(audio: 'audios/marqueA.ogg',
      vowels: [
        letters.letters[0], // A
        letters.letters[4], // E
        letters.letters[20], // U
        letters.letters[8], // I
      ],
    answer: 1);
  }

  TaskMarkVowelModel getTask1(){
    return task1;
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