import 'package:flutter/material.dart';
import 'package:paula/app/controllers/task_select_image_controller.dart';
import 'package:paula/app/views/lessons/task_select_image.dart';

class ModuleVogalController extends ChangeNotifier {
  late TaskSelectImageController selectImageController;

  ModuleVogalController() {
    selectImageController = TaskSelectImageController();
  }

  lessonX(context) {
    int correct_answers = 0;
    int tasks_quantity = 0;

    List tasksWidgets = [];

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (BuildContext context) => tasksWidgets[0],
      ),
      (route) => false,
    );
  }
}
