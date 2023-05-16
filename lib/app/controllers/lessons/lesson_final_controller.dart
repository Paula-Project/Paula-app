import 'package:paula/app/controllers/lessons/lesson_controller_interface.dart';
import 'package:paula/app/controllers/modules/module_vowels_controller.dart';
import 'package:paula/app/controllers/tasks/task_complete_word_controller.dart';
import 'package:paula/app/controllers/tasks/task_controller.dart';
import 'package:paula/app/controllers/tasks/task_mark_vowel_controller.dart';
import 'package:paula/app/controllers/tasks/task_select_image_controller.dart';
import 'package:paula/app/controllers/tasks/task_vogal_selection_controller.dart';
import 'package:paula/app/model/task_model.dart';
import 'package:paula/app/model/word.dart';
import 'package:paula/app/utils/getRandomWords.dart';
import 'package:paula/app/views/lessons/congratulations_vowels_page.dart';
import 'package:paula/app/views/lessons/task_complete_words.dart';
import 'package:paula/app/views/lessons/task_diphthong.dart';
import 'package:paula/app/views/lessons/task_select_image.dart';
import 'package:paula/app/views/lessons/task_vogal_selection.dart';
import 'package:paula/app/views/lessons/try_again_page.dart';
import '../../views/lessons/task_mark_vowel.dart';

class LessonFinalController implements LessonControllerInterface {
  TaskMarkVowelController markVowelController = TaskMarkVowelController();
  TaskSelectImageController selectImageController = TaskSelectImageController();
  TaskVogalSelectionController vogalSelectionController =
      TaskVogalSelectionController();
  TaskCompleteWordController completeWordController =
      TaskCompleteWordController();
  final ModuleVowelsController moduleVowelsController;
  static int correctAnswers = 0;
  static int wrongAnswers = 0;
  int tasksQuantity = 10;

  static int nextPage = -1;
  static bool completed = false;

  List widgetsRouters = [];

  LessonFinalController({required this.moduleVowelsController}) {
    List<Word> listWords = getRandomWords(["A", "E", "I", "O", "U"], 5);
    widgetsRouters.add(TaskDiphthong(
      lessonController: this,
    ));
    widgetsRouters.add(TaskSelectImage(
      task: selectImageController.getTask(listWords[0], listWords[0].text[0]),
      taskController: selectImageController,
      lessonController: this,
    ));
    widgetsRouters.add(TaskVogalSelection(
      task: vogalSelectionController.getTaskA1(),
      lessonController: this,
      taskController: vogalSelectionController,
    ));
    widgetsRouters.add(TaskSelectImage(
      task: selectImageController.getTask(listWords[1], listWords[1].text[0]),
      taskController: selectImageController,
      lessonController: this,
    ));
    widgetsRouters.add(TaskMarkVowel(
      lessonController: this,
      taskController: markVowelController,
      task: markVowelController.getTask("A"),
    ));
    widgetsRouters.add(TaskSelectImage(
      task: selectImageController.getTask(listWords[2], listWords[2].text[0]),
      taskController: selectImageController,
      lessonController: this,
    ));
    widgetsRouters.add(TaskCompleteWords(
      lessonController: this,
      task: completeWordController.getTask3(),
      taskController: completeWordController,
    ));
    widgetsRouters.add(TaskSelectImage(
      task: selectImageController.getTask(listWords[3], listWords[3].text[0]),
      taskController: selectImageController,
      lessonController: this,
    ));
    widgetsRouters.add(TaskVogalSelection(
      task: vogalSelectionController.getTaskA2(),
      lessonController: this,
      taskController: vogalSelectionController,
    ));
    widgetsRouters.add(TaskSelectImage(
      task: selectImageController.getTask(listWords[4], listWords[4].text[0]),
      taskController: selectImageController,
      lessonController: this,
    ));
    widgetsRouters.add(TaskCompleteWords(
      lessonController: this,
      task: completeWordController.getTask5(),
      taskController: completeWordController,
    ));
    widgetsRouters.add(CongratulationsVowelsPage(
      moduleVowelsController: moduleVowelsController,
    ));
  }

  set isCompleted(bool isCompleted) {
    completed = isCompleted;
  }

  @override
  nextTask() {
    if (nextPage < widgetsRouters.length - 1) {
      nextPage++;
      onCompleted();
      if (wrongAnswers > 2) {
        reset();
        return TryAgainPage(moduleVowelsController: moduleVowelsController);
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
    selectImageController.reset();
    markVowelController.reset();
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
    if (wrongAnswers <= 2 && correctAnswers >= tasksQuantity - 2) {
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