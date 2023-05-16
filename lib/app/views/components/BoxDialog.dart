import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:paula/app/controllers/lessons/lesson_controller_interface.dart';

class BoxDialog extends StatefulWidget {
  final String resposta;
  final bool feedback;
  final LessonControllerInterface controller;

  const BoxDialog(
      {Key? key,
      required this.feedback,
      required this.resposta,
      required this.controller})
      : super(key: key);

  @override
  State<BoxDialog> createState() => _BoxDialogState();
}

class _BoxDialogState extends State<BoxDialog> {
  final AudioPlayer? audioPlayer = AudioPlayer();

  _runAudio(String path) async {
    try {
      await audioPlayer?.play(AssetSource(path));
    } catch (error) {
      print(error.toString());
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.feedback) {
        _runAudio("audios/sucess_sound.mp3");
      } else {
        _runAudio("audios/failed_sound.mp3");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String message = 'VOCÊ ACERTOU!';
    String messageButton = 'CONTINUAR';
    Color color = Colors.green;
    double padding = 15.0;

    if (!widget.feedback) {
      message = widget.resposta == '' ? "" : 'Resposta: ${widget.resposta}';
      messageButton = 'CONTINUAR';
      color = Colors.red;
      padding = 0;
    }
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      insetPadding: EdgeInsets.zero,
      contentPadding: widget.resposta == '' && !widget.feedback
          ? const EdgeInsets.only(top: 0.0)
          : const EdgeInsets.only(top: 25.0),
      backgroundColor: widget.resposta == '' && !widget.feedback
          ? const Color.fromRGBO(255, 255, 255, 0.75)
          : Colors.white,
      alignment: Alignment.bottomCenter,
      actionsAlignment: MainAxisAlignment.center,
      semanticLabel: "dialog",
      content: Builder(
        builder: (context) {
          var width = MediaQuery.of(context).size.width;

          return Container(
            width: width,
            color: Colors.transparent,
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: color, fontSize: 30, fontWeight: FontWeight.bold),
            ),
          );
        },
      ),
      actionsPadding: widget.resposta == '' && !widget.feedback
          ? const EdgeInsets.only(bottom: 20)
          : const EdgeInsets.all(20),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: widget.controller.nextTask()),
                (route) => false);
          },
          style: ButtonStyle(
            padding: MaterialStateProperty.resolveWith(
                (states) => const EdgeInsets.fromLTRB(50, 20, 50, 20)),
            backgroundColor: MaterialStateColor.resolveWith((states) => color),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: BorderSide.none)),
          ),
          child: Text(
            messageButton,
            style: const TextStyle(fontSize: 25),
          ),
        ),
      ],
    );
  }
}
