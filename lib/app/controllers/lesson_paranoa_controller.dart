import 'package:paula/app/controllers/lesson_controller_interface.dart';
import 'package:paula/app/controllers/task_controller.dart';
import 'package:paula/app/controllers/task_words_paranoa_controller.dart';
import 'package:paula/app/model/task_model.dart';
import 'package:paula/app/views/home_page.dart';
import 'package:paula/app/views/lessons/task_words_paranoa.dart';

class LessonParanoaController implements LessonControllerInterface {
  TaskWordsParanoaController taskWordsParanoaController =
      TaskWordsParanoaController();
  List widgetsRouters = [];
  static int correctAnswers = 0;
  int tasksQuantity = 2;

  static int nextPage = -1;
  static bool completed = false;

  LessonParanoaController() {
    widgetsRouters.add(TaskWordsParanoa(
        task: taskWordsParanoaController.getTask1, lessonController: this));

    widgetsRouters.add(TaskWordsParanoa(
        task: taskWordsParanoaController.getTask2, lessonController: this));
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
