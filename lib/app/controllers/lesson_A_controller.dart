import 'package:paula/app/controllers/lesson_controller_interface.dart';
import 'package:paula/app/controllers/module_vowels_controller.dart';
import 'package:paula/app/controllers/task_complete_word_controller.dart';
import 'package:paula/app/controllers/task_controller.dart';
import 'package:paula/app/controllers/task_mark_vowel_controller.dart';
import 'package:paula/app/controllers/task_select_image_controller.dart';
import 'package:paula/app/controllers/task_vogal_selection_controller.dart';
import 'package:paula/app/controllers/task_words_exemple_controller.dart';
import 'package:paula/app/model/task_model.dart';
import 'package:paula/app/model/word.dart';
import 'package:paula/app/utils/getRandomWords.dart';
import 'package:paula/app/views/lessons/task_complete_words.dart';
import 'package:paula/app/views/lessons/task_mark_vowel.dart';
import 'package:paula/app/views/lessons/congratulations_page.dart';
import 'package:paula/app/views/lessons/lesson_introduction.dart';
import 'package:paula/app/views/lessons/task_select_image.dart';
import 'package:paula/app/views/lessons/task_vogal_selection.dart';
import 'package:paula/app/views/lessons/task_words_exemple.dart';
import 'package:paula/app/views/lessons/try_again_page.dart';
import 'package:paula/app/model/words.dart';

class LessonAController implements LessonControllerInterface {
  TaskMarkVowelController markVowelController = TaskMarkVowelController();
  TaskSelectImageController selectImageController = TaskSelectImageController();
  TaskVogalSelectionController vogalSelectionController =
      TaskVogalSelectionController();
  TaskCompleteWordController completeWordController =
      TaskCompleteWordController();
  TaskWordsExempleController wordsExempleController =
      TaskWordsExempleController();
  Words words = Words();

  final ModuleVowelsController moduleVowelsController;
  static int correctAnswers = 0;
  static int wrongAnswers = 0;
  int tasksQuantity = 8;

  static int nextPage = -1;
  static bool completed = false;

  List widgetsRouters = [];

  LessonAController({required this.moduleVowelsController}) {
    verifyisCompleted();
    List<Word> listWordsA = getRandomWords(["A"], 4);

    widgetsRouters.add(LessonIntroduction(
      letter: 'A',
      titleIntroduction: "Esta é a letra A, repita comigo LETRA A.",
      controller: this,
      audioUrl: 'paula_introduction_A.mp3',
    ));
    widgetsRouters.add(TaskWordsExemple(
      task: wordsExempleController.getTask(
        "A",
        listWordsA,
      ),
      lessonController: this,
    ));
    widgetsRouters.add(TaskMarkVowel(
      lessonController: this,
      taskController: markVowelController,
      task: markVowelController.getTask("A"),
    )); //1º task
    widgetsRouters.add(TaskSelectImage(
      task: selectImageController.getTask(listWordsA[0], "A"),
      taskController: selectImageController,
      lessonController: this,
    )); //2º task
    widgetsRouters.add(TaskSelectImage(
      task: selectImageController.getTask(listWordsA[1], "A"),
      taskController: selectImageController,
      lessonController: this,
    )); //3º task
    widgetsRouters.add(TaskVogalSelection(
      task: vogalSelectionController.getTaskA2(),
      lessonController: this,
      taskController: vogalSelectionController,
    )); //4º task
    widgetsRouters.add(TaskSelectImage(
      task: selectImageController.getTask(listWordsA[2], "A"),
      taskController: selectImageController,
      lessonController: this,
    )); //5º task
    widgetsRouters.add(TaskVogalSelection(
      task: vogalSelectionController.getTaskA1(),
      lessonController: this,
      taskController: vogalSelectionController,
    )); //6º task
    widgetsRouters.add(TaskSelectImage(
      task: selectImageController.getTask(listWordsA[3], "A"),
      taskController: selectImageController,
      lessonController: this,
    )); //7º task
    widgetsRouters.add(TaskCompleteWords(
      lessonController: this,
      task: completeWordController.getTask1(),
      taskController: completeWordController,
    )); //8º task
    widgetsRouters.add(CongratulationsPage(
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

  failure() {}

  @override
  reset() {
    nextPage = -1;
    correctAnswers = 0;
    wrongAnswers = 0;
    selectImageController.reset();
    markVowelController.reset();
    completeWordController.reset();
    vogalSelectionController.reset();
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
