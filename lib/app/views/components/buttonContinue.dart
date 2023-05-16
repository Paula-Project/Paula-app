import 'package:flutter/material.dart';
import 'package:paula/app/controllers/lessons/lesson_controller_interface.dart';

class ButtonContinue extends StatelessWidget {
  final LessonControllerInterface lessonController;
  const ButtonContinue({
    Key? key,
    required this.lessonController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      width: 150.0,
      child: ElevatedButton(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide.none))),
        child: const Text('CONTINUAR',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            )),
        onPressed: () async {
          print("onpressed introduction");
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (BuildContext context) => lessonController.nextTask(),
            ),
            (route) => false,
          );
        },
      ),
    );
  }
}
