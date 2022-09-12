import 'package:paula/app/controllers/lesson_controller.dart';
import 'package:paula/app/controllers/task_select_image_controller.dart';
import 'package:paula/app/controllers/task_vogal_selection_controller.dart';
import 'package:paula/app/views/lessons/task_complete_words.dart';
import 'package:paula/app/views/lessons/task_mark_vowel.dart';
import 'package:paula/app/views/lessons/congratulations_page.dart';
import 'package:paula/app/views/lessons/lesson_introduction.dart';
import 'package:paula/app/views/lessons/task_select_image.dart';
import 'package:paula/app/views/lessons/task_vogal_selection.dart';

class LessonAEUController extends LessonController {
  TaskSelectImageController selectImageController = TaskSelectImageController();
  TaskVogalSelectionController vogalSelectionController =
      TaskVogalSelectionController();
  static int correctAnswers = 0;
  int tasksQuantity = 5;

  static int nextPage = -1;
  static bool completed = false;

  List widgetsRouters = [];

  LessonAEUController() {
    nextPage = -1;
    completed = false;
    correctAnswers = 0;
    /*
    widgetsRouters.add(LessonIntroduction(
      letter: 'A',
      titleIntroduction:
          "Esta é a letra “A”, ela é a primeira letra do alfabeto.",
      controller: this,
    ));
    widgetsRouters.add(TaskMarkVowel(
      lessonController: this,
    ));
    widgetsRouters.add(TaskSelectImage(
      task: selectImageController.getVogaisA(),
      taskController: selectImageController,
      lessonController: this,
    ));
    widgetsRouters.add(LessonIntroduction(
      letter: 'E',
      titleIntroduction:
          "Esta é a letra “E”, ela é a primeira letra do alfabeto.",
      controller: this,
    ));
    widgetsRouters.add(TaskSelectImage(
      task: selectImageController.getVogaisE(),
      taskController: selectImageController,
      lessonController: this,
    ));
    */
    widgetsRouters.add(TaskVogalSelection(
      task: vogalSelectionController.getTask1(),
      lessonController: this,
      taskController: vogalSelectionController,
    ));
    /*
    widgetsRouters.add(TaskCompleteWords(
      lessonController: this,
    ));
    */
    widgetsRouters.add(const CongratulationsPage());
  }

  @override
  nextTask() {
    if (nextPage < widgetsRouters.length - 1) {
      nextPage++;
    } else {
      nextPage = 0;
      correctAnswers = 0;
    }
    print("nextpage: ${nextPage}");
    return widgetsRouters[nextPage];
  }

  @override
  verifyAnswer() {
    if (selectImageController.getVogaisA().isCorrect) {
      correctAnswers++;
    }
    if (selectImageController.getVogaisE().isCorrect) {
      correctAnswers++;
    }
  }

  @override
  verifyAnswerNonControlled() {
    correctAnswers++;
  }

  verifyisCompleted() {
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
