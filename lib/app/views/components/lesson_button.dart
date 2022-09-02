import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../lessons/lesson_introduction.dart';

class LessonButton extends StatelessWidget {
  final String textContent;
  final bool isActive;
  final Widget lessonPage;

  LessonButton({
    Key? key,
    required this.textContent,
    required this.isActive,
    required this.lessonPage,
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
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade, child: lessonPage));
            }
          },
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: isActive
                ? MaterialStateProperty.all<Color>(Colors.blue)
                : MaterialStateProperty.all<Color>(Colors.white70),
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
