import 'package:paula/app/controllers/lesson_controller_interface.dart';
import 'package:paula/app/controllers/task_controller.dart';
import 'package:paula/app/controllers/task_paranoa_tour_controller.dart';
import 'package:paula/app/controllers/task_words_paranoa_controller.dart';
import 'package:paula/app/model/task_model.dart';
import 'package:paula/app/views/lessons/task_paranoa_tour.dart';
import 'package:paula/app/views/lessons/task_words_paranoa.dart';
import 'package:paula/app/views/lessons/try_again_page.dart';

class LessonParanoaController implements LessonControllerInterface {
  TaskWordsParanoaController taskWordsParanoaController =
      TaskWordsParanoaController();
  TaskParanoaTourController taskParanoaTourController =
      TaskParanoaTourController();
  List widgetsRouters = [];
  static int correctAnswers = 0;
  int tasksQuantity = 2;

  static int nextPage = -1;
  static bool completed = false;

  LessonParanoaController() {
    widgetsRouters.add(TaskParanoaTour(
        lessonController: this, task: taskParanoaTourController.getTaskFood()));
    widgetsRouters.add(TaskParanoaTour(
        lessonController: this,
        task: taskParanoaTourController.getTaskColors()));
    widgetsRouters.add(TaskParanoaTour(
        lessonController: this,
        task: taskParanoaTourController.getTaskDurst()));
    widgetsRouters.add(TaskParanoaTour(
        lessonController: this, task: taskParanoaTourController.getTaskLake()));
    widgetsRouters.add(TaskParanoaTour(
        lessonController: this,
        task: taskParanoaTourController.getTaskSunday()));
    widgetsRouters.add(TryAgainPage());
  }

  @override
  int getTaskCorrectAnswers() {
    return correctAnswers;
  }

  @override
  int getTaskQuantity() {
    return tasksQuantity;
  }

  @override
  nextTask() {
    if (nextPage < widgetsRouters.length - 1) {
      nextPage++;
      onCompleted();
    } else {
      reset();
    }
    return widgetsRouters[nextPage];
  }

  @override
  reset() {
    nextPage = -1;
    correctAnswers = 0;
  }

  @override
  verifyAnswer(TaskModel task, TaskController taskController) {
    if (taskController.verify(task)) {
      correctAnswers++;
    }
  }

  @override
  verifyAnswerNonControlled() {
    correctAnswers++;
    throw UnimplementedError();
  }

  void onCompleted() {
    if (correctAnswers >= tasksQuantity - 1) {
      completed = true;
    }
  }
}
