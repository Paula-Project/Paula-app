import 'package:paula/app/controllers/lesson_controller.dart';
import 'package:paula/app/controllers/task_select_image_controller.dart';
import 'package:paula/app/views/lessons/congratulations_page.dart';
import 'package:paula/app/views/lessons/lesson_introduction.dart';
import 'package:paula/app/views/lessons/task_select_image.dart';

class LessonAEUController extends LessonController {
  TaskSelectImageController selectImageController = TaskSelectImageController();
  var congratulationsPage = const CongratulationsPage();
  static int correctAnswers = 0;
  int tasksQuantity = 4;
  static int nextPage = -1;
  static bool completed = false;

  List widgetsRouters = [];

  LessonAEUController() {
    widgetsRouters.add(LessonIntroduction(
      letter: 'A',
      titleIntroduction:
          "Esta é a letra “A”, ela é a primeira letra do alfabeto.",
      controller: this,
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
    widgetsRouters.add(const CongratulationsPage());
  }

  @override
  nextTask() {
    nextPage++;
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
