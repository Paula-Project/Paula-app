import 'package:flutter/widgets.dart';
import 'package:paula/app/controllers/task_select_image_controller.dart';
import 'package:paula/app/model/task_select_image_model.dart';

class ModuleVogalController {
  late TaskSelectImageController selectImageController;

  ModuleVogalController() {
    selectImageController = TaskSelectImageController();
  }

  void lessonX() {
    int correct_answers = 0;
    int tasks_quantity = 0;

    List tasks = [
      selectImageController.getVogaisA(),
      selectImageController.getVogaisE()
    ];

    for (TaskSelectImageModel task in tasks) {
      if (task.isCorrect) {
        correct_answers++;
      }
    }
  }

  void LessonY() {}
  void LessonZ() {}
}
