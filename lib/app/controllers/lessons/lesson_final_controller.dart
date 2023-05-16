import 'package:paula/app/controllers/lessons/lesson_controller_interface.dart';
import 'package:paula/app/controllers/modules/module_vowels_controller.dart';
import 'package:paula/app/controllers/tasks/task_complete_word_controller.dart';
import 'package:paula/app/controllers/tasks/task_controller.dart';
import 'package:paula/app/controllers/tasks/task_mark_vowel_controller.dart';
import 'package:paula/app/controllers/tasks/task_select_image_controller.dart';
import 'package:paula/app/controllers/tasks/task_vogal_selection_controller.dart';
import 'package:paula/app/model/task_model.dart';
import 'package:paula/app/model/task_select_image_model.dart';
import 'package:paula/app/model/word.dart';
import 'package:paula/app/utils/getRandomWords.dart';
import 'package:paula/app/views/lessons/congratulations_vowels_page.dart';
import 'package:paula/app/views/tasks//task_complete_words.dart';
import 'package:paula/app/views/tasks//task_diphthong.dart';
import 'package:paula/app/views/tasks//task_select_image.dart';
import 'package:paula/app/views/tasks//task_vogal_selection.dart';
import 'package:paula/app/views/lessons/try_again_page.dart';
import 'package:paula/app/views/tasks/task_mark_vowel.dart';

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
  int tasksQuantity = 11;

  static int nextPage = -1;
  static bool completed = false;

  List widgetsRouters = [];

  late TaskSelectImageModel task1;
  late TaskSelectImageModel task2;
  late TaskSelectImageModel task3;
  late TaskSelectImageModel task4;
  late TaskSelectImageModel task5;
  LessonFinalController({required this.moduleVowelsController}) {
    List<Word> listWords = getRandomWords(["A", "E", "I", "O", "U"], 5);

    task1 = selectImageController.getTask(listWords[0], listWords[0].text[0]);
    task2 = selectImageController.getTask(listWords[1], listWords[1].text[0]);
    task3 = selectImageController.getTask(listWords[2], listWords[2].text[0]);
    task4 = selectImageController.getTask(listWords[3], listWords[3].text[0]);
    task5 = selectImageController.getTask(listWords[4], listWords[4].text[0]);
    widgetsRouters.add(TaskDiphthong(
      lessonController: this,
    ));
    widgetsRouters.add(TaskSelectImage(
      task: task1,
      taskController: selectImageController,
      lessonController: this,
    ));
    //1º task
    widgetsRouters.add(TaskVogalSelection(
      task: vogalSelectionController.getTaskA1(),
      lessonController: this,
      taskController: vogalSelectionController,
    )); //2º task
    widgetsRouters.add(TaskSelectImage(
      task: task2,
      taskController: selectImageController,
      lessonController: this,
    )); //3º task
    widgetsRouters.add(TaskMarkVowel(
      lessonController: this,
      taskController: markVowelController,
      task: markVowelController.getTask("A"),
    )); //4º task
    widgetsRouters.add(TaskSelectImage(
      task: task3,
      taskController: selectImageController,
      lessonController: this,
    )); //5º task
    widgetsRouters.add(TaskCompleteWords(
      lessonController: this,
      task: completeWordController.getTask3(),
      taskController: completeWordController,
    )); //6º task
    widgetsRouters.add(TaskMarkVowel(
      lessonController: this,
      taskController: markVowelController,
      task: markVowelController.getTask("E"),
    )); //7º task
    widgetsRouters.add(TaskSelectImage(
      task: task4,
      taskController: selectImageController,
      lessonController: this,
    )); //8º task
    widgetsRouters.add(TaskVogalSelection(
      task: vogalSelectionController.getTaskO1(),
      lessonController: this,
      taskController: vogalSelectionController,
    )); //9º task
    widgetsRouters.add(TaskSelectImage(
      task: task5,
      taskController: selectImageController,
      lessonController: this,
    )); //10º task
    widgetsRouters.add(TaskCompleteWords(
      lessonController: this,
      task: completeWordController.getTask5(),
      taskController: completeWordController,
    )); //11º task
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
    selectImageController.reset(task1);
    selectImageController.reset(task2);
    selectImageController.reset(task3);
    selectImageController.reset(task4);
    selectImageController.reset(task5);
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
