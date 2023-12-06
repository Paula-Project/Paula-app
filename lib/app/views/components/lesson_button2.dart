import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:paula/app/controllers/lessons/lesson_controller_interface.dart';
import 'package:paula/app/views/components/audioManager.dart';

class LessonButton2 extends StatelessWidget {
  final String textContent;
  final bool isActive;
  final LessonControllerInterface lessonController;
  final AudioManager audioManager;
  final String? imgPath;
  const LessonButton2({
    Key? key,
    required this.textContent,
    required this.isActive,
    required this.lessonController,
    required this.audioManager,
    this.imgPath
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
                ? MaterialStateProperty.all<Color>(Colors.deepOrange)
                : MaterialStateProperty.all<Color>(Colors.grey),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide.none)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (imgPath != null)
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Image.asset(
                    imgPath ?? '',
                    width: 120, 
                    height: 120,
                  ),
                ),
              Expanded(
                child: AutoSizeText(
                  textContent,
                  textScaleFactor: 1,
                  style: const TextStyle(
                    fontSize: 26,
                  ),
                  minFontSize: 15,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
