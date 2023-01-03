import 'package:flutter/material.dart';
import 'package:paula/app/controllers/lesson_controller_interface.dart';
import 'package:paula/app/views/components/audioManager.dart';

class LessonButton extends StatelessWidget {
  final String textContent;
  final bool isActive;
  final LessonControllerInterface lessonController;
  final AudioManager audioManager;
  const LessonButton({
    Key? key,
    required this.textContent,
    required this.isActive,
    required this.lessonController,
    required this.audioManager,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      child: SizedBox(
        width: 350,
        height: 100,
        child: ElevatedButton(
          onPressed: () {
            if (isActive) {
              lessonController.reset();
              audioManager.stopAudio();
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        lessonController.nextTask()),
                (route) => false,
              );
            }
          },
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: isActive
                ? MaterialStateProperty.all<Color>(Colors.blue)
                : MaterialStateProperty.all<Color>(Colors.grey),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide.none)),
          ),
          child: Text(textContent, style: const TextStyle(fontSize: 30)),
        ),
      ),
    );
  }
}
