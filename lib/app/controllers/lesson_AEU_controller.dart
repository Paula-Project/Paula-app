import 'package:paula/app/controllers/lesson_controller.dart';
import 'package:paula/app/controllers/task_select_image_controller.dart';
import 'package:paula/app/views/lessons/congratulations_page.dart';
import 'package:paula/app/views/lessons/lesson_introduction.dart';
import 'package:paula/app/views/lessons/task_select_image.dart';

class LessonAEUController extends LessonController {
  late TaskSelectImageController selectImageController;
  var congratulationsPage = const CongratulationsPage();
  int correctAnswers = 0;
  int tasksQuantity = 0;
  static int nextPage = -1;

  List widgetsRouters = [];

  LessonAEUController() {
    selectImageController = TaskSelectImageController();

    widgetsRouters.add(LessonIntroduction(
      letter: 'A',
      titleIntroduction:
          "Esta é a letra “A”, ela é a primeira letra do alfabeto.",
      controller: this,
    ));
    widgetsRouters.add(TaskSelectImage(
      task: selectImageController.getVogaisA(),
      controller: this,
    ));
    widgetsRouters.add(LessonIntroduction(
      letter: 'E',
      titleIntroduction:
          "Esta é a letra “A”, ela é a primeira letra do alfabeto.",
      controller: this,
    ));
    widgetsRouters.add(TaskSelectImage(
      task: selectImageController.getVogaisE(),
      controller: this,
    ));
  }

  void lessonControl() {}

  @override
  nextTask() {
    nextPage++;
    return widgetsRouters[nextPage];
  }
}
