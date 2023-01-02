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
      titleAudioPath: "paula_selectionImage_A.mp3",
      words: [words.words[40], words.words[41]],
    );
    taskSunday = TaskParanoaTourModel(
      title: "Todo domingo gosto de ir à:",
      titleAudioPath: "paula_selectionImage_A.mp3",
      words: [words.words[40], words.words[41]],
    );
    taskColors = TaskParanoaTourModel(
      title: "O paranoá é um lugar muito colorido, pois aqui temos:",
      titleAudioPath: "paula_selectionImage_A.mp3",
      words: [words.words[40], words.words[42]],
    );
    taskDurst = TaskParanoaTourModel(
      title: "Sempre que estou com sede, tenho muitas distribuidoras para ir:",
      titleAudioPath: "paula_selectionImage_A.mp3",
      words: [words.words[39], words.words[41]],
    );
    taskLake = TaskParanoaTourModel(
      title: "Quando estou com calor, vou sempre no lago paranoá:",
      titleAudioPath: "paula_selectionImage_A.mp3",
      words: [words.words[40], words.words[43]],
    );
  }
  TaskParanoaTourModel getTaskFood() {
    return taskFood;
  }

  TaskParanoaTourModel getTaskSunda() {
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
