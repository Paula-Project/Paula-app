import 'package:paula/app/controllers/lessons/lesson_controller_interface.dart';
import 'package:paula/app/controllers/tasks/task_complete_word_controller.dart';
import 'package:paula/app/controllers/tasks/task_controller.dart';
import 'package:paula/app/controllers/tasks/task_paranoa_tour_controller.dart';
import 'package:paula/app/controllers/tasks/task_vogal_selection_controller.dart';
import 'package:paula/app/http/webclient.dart';
import 'package:paula/app/model/task_model.dart';
import 'package:paula/app/model/usuarioAPI.dart';
import 'package:paula/app/state/usuario_state.dart';
import 'package:paula/app/views/lessons/congratulations_paranoa.dart';
import 'package:paula/app/views/lessons/try_again_page_paranoa.dart';
import 'package:paula/app/views/tasks/task_complete_words.dart';
import 'package:paula/app/views/tasks/task_paranoa_tour.dart';
import 'package:paula/app/views/tasks/task_vogal_selection.dart';
import 'package:paula/app/views/tasks/task_write_words.dart';
import 'package:provider/provider.dart';

class LessonParanoaController implements LessonControllerInterface {
  TaskParanoaTourController paranoaTourController = TaskParanoaTourController();
  TaskVogalSelectionController vogalSelectionController =
      TaskVogalSelectionController();
  TaskCompleteWordController completeWordController =
      TaskCompleteWordController();
  List widgetsRouters = [];
  static int correctAnswers = 0;
  static int wrongAnswers = 0;
  int tasksQuantity = 12;
  static int nextPage = -1;
  static bool completed = false;

  LessonParanoaController() {
    widgetsRouters.add(TaskVogalSelection(
        lessonController: this,
        taskController: vogalSelectionController,
        task: vogalSelectionController.getTaskParanoaA1()));
    widgetsRouters.add(TaskParanoaTour(
        lessonController: this, task: paranoaTourController.getTaskSunday()));
    widgetsRouters.add(TaskVogalSelection(
        lessonController: this,
        taskController: vogalSelectionController,
        task: vogalSelectionController.getTaskParanoaA2()));
    widgetsRouters.add(TaskParanoaTour(
        lessonController: this, task: paranoaTourController.getTaskFood()));
    widgetsRouters.add(TaskVogalSelection(
        lessonController: this,
        taskController: vogalSelectionController,
        task: vogalSelectionController.getTaskParanoa()));
    widgetsRouters.add(TaskParanoaTour(
        lessonController: this, task: paranoaTourController.getTaskDurst()));
    widgetsRouters.add(TaskVogalSelection(
        lessonController: this,
        taskController: vogalSelectionController,
        task: vogalSelectionController.getTaskParanoaA3()));
    widgetsRouters.add(TaskCompleteWords(
        lessonController: this,
        task: completeWordController.getTask4(),
        taskController: completeWordController));
    widgetsRouters.add(TaskWriteWords(
        lessonController: this,
        task: completeWordController.getTaskParanoa(),
        taskController: completeWordController));
    widgetsRouters.add(TaskVogalSelection(
        lessonController: this,
        taskController: vogalSelectionController,
        task: vogalSelectionController.getTaskParanoaA4()));
    widgetsRouters.add(TaskWriteWords(
        lessonController: this,
        task: completeWordController.getTaskCarro(),
        taskController: completeWordController));
    widgetsRouters.add(TaskWriteWords(
        lessonController: this,
        task: completeWordController.getTaskPalavrasParanoa(),
        taskController: completeWordController));
    widgetsRouters.add(TaskParanoaTour(
        lessonController: this, task: paranoaTourController.getTaskLake()));
    widgetsRouters.add(TaskWriteWords(
        lessonController: this,
        task: completeWordController.getTaskLixo(),
        taskController: completeWordController));
    widgetsRouters.add(TaskParanoaTour(
        lessonController: this, task: paranoaTourController.getTaskColors()));
    widgetsRouters.add(TaskWriteWords(
        lessonController: this,
        task: completeWordController.getTaskCama(),
        taskController: completeWordController));
    widgetsRouters.add(TaskWriteWords(
        lessonController: this,
        task: completeWordController.getTaskTintas(),
        taskController: completeWordController));
    widgetsRouters.add(CongratulationsParanoa(
      lessonController: this,
    ));
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
    if (user.progress >= 20) return;
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
