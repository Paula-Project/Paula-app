import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Lesson extends StatefulWidget {
  const Lesson({Key? key}) : super(key: key);

  @override
  State<Lesson> createState() => _LessonState();
}

class _LessonState extends State<Lesson> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 60.0, horizontal: 25.0),
            child: Column(
              children: [
                Container(
                  height: 100.0,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(37, 85, 124, 1),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0),
                          bottomLeft: Radius.circular(15.0),
                          bottomRight: Radius.circular(15.0))),
                  child: Center(
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        "Aqui estão alguns exemplos de objetos com “A”:",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                const LessonCard(
                    imageUrl: 'assets/images/lata.png', nameTxt: "L A T A"),
                const SizedBox(
                  height: 40,
                ),
                const LessonCard(
                    imageUrl: 'assets/images/plane.png', nameTxt: "A V I Ã O"),
                const SizedBox(
                  height: 40,
                ),
                const LessonCard(
                    imageUrl: 'assets/images/pineapple.png',
                    nameTxt: "A B A C A X I"),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: SizedBox(
                    width: 180,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide.none))),
                      child: const Text('AVANÇAR',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          )),
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.leftToRight,
                                child: const Lesson()));
                      },
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class LessonCard extends StatefulWidget {
  final String imageUrl;
  final String nameTxt;

  const LessonCard({
    Key? key,
    required this.imageUrl,
    required this.nameTxt,
  }) : super(key: key);

  @override
  State<LessonCard> createState() => _LessonCardState();
}

class _LessonCardState extends State<LessonCard> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();

    setAudio();

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.PLAYING;
      });
    });
  }

  Future setAudio() async {
    /* final player = AudioCache(prefix: "audios/");
    final url = await player.load("lata.mp3");
    await audioPlayer.setUrl(
        "https://soarvoice-storage-proxy.b-cdn.net/api/v1/audio-optmizer/?source=https://nyc3.digitaloceanspaces.com/soar-storage/media-storage/e/em/emersonteles21@gmail.com/Soar-paula-93akk.mp3&speed=0.9",
        isLocal: false);*/
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () async {
        await audioPlayer.play(
            'https://soarvoice-storage-proxy.b-cdn.net/api/v1/audio-optmizer/?source=https://nyc3.digitaloceanspaces.com/soar-storage/media-storage/e/em/emersonteles21@gmail.com/Soar-paula-93akk.mp3&speed=0.9');
      },
      child: Container(
          height: 120.0,
          decoration: const BoxDecoration(
              color: Color.fromRGBO(209, 220, 221, 1),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0))),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 00.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                      height: 120, child: Image.asset(widget.imageUrl)),
                ),
                Expanded(
                  flex: 8,
                  child: Container(
                    width: double.infinity,
                    child: Center(
                      child: Text(widget.nameTxt,
                          style: TextStyle(
                              fontSize: 40.0, fontWeight: FontWeight.w900)),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
