import 'package:paula/app/controllers/lesson_controller.dart';
import 'package:paula/app/controllers/module_vowels_controller.dart';
import 'package:paula/app/controllers/task_complete_word_controller.dart';
import 'package:paula/app/controllers/task_mark_vowel_controller.dart';
import 'package:paula/app/controllers/task_select_image_controller.dart';
import 'package:paula/app/controllers/task_vogal_selection_controller.dart';
import 'package:paula/app/controllers/task_words_exemple_controller.dart';
import 'package:paula/app/views/lessons/task_complete_words.dart';
import 'package:paula/app/views/lessons/task_mark_vowel.dart';
import 'package:paula/app/views/lessons/congratulations_page.dart';
import 'package:paula/app/views/lessons/lesson_introduction.dart';
import 'package:paula/app/views/lessons/task_select_image.dart';
import 'package:paula/app/views/lessons/task_vogal_selection.dart';
import 'package:paula/app/views/lessons/task_words_exemple.dart';

class LessonIOController extends LessonController {
  TaskMarkVowelController markVowelController = TaskMarkVowelController();
  TaskSelectImageController selectImageController = TaskSelectImageController();
  TaskVogalSelectionController vogalSelectionController =
      TaskVogalSelectionController();
  TaskCompleteWordController completeWordController =
      TaskCompleteWordController();
  TaskWordsExempleController wordsExempleController =
      TaskWordsExempleController();

  final ModuleVowelsController moduleVowelsController;
  static int correctAnswers = 0;
  int tasksQuantity = 6;

  static int nextPage = -1;
  static bool completed = false;

  List widgetsRouters = [];

  LessonIOController({required this.moduleVowelsController}) {
    nextPage = -1;

    verifyisCompleted();

    widgetsRouters.add(LessonIntroduction(
      letter: 'I',
      titleIntroduction: "Esta é a letra ‘I’, repita comigo LETRA I",
      controller: this,
      audioUrl: 'paula_introduction_I.mp3',
    ));
    widgetsRouters.add(TaskWordsExemple(
      task: wordsExempleController.getTaskI(),
      lessonController: this,
    ));
    widgetsRouters.add(TaskMarkVowel(
      lessonController: this,
      taskController: markVowelController,
      task: markVowelController.getTask4(),
    ));
    widgetsRouters.add(TaskSelectImage(
      task: selectImageController.getVogaisI(),
      taskController: selectImageController,
      lessonController: this,
    ));
    widgetsRouters.add(LessonIntroduction(
      letter: 'O',
      titleIntroduction: "Esta é a letra ‘O’, repita comigo LETRA O",
      controller: this,
      audioUrl: 'paula_introduction_O.mp3',
    ));
    widgetsRouters.add(TaskWordsExemple(
      task: wordsExempleController.getTaskO(),
      lessonController: this,
    ));
    widgetsRouters.add(TaskMarkVowel(
      lessonController: this,
      taskController: markVowelController,
      task: markVowelController.getTask5(),
    ));
    widgetsRouters.add(TaskSelectImage(
      task: selectImageController.getVogaisO(),
      taskController: selectImageController,
      lessonController: this,
    ));
    widgetsRouters.add(TaskVogalSelection(
      task: vogalSelectionController.getTask2(),
      lessonController: this,
      taskController: vogalSelectionController,
    ));
    widgetsRouters.add(TaskSelectImage(
      task: selectImageController.getVogaisO2(),
      taskController: selectImageController,
      lessonController: this,
    ));
    widgetsRouters.add(TaskCompleteWords(
      lessonController: this,
      task: completeWordController.getTask2(),
      taskController: completeWordController,
    ));
    widgetsRouters.add(TaskVogalSelection(
      task: vogalSelectionController.getTask4(),
      lessonController: this,
      taskController: vogalSelectionController,
    ));
    widgetsRouters.add(TaskSelectImage(
      task: selectImageController.getVogaisI2(),
      taskController: selectImageController,
      lessonController: this,
    ));
    widgetsRouters.add(TaskVogalSelection(
      task: vogalSelectionController.getTask5(),
      lessonController: this,
      taskController: vogalSelectionController,
    ));
    widgetsRouters.add(CongratulationsPage(
      moduleVowelsController: moduleVowelsController,
    ));
  }

  set isCompleted(bool isCompleted) {
    completed = isCompleted;
  }

  @override
  nextTask() {
    if (nextPage < widgetsRouters.length - 1) {
      nextPage++;
      onCompleted();
    } else {
      nextPage = 0;
      correctAnswers = 0;
    }
    print("nextpage: ${nextPage}");
    return widgetsRouters[nextPage];
  }

  @override
  verifyAnswer() {
    if (selectImageController.getVogaisI().isCorrect) {
      correctAnswers++;
      selectImageController.getVogaisI().isCorrect = false;
    }
    if (selectImageController.getVogaisI2().isCorrect) {
      correctAnswers++;
      selectImageController.getVogaisI2().isCorrect = false;
    }
    if (selectImageController.getVogaisO().isCorrect) {
      correctAnswers++;
      selectImageController.getVogaisO().isCorrect = false;
    }

    if (selectImageController.getVogaisO2().isCorrect) {
      correctAnswers++;
      selectImageController.getVogaisO2().isCorrect = false;
    }
  }

  @override
  verifyAnswerNonControlled() {
    correctAnswers++;
  }

  void onCompleted() {
    if (correctAnswers >= tasksQuantity - 1) {
      completed = true;
    }
  }

  bool getCompleted() {
    return completed;
  }

  void verifyisCompleted() {
    if (correctAnswers >= tasksQuantity - 1) {
      completed = true;
    }
  }

  @override
  int getTaskCorrectAnswers() {
    return correctAnswers;
  }

  @override
  int getTaskQuantity() {
    return tasksQuantity;
  }
}
