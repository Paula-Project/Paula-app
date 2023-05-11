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

class LessonUController implements LessonControllerInterface {
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

  LessonUController({required this.moduleVowelsController}) {
    verifyisCompleted();
    List<Word> listWordsU = getRandomWords(["U"], 4);

    widgetsRouters.add(LessonIntroduction(
      letter: 'U',
      titleIntroduction: "Esta é a letra U, repita comigo LETRA U.",
      controller: this,
      audioUrl: 'paula_introduction_U.mp3',
    ));
    widgetsRouters.add(TaskWordsExemple(
      task: wordsExempleController.getTask("U"),
      lessonController: this,
    ));
    widgetsRouters.add(TaskMarkVowel(
      lessonController: this,
      taskController: markVowelController,
      task: markVowelController.getTask("U"),
    ));
    widgetsRouters.add(TaskSelectImage(
      task: selectImageController.getTask(listWordsU[0], "U"),
      taskController: selectImageController,
      lessonController: this,
    ));
    widgetsRouters.add(TaskSelectImage(
      task: selectImageController.getTask(listWordsU[1], "U"),
      taskController: selectImageController,
      lessonController: this,
    ));
    widgetsRouters.add(TaskSelectImage(
      task: selectImageController.getTask(listWordsU[2], "U"),
      taskController: selectImageController,
      lessonController: this,
    ));
    widgetsRouters.add(TaskSelectImage(
      task: selectImageController.getTask(listWordsU[3], "U"),
      taskController: selectImageController,
      lessonController: this,
    ));
    widgetsRouters.add(TaskSelectImage(
      task: selectImageController.getTask(listWordsU[0], "U"),
      taskController: selectImageController,
      lessonController: this,
    ));
    widgetsRouters.add(TaskVogalSelection(
      task: vogalSelectionController.getTaskA(),
      lessonController: this,
      taskController: vogalSelectionController,
    ));
    widgetsRouters.add(TaskCompleteWords(
      lessonController: this,
      task: completeWordController.getTask1(),
      taskController: completeWordController,
    ));
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
