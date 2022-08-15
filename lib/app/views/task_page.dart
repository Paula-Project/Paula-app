import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'home_page.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 100.0,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(37, 85, 124, 1),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "Qual imagem começa com a letra “A”:",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: const <Widget>[
                      AudioButton(),
                      CardImage('images/oculos.png', 5.0),
                    ],
                  ),
                  Column(
                    children: const <Widget>[
                      AudioButton(),
                      CardImage('images/uva.png', 6.0),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const AudioButton(),
                      MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              PageTransition(
                                  type: PageTransitionType.leftToRight,
                                  child: const HomePage()),
                              (route) => false);
                        },
                        child: const CardImage('images/arvore.png', 5.0),
                      ),
                    ],
                  ),
                  Column(
                    children: const <Widget>[
                      AudioButton(),
                      CardImage('images/escada.png', 6.0),
                    ],
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 30.0),
                child: SizedBox(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {},
                    onHover: (hover) {
                      print(hover);
                    },
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide.none)),
                    ),
                    child:
                        const Text("Avançar", style: TextStyle(fontSize: 20)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AudioButton extends StatefulWidget {
  const AudioButton({
    Key? key,
  }) : super(key: key);

  @override
  State<AudioButton> createState() => _AudioButtonState();
}

class _AudioButtonState extends State<AudioButton> {
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
        margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
        height: 30.00,
        width: 30.00,
        decoration: const BoxDecoration(
            color: Color.fromRGBO(37, 85, 124, 1),
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        child: const Icon(
          Icons.volume_up,
        ),
      ),
    );
  }
}

class CardImage extends StatelessWidget {
  const CardImage(this.imageUrl, this.scale, {Key? key}) : super(key: key);
  final String imageUrl;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: (MediaQuery.of(context).size.height) * 0.17,
        width: (MediaQuery.of(context).size.width) * 0.38,
        decoration: const BoxDecoration(
            color: Color.fromRGBO(209, 220, 221, 1),
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            )),
        child: Image.asset(
          imageUrl,
          scale: scale,
        ));
  }
}
