import 'package:audioplayers/audioplayers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CardExemple extends StatefulWidget {
  final String imageUrl;
  final String nameTxt;
  final String audioUrl;
  final List<String> letters;

  const CardExemple({
    Key? key,
    required this.imageUrl,
    required this.nameTxt,
    required this.audioUrl,
    required this.letters,
  }) : super(key: key);

  @override
  State<CardExemple> createState() => _CardExempleState();
}

class _CardExempleState extends State<CardExemple> {
  AudioPlayer? audioPlayer;

  _runAudio(String path) async {
    try {
      await audioPlayer?.play(AssetSource(path));
    } catch (error) {
      print(error.toString());
    }
  }

  @override
  void initState() {
    audioPlayer = AudioPlayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () async {
        _runAudio("audios/words/${widget.audioUrl}");
      },
      highlightColor: Color.fromARGB(167, 3, 168, 244),
      color: const Color.fromRGBO(209, 220, 221, 1),
      disabledElevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Container(
          height: 100.0,
          width: double.infinity,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 00.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: SizedBox(
                      height: 100, child: Image.asset(widget.imageUrl)),
                ),
                const SizedBox(width: 15),
                Expanded(
                  flex: 8,
                  child: SizedBox(
                    width: double.infinity,
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: widget.nameTxt.runes
                          .map(
                            (int rune) => AutoSizeText(
                              String.fromCharCode(rune).toUpperCase(),
                              textScaleFactor: 1,
                              maxFontSize: 30,
                              minFontSize: 20,
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900,
                                  color: widget.letters.any((element) =>
                                          String.fromCharCode(rune)
                                              .toUpperCase() ==
                                          element)
                                      ? const Color.fromARGB(255, 76, 163, 175)
                                      : Colors.white,
                                  letterSpacing: 5.0,
                                  decoration: widget.letters.any((element) =>
                                          String.fromCharCode(rune)
                                              .toUpperCase() ==
                                          element)
                                      ? TextDecoration.underline
                                      : TextDecoration.none),
                            ),
                          )
                          .toList(),
                    )),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
