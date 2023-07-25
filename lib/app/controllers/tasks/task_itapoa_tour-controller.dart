import 'package:paula/app/controllers/tasks/task_controller.dart';
import 'package:paula/app/model/paranoa_words.dart';
import 'package:paula/app/model/task_itapoa_tour_model.dart';
import 'package:paula/app/model/task_paranoa_tour_model.dart';

class TaskParanoaTourController extends TaskController {
  late TaskItapoaTourModel taskFood;
  late TaskItapoaTourModel taskColors;
  late TaskItapoaTourModel taskSunday;
  late TaskItapoaTourModel taskDurst;
  late TaskItapoaTourModel taskLake;
  ParanoaWords words = ParanoaWords();

  TaskParanoaTourController() {
    taskFood = TaskItapoaTourModel(
      title: "Quando estou com fome, penso logo em ir à:",
      audioPath: "paula_paranoaFome.mp3",
      words: [words.wordsList[1], words.wordsList[4]],
    );
    taskSunday = TaskItapoaTourModel(
      title: "Todo domingo gosto de ir à:",
      audioPath: "paula_paranoaDomingo.mp3",
      words: [words.wordsList[8], words.wordsList[11]],
    );
    taskColors = TaskItapoaTourModel(
      title: "O paranoá é um lugar muito colorido, pois aqui temos:",
      audioPath: "paula_paranoaColorido.mp3",
      words: [words.wordsList[2], words.wordsList[10]],
    );
    taskDurst = TaskItapoaTourModel(
      title: "Sempre que estou com sede, tenho muitas distribuidoras para ir:",
      audioPath: "paula_paranoaDistribuidoras.mp3",
      words: [words.wordsList[5], words.wordsList[9]],
    );
    taskLake = TaskItapoaTourModel(
      title: "Quando estou com calor, vou sempre no lago paranoá:",
      audioPath: "paula_paranoaLago.mp3",
      words: [words.wordsList[7]],
    );
  }
  TaskItapoaTourModel getTaskFood() {
    return taskFood;
  }

  TaskItapoaTourModel getTaskSunday() {
    return taskSunday;
  }

  TaskItapoaTourModel getTaskColors() {
    return taskColors;
  }

  TaskItapoaTourModel getTaskDurst() {
    return taskDurst;
  }

  TaskItapoaTourModel getTaskLake() {
    return taskLake;
  }
}
