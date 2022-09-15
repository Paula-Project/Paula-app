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

class LessonAEUController extends LessonController {
  TaskMarkVowelController markVowelController = TaskMarkVowelController();
  TaskSelectImageController selectImageController = TaskSelectImageController();
  TaskVogalSelectionController vogalSelectionController = TaskVogalSelectionController();
  TaskCompleteWordController completeWordController = TaskCompleteWordController();
  static int correctAnswers = 0;
  int tasksQuantity = 2;

  static int nextPage = -1;
  static bool completed = true;

  List widgetsRouters = [];

  LessonAEUController() {
    verifyisCompleted();

    widgetsRouters.add(LessonIntroduction(
      letter: 'A',
      titleIntroduction:
          "Esta é a letra “A”, ela é a primeira letra do alfabeto.",
      controller: this,
    ));
    widgetsRouters.add(TaskMarkVowel(
      lessonController: this,
      taskController: markVowelController,
      task: markVowelController.getTask1(),
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
    widgetsRouters.add(TaskMarkVowel(
      lessonController: this,
      taskController: markVowelController,
      task: markVowelController.getTask2(),
    ));
    widgetsRouters.add(LessonIntroduction(
      letter: 'U',
      titleIntroduction:
      "Esta é a letra “U”, ela é a primeira letra do alfabeto.",
      controller: this,
    ));
    widgetsRouters.add(TaskSelectImage(
      task: selectImageController.getVogaisU(),
      taskController: selectImageController,
      lessonController: this,
    ));
    widgetsRouters.add(TaskMarkVowel(
      lessonController: this,
      taskController: markVowelController,
      task: markVowelController.getTask3(),
    ));
    widgetsRouters.add(TaskVogalSelection(
      task: vogalSelectionController.getTask1(),
      lessonController: this,
      taskController: vogalSelectionController,
    ));


    widgetsRouters.add(TaskCompleteWords(
      lessonController: this,
      task: completeWordController.getTask1(),
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
    if (selectImageController.getVogaisU().isCorrect) {
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
