import 'package:paula/app/controllers/lesson_controller.dart';
import 'package:paula/app/controllers/task_complete_word_controller.dart';
import 'package:paula/app/controllers/task_mark_vowel_controller.dart';
import 'package:paula/app/controllers/task_select_image_controller.dart';
import 'package:paula/app/controllers/task_vogal_selection_controller.dart';
import 'package:paula/app/views/lessons/task_complete_words.dart';
import 'package:paula/app/views/lessons/task_mark_vowel.dart';
import 'package:paula/app/views/lessons/congratulations_page.dart';
import 'package:paula/app/views/lessons/lesson_introduction.dart';
import 'package:paula/app/views/lessons/task_select_image.dart';
import 'package:paula/app/views/lessons/task_vogal_selection.dart';

class LessonIOController extends LessonController {
  TaskMarkVowelController markVowelController = TaskMarkVowelController();
  TaskSelectImageController selectImageController = TaskSelectImageController();
  TaskVogalSelectionController vogalSelectionController = TaskVogalSelectionController();
  TaskCompleteWordController completeWordController = TaskCompleteWordController();
  static int correctAnswers = 0;
  int tasksQuantity = 6;

  static int nextPage = -1;
  static bool completed = false;

  List widgetsRouters = [];

  LessonIOController() {
    verifyisCompleted();

    widgetsRouters.add(LessonIntroduction(
      letter: 'I',
      titleIntroduction:
      "Esta é a letra “I”, ela é a terceira vogal do alfabeto.",
      controller: this,
      audioUrl: 'introductionI.mp4',
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
      titleIntroduction:
      "Esta é a letra “O”, ela é a quarta vogal do alfabeto.",
      controller: this,
      audioUrl: 'introductionO.mp4',
    ));
    widgetsRouters.add(TaskSelectImage(
      task: selectImageController.getVogaisO(),
      taskController: selectImageController,
      lessonController: this,
    ));
    widgetsRouters.add(TaskMarkVowel(
      lessonController: this,
      taskController: markVowelController,
      task: markVowelController.getTask5(),
    ));
    widgetsRouters.add(TaskVogalSelection(
      task: vogalSelectionController.getTask2(),
      lessonController: this,
      taskController: vogalSelectionController,
    ));
    widgetsRouters.add(TaskCompleteWords(
      lessonController: this,
      task: completeWordController.getTask2(),
      taskController: completeWordController,
    ));
    widgetsRouters.add(const CongratulationsPage());
  }

  @override
  nextTask() {
    if (nextPage < widgetsRouters.length - 1) {
      nextPage++;
    } else {
      onCompleted();
      nextPage = 0;
      correctAnswers = 0;
    }
    return widgetsRouters[nextPage];
  }

  @override
  verifyAnswer() {
    if (selectImageController.getVogaisI().isCorrect) {
      correctAnswers++;
    }
    if (selectImageController.getVogaisO().isCorrect) {
      correctAnswers++;
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
