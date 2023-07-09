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
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
            alignment: Alignment.center,
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide.none))),
        child: const Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.0),
          child:  Text('CONTINUAR',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                
              )),
        ),
        onPressed: () async {
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
