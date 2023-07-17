import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:paula/app/model/word.dart';
import 'package:paula/app/views/components/audioManager.dart';

class CardParanoaTour extends StatelessWidget {
  const CardParanoaTour({
    Key? key,
    required this.width,
    required this.height,
    required this.word,
    required this.audioManager,
  }) : super(key: key);

  final double width;
  final double height;
  final Word word;
  final AudioManager audioManager;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(199, 37, 85, 124),
        ),
        margin: const EdgeInsets.only(bottom: 10),
        child: MaterialButton(
          onPressed: () {
            audioManager.runAudio("audios/words/${word.soundPath}");
          },
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              Image.asset(
                "assets/images/words/${word.imagePath}",
                fit: BoxFit.fitHeight,
                width: width - 80,
                height: height * 0.13,
              ),
              AutoSizeText(word.text,
                  textAlign: TextAlign.center,
                  textScaleFactor: 1,
                  style: const TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
      const Positioned(
        right: 15,
        bottom: 20,
        child: Icon(
          Icons.spatial_audio_off_sharp,
          color: Colors.white,
        ),
      )
    ]);
  }
}
