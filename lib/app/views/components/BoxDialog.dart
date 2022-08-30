import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:paula/app/views/lessons/congratulations_page.dart';

class BoxDialog extends StatefulWidget {
  BoxDialog({Key? key, required this.feedback, required this.resposta})
      : super(key: key);

  final String resposta;
  final bool feedback;

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
      message = 'Incorreto \n Resposta: ${widget.resposta}';
      messageButton = 'TENTAR DE NOVO';
      color = Colors.red;
      padding = 0;
    }

    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      insetPadding: EdgeInsets.zero,
      buttonPadding: const EdgeInsets.all(25.0),
      contentPadding: const EdgeInsets.only(top: 25.0),
      backgroundColor: Colors.white,
      alignment: Alignment.bottomCenter,
      actionsAlignment: MainAxisAlignment.center,
      semanticLabel: "dialogg",
      content: Builder(
        builder: (context) {
          // Get available height and width of the build area of this widget. Make a choice depending on the size.
          var height = MediaQuery.of(context).size.height;
          var width = MediaQuery.of(context).size.width;

          return Container(
            padding: EdgeInsets.only(top: padding),
            width: width,
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: color, fontSize: 30, fontWeight: FontWeight.bold),
            ),
          );
        },
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (BuildContext context) => const CongratulationsPage(),
              ),
              (route) => false,
            );
          },
          style: ButtonStyle(
            padding: MaterialStateProperty.resolveWith(
                (states) => EdgeInsets.fromLTRB(50, 20, 50, 20)),
            backgroundColor: MaterialStateColor.resolveWith((states) => color),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: BorderSide.none)),
          ),
          child: Text(
            messageButton,
            style: TextStyle(fontSize: 25),
          ),
        ),
      ],
    );
  }
}
