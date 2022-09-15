import 'package:paula/app/controllers/lesson_AEU_controller.dart';
import 'package:paula/app/controllers/lesson_IO_controller.dart';

import 'lesson_final_controller.dart';

class ModuleVowelsController {
  final LessonAEUController lessonAEUController = LessonAEUController();
  final LessonIOController lessonIOController = LessonIOController();
  final LessonFinalController lessonFinalController = LessonFinalController();

  static bool isCompleted = false;

  void onCompleted() {
    isCompleted = true;
  }

  bool getCompleted() {
    return isCompleted;
  }


}