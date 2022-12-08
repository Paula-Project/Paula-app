import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class CardExemple extends StatefulWidget {
  final String imageUrl;
  final String nameTxt;
  final String audioUrl;

  const CardExemple({
    Key? key,
    required this.imageUrl,
    required this.nameTxt,
    required this.audioUrl,
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
      focusColor: Color.fromARGB(255, 104, 106, 106),
      child: Container(
          height: 100.0,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Color.fromRGBO(209, 220, 221, 1),
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 00.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: SizedBox(
                      height: 100, child: Image.asset(widget.imageUrl)),
                ),
                Expanded(
                  flex: 8,
                  child: SizedBox(
                    width: double.infinity,
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: widget.nameTxt.runes
                            .map(
                              (int rune) => Text(
                                String.fromCharCode(rune).toUpperCase(),
                                style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w900,
                                    color: String.fromCharCode(rune)
                                                    .toUpperCase() ==
                                                'A' ||
                                            String.fromCharCode(rune)
                                                    .toUpperCase() ==
                                                "Á" ||
                                            String.fromCharCode(rune)
                                                    .toUpperCase() ==
                                                "Ã"
                                        ? Color.fromARGB(255, 76, 163, 175)
                                        : Colors.white,
                                    letterSpacing: 5.0,
                                    decoration: String.fromCharCode(rune)
                                                    .toUpperCase() ==
                                                'A' ||
                                            String.fromCharCode(rune)
                                                    .toUpperCase() ==
                                                "Á" ||
                                            String.fromCharCode(rune)
                                                    .toUpperCase() ==
                                                "Ã"
                                        ? TextDecoration.underline
                                        : TextDecoration.none),
                              ),
                            )
                            .toList(),
                      ),
                    )),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
