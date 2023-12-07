import 'package:paula/app/controllers/lessons/lesson_controller_interface.dart';
import 'package:paula/app/controllers/tasks/task_controller.dart';
import 'package:paula/app/controllers/tasks/task_draw_letter_controller.dart';
import 'package:paula/app/http/webclient.dart';
import 'package:paula/app/model/task_model.dart';
import 'package:paula/app/model/usuarioAPI.dart';
import 'package:paula/app/state/usuario_state.dart';
import 'package:paula/app/views/lessons/try_again_page_paranoa.dart';
import 'package:paula/app/views/tasks/task_draw_letter.dart';
import 'package:provider/provider.dart';

class LessonExtraController implements LessonControllerInterface {
  TaskDrawLetterController taskDrawLetterController =
      TaskDrawLetterController();
  List widgetsRouters = [];
  static int correctAnswers = 0;
  static int wrongAnswers = 0;
  int tasksQuantity = 5;

  static int nextPage = -1;
  static bool completed = false;

  LessonExtraController() {
    widgetsRouters.add(TaskDrawLetter(
        lessonController: this,
        task: taskDrawLetterController.getTaskA(),
        taskController: taskDrawLetterController));
    widgetsRouters.add(TaskDrawLetter(
        lessonController: this,
        task: taskDrawLetterController.getTaskE(),
        taskController: taskDrawLetterController));
    widgetsRouters.add(TaskDrawLetter(
        lessonController: this,
        task: taskDrawLetterController.getTaskI(),
        taskController: taskDrawLetterController));
    widgetsRouters.add(TaskDrawLetter(
        lessonController: this,
        task: taskDrawLetterController.getTaskO(),
        taskController: taskDrawLetterController));
    widgetsRouters.add(TaskDrawLetter(
        lessonController: this,
        task: taskDrawLetterController.getTaskU(),
        taskController: taskDrawLetterController));
  }

  @override
  int getTaskCorrectAnswers() {
    return correctAnswers;
  }

  @override
  int getTaskQuantity() {
    return tasksQuantity;
  }

  setModuleCompleted(context) async {
    var usuarioState = Provider.of<UsuarioState>(context, listen: false);
    UsuarioAPI user = usuarioState.getUsuario();
    if (user.progress >= 30) return;
    try {
      var progress = await addProgress(user.username);
      usuarioState.progressUpdate(user, progress);
    } catch (error) {
      print(error);
    }
    completed = true;
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
    taskDrawLetterController.reset();
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
