import 'package:paula/app/controllers/lessons/lesson_controller_interface.dart';
import 'package:paula/app/controllers/tasks/task_complete_word_controller.dart';
import 'package:paula/app/controllers/tasks/task_controller.dart';
import 'package:paula/app/controllers/tasks/task_itapoa_tour-controller.dart';
import 'package:paula/app/controllers/tasks/task_mark_vowel_controller.dart';
import 'package:paula/app/controllers/tasks/task_vogal_selection_controller.dart';
import 'package:paula/app/model/task_model.dart';
import 'package:paula/app/views/lessons/congratulations_itapoa.dart';
import 'package:paula/app/views/lessons/try_again_page_paranoa.dart';
import 'package:paula/app/views/tasks/task_itapoa_tour.dart';
import 'package:paula/app/views/tasks/task_mark_vowel.dart';
import 'package:paula/app/views/tasks/task_vogal_selection.dart';
import 'package:paula/app/views/tasks/task_write_words.dart';

class LessonItapoaController implements LessonControllerInterface {
  TaskItapoaTourController itapoaLessonController = TaskItapoaTourController();
  TaskMarkVowelController markVowelController = TaskMarkVowelController();
  TaskVogalSelectionController vogalSelectionController =
      TaskVogalSelectionController();
  TaskCompleteWordController completeWordController =
      TaskCompleteWordController();
  List widgetsRouters = [];
  static int correctAnswers = 0;
  static int wrongAnswers = 0;
  int tasksQuantity = 7;

  static int nextPage = -1;
  static bool completed = false;

  LessonItapoaController() {
    widgetsRouters.add(TaskItapoaTour(
        lessonController: this, task: itapoaLessonController.getTaskFood()));
    widgetsRouters.add(TaskVogalSelection(
        lessonController: this,
        taskController: vogalSelectionController,
        task: vogalSelectionController.getTaskItapoa()));
    widgetsRouters.add(TaskItapoaTour(
        lessonController: this, task: itapoaLessonController.getTaskPasseio()));
    widgetsRouters.add(TaskWriteWords(
        lessonController: this,
        task: completeWordController.getTaskItapoa(),
        taskController: completeWordController));
    widgetsRouters.add(TaskWriteWords(
        lessonController: this,
        task: completeWordController.getTaskItapoaA1(),
        taskController: completeWordController));
    widgetsRouters.add(TaskItapoaTour(
        lessonController: this,
        task: itapoaLessonController.getPasseioPonte()));
    widgetsRouters.add(TaskVogalSelection(
        lessonController: this,
        taskController: vogalSelectionController,
        task: vogalSelectionController.getTaskItapoaA1()));
    widgetsRouters.add(TaskMarkVowel(
      lessonController: this,
      taskController: markVowelController,
      task: markVowelController.getTask("E"),
    ));
    widgetsRouters.add(TaskVogalSelection(
        lessonController: this,
        taskController: vogalSelectionController,
        task: vogalSelectionController.getTaskParanoaA3()));
    widgetsRouters.add(TaskVogalSelection(
        lessonController: this,
        taskController: vogalSelectionController,
        task: vogalSelectionController.getTaskItapoaA2()));
    widgetsRouters.add(const CongratulationsItapoa());
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
      if (wrongAnswers >= 4) {
        reset();
        return const TryAgainParanoaPage();
      }
    } else {
      reset();
    }
    return widgetsRouters[nextPage];
  }

  @override
  reset() {
    nextPage = -1;
    correctAnswers = 0;
    wrongAnswers = 0;
    vogalSelectionController.reset();
    completeWordController.reset();
  }

  @override
  verifyAnswer(TaskModel task, TaskController taskController) {
    if (taskController.verify(task)) {
      correctAnswers++;
    } else {
      wrongAnswers++;
    }
  }

  @override
  verifyAnswerNonControlled(bool isCorrect) {
    if (isCorrect) {
      correctAnswers++;
      return true;
    }
    wrongAnswers++;
  }

  void onCompleted() {
    if (wrongAnswers <= 1 && correctAnswers >= tasksQuantity - 1) {
      completed = true;
    }
  }
}
