import 'package:paula/app/controllers/tasks/task_controller.dart';
import 'package:paula/app/model/itapoa_words.dart';
import 'package:paula/app/model/task_itapoa_tour_model.dart';

class TaskItapoaTourController extends TaskController {
  late TaskItapoaTourModel taskFood;
  late TaskItapoaTourModel taskPasseioPonte;
  late TaskItapoaTourModel taskPasseio;
  ItapoaWords words = ItapoaWords();

  TaskItapoaTourController() {
    taskFood = TaskItapoaTourModel(
      title: "Quando estou com fome, penso logo em ir à:",
      audioPath: "paula_paranoaFome.mp3",
      words: [words.wordsList[1], words.wordsList[0]],
    );
    taskPasseio = TaskItapoaTourModel(
      title: "Quando quero passear, eu pego logo um:",
      audioPath: "audio_pegar_onibus.mp3",
      words: [words.wordsList[3]],
    );
    taskPasseioPonte = TaskItapoaTourModel(
      title: "Para chegar ao Itapoã eu passo pela:",
      audioPath: "passar_pela_ponte.mp3",
      words: [words.wordsList[4]],
    );
  }
  TaskItapoaTourModel getTaskFood() {
    return taskFood;
  }

  TaskItapoaTourModel getTaskPasseio() {
    return taskPasseio;
  }

  TaskItapoaTourModel getPasseioPonte() {
    return taskPasseioPonte;
  }
}
