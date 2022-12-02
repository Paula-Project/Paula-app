import 'package:paula/app/controllers/lesson_AEU_controller.dart';
import 'package:paula/app/controllers/lesson_IO_controller.dart';
import 'package:paula/app/http/webclient.dart';
import 'package:paula/app/model/usuarioAPI.dart';
import 'package:paula/app/state/usuario_state.dart';
import 'package:provider/provider.dart';

import 'lesson_final_controller.dart';

class ModuleVowelsController {
  late final LessonAEUController lessonAEUController;
  late final LessonIOController lessonIOController;
  late final LessonFinalController lessonFinalController;

  static bool isCompleted = false;
  ModuleVowelsController() {
    lessonFinalController = LessonFinalController(moduleVowelsController: this);
    lessonAEUController = LessonAEUController(moduleVowelsController: this);
    lessonIOController = LessonIOController(moduleVowelsController: this);
  }
  setModuleVowelsCompleted(UsuarioAPI user, context) async {
    print("setCompleted");
    try {
      user.progress = 10;
      var atualUser = Provider.of<UsuarioState>(context, listen: false);
      var progress = await addProgress(user.username);
      atualUser.progressUpdate(user, progress);
    } catch (error) {
      print(error);
    }
    isCompleted = true;
  }

  bool getCompleted(UsuarioAPI? user) {
    if (user!.progress >= 10) {
      isCompleted = true;
      lessonAEUController.isCompleted = true;
      lessonIOController.isCompleted = true;
      lessonFinalController.isCompleted = true;
      return true;
    } else {
      return false;
    }
  }

  void verfifyLessonsCompleted() {
    lessonAEUController.onCompleted();
    lessonIOController.onCompleted();
    lessonFinalController.onCompleted();
  }
}
