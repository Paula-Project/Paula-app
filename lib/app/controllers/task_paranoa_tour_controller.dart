import 'package:paula/app/controllers/task_controller.dart';
import 'package:paula/app/model/task_paranoa_tour_model.dart';
import 'package:paula/app/model/words.dart';

class TaskParanoaTourController extends TaskController {
  late TaskParanoaTourModel taskFood;
  late TaskParanoaTourModel taskColors;
  late TaskParanoaTourModel taskSunday;
  late TaskParanoaTourModel taskDurst;
  late TaskParanoaTourModel taskLake;
  Words words = Words();

  TaskParanoaTourController() {
    taskFood = TaskParanoaTourModel(
      title: "Quando estou com fome, penso logo em ir à:",
      audioPath: "paula_paranoaFome.mp3",
      words: [words.wordsList[1], words.wordsList[4]],
    );
    taskSunday = TaskParanoaTourModel(
      title: "Todo domingo gosto de ir à:",
      audioPath: "paula_paranoaDomingo.mp3",
      words: [words.wordsList[8], words.wordsList[11]],
    );
    taskColors = TaskParanoaTourModel(
      title: "O paranoá é um lugar muito colorido, pois aqui temos:",
      audioPath: "paula_paranoaColorido.mp3",
      words: [words.wordsList[2], words.wordsList[10]],
    );
    taskDurst = TaskParanoaTourModel(
      title: "Sempre que estou com sede, tenho muitas distribuidoras para ir:",
      audioPath: "paula_paranoaDistribuidoras.mp3",
      words: [words.wordsList[5], words.wordsList[9]],
    );
    taskLake = TaskParanoaTourModel(
      title: "Quando estou com calor, vou sempre no lago paranoá:",
      audioPath: "paula_paranoaLago.mp3",
      words: [words.wordsList[7]],
    );
  }
  TaskParanoaTourModel getTaskFood() {
    return taskFood;
  }

  TaskParanoaTourModel getTaskSunday() {
    return taskSunday;
  }

  TaskParanoaTourModel getTaskColors() {
    return taskColors;
  }

  TaskParanoaTourModel getTaskDurst() {
    return taskDurst;
  }

  TaskParanoaTourModel getTaskLake() {
    return taskLake;
  }
}
