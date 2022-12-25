import 'package:paula/app/controllers/task_controller.dart';
import 'package:paula/app/model/task_model.dart';

abstract class LessonControllerInterface {
  nextTask();
  verifyAnswer(TaskModel task, TaskController taskController);
  getTaskQuantity();
  getTaskCorrectAnswers();
  verifyAnswerNonControlled();
}
