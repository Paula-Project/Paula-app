import 'package:paula/app/controllers/lessons/lesson_A_controller.dart';
import 'package:paula/app/controllers/lessons/lesson_E_controller.dart';
import 'package:paula/app/controllers/lessons/lesson_I_controller.dart';
import 'package:paula/app/controllers/lessons/lesson_O_controller.dart';
import 'package:paula/app/controllers/lessons/lesson_U_controller.dart';
import 'package:paula/app/http/webclient.dart';
import 'package:paula/app/model/usuarioAPI.dart';
import 'package:paula/app/state/usuario_state.dart';
import 'package:provider/provider.dart';

import '../lessons/lesson_final_controller.dart';

class ModuleVowelsController {
  late final LessonAController lessonAController;
  late final LessonEController lessonEController;
  late final LessonIController lessonIController;
  late final LessonOController lessonOController;
  late final LessonUController lessonUController;
  late final LessonFinalController lessonFinalController;

  static bool isCompleted = false;
  ModuleVowelsController() {
    lessonFinalController = LessonFinalController(moduleVowelsController: this);
    lessonAController = LessonAController(moduleVowelsController: this);
    lessonEController = LessonEController(moduleVowelsController: this);
    lessonIController = LessonIController(moduleVowelsController: this);
    lessonOController = LessonOController(moduleVowelsController: this);
    lessonUController = LessonUController(moduleVowelsController: this);
  }
  setModuleCompleted(context) async {
    var usuarioState = Provider.of<UsuarioState>(context, listen: false);
    UsuarioAPI user = usuarioState.getUsuario();
    if (user.progress >= 10) return;
    try {
      var progress = await addProgress(user.username);
      usuarioState.progressUpdate(user, progress);
    } catch (error) {
      print(error);
    }
    isCompleted = true;
  }

  bool getCompleted(UsuarioAPI? user) {
    if (user!.progress >= 10) {
      isCompleted = true;
      lessonAController.isCompleted = true;
      lessonEController.isCompleted = true;
      lessonIController.isCompleted = true;
      lessonOController.isCompleted = true;
      lessonUController.isCompleted = true;
      lessonFinalController.isCompleted = true;
      return true;
    } else {
      return false;
    }
  }

  void verfifyLessonsCompleted() {
    lessonAController.onCompleted();
    lessonEController.onCompleted();
    lessonIController.onCompleted();
    lessonOController.onCompleted();
    lessonUController.onCompleted();
    lessonFinalController.onCompleted();
  }
}
