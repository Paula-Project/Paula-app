import 'package:paula/app/controllers/lesson_controller_interface.dart';
import 'package:paula/app/controllers/task_complete_word_controller.dart';
import 'package:paula/app/controllers/task_controller.dart';
import 'package:paula/app/controllers/task_paranoa_tour_controller.dart';
import 'package:paula/app/controllers/task_vogal_selection_controller.dart';
import 'package:paula/app/model/task_model.dart';
import 'package:paula/app/views/lessons/congratulations_paranoa.dart';
import 'package:paula/app/views/lessons/task_complete_words.dart';
import 'package:paula/app/views/lessons/task_paranoa_tour.dart';
import 'package:paula/app/views/lessons/task_vogal_selection.dart';
import 'package:paula/app/views/lessons/task_write_words.dart';
import 'package:paula/app/views/lessons/try_again_page.dart';

class LessonParanoaController implements LessonControllerInterface {
  TaskParanoaTourController paranoaTourController = TaskParanoaTourController();
  TaskVogalSelectionController vogalSelectionController =
      TaskVogalSelectionController();
  TaskCompleteWordController completeWordController =
      TaskCompleteWordController();
  List widgetsRouters = [];
  static int correctAnswers = 0;
  int tasksQuantity = 4;

  static int nextPage = -1;
  static bool completed = false;

  LessonParanoaController() {
    widgetsRouters.add(TaskParanoaTour(
        lessonController: this, task: paranoaTourController.getTaskFood()));
    widgetsRouters.add(TaskVogalSelection(
        lessonController: this,
        taskController: vogalSelectionController,
        task: vogalSelectionController.getTaskParanoa()));
    widgetsRouters.add(TaskCompleteWords(
        lessonController: this,
        task: completeWordController.getTask4(),
        taskController: completeWordController));
    widgetsRouters.add(TaskWriteWords(
        lessonController: this,
        task: completeWordController.getTaskParanoa(),
        taskController: completeWordController));
    widgetsRouters.add(TaskParanoaTour(
        lessonController: this, task: paranoaTourController.getTaskDurst()));
    widgetsRouters.add(TaskParanoaTour(
        lessonController: this, task: paranoaTourController.getTaskColors()));
    widgetsRouters.add(TaskWriteWords(
        lessonController: this,
        task: completeWordController.getTaskTintas(),
        taskController: completeWordController));
    widgetsRouters.add(TaskParanoaTour(
        lessonController: this, task: paranoaTourController.getTaskLake()));
    widgetsRouters.add(TaskParanoaTour(
        lessonController: this, task: paranoaTourController.getTaskSunday()));
    widgetsRouters.add(const CongratulationsParanoa());
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
    print("chamou reset!");
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
  }

  void onCompleted() {
    if (correctAnswers >= tasksQuantity - 1) {
      completed = true;
    }
  }
}
