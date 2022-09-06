import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:paula/app/views/components/ButtonNext.dart';
import 'package:paula/app/views/components/CardImage.dart';
import '../components/BoxDialog.dart';
import '../home_page.dart';

class FirstTask extends StatefulWidget {
  const FirstTask({Key? key}) : super(key: key);

  @override
  State<FirstTask> createState() => _FirstTaskState();
}

class _FirstTaskState extends State<FirstTask> {
  AudioPlayer? audioPlayer;
  var cardSelected = 0;

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
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(
              top: 60.0, bottom: 40.0, left: 15.0, right: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                onPressed: () {
                  _runAudio("audios/marqueA.ogg");
                },
                child: Container(
                  height: (MediaQuery.of(context).size.height) * 0.17,
                  width: (MediaQuery.of(context).size.width) * 0.38,
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(37, 85, 124, 1),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: const FittedBox(
                    child: Icon(Icons.volume_up_outlined),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: <Widget>[
                      CardImage(
                        imageUrl: 'assets/alphabet/letter-a.png',
                        scale: 5.0,
                        audioUrl: '',
                        isSelected: cardSelected == 1 ? true : false,
                        onPress: () {
                          setState(() {
                            cardSelected = 1;
                          });
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      CardImage(
                        imageUrl: 'assets/alphabet/letter-e.png',
                        audioUrl: '',
                        scale: 5.0,
                        isSelected: cardSelected == 2 ? true : false,
                        onPress: () {
                          setState(() {
                            cardSelected = 2;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CardImage(
                        imageUrl: 'assets/alphabet/letter-i.png',
                        audioUrl: '',
                        scale: 5.0,
                        isSelected: cardSelected == 3 ? true : false,
                        onPress: () {
                          setState(() {
                            cardSelected = 3;
                          });
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      CardImage(
                        imageUrl: 'assets/alphabet/letter-o.png',
                        scale: 5.0,
                        audioUrl: '',
                        isSelected: cardSelected == 4 ? true : false,
                        onPress: () {
                          setState(() {
                            cardSelected = 4;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 30.0),
                child: Container(
                    width: 200,
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50.0,
                          width: 150.0,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                backgroundColor: cardSelected != 0
                                    ? MaterialStateProperty.all<Color>(
                                        Colors.blue)
                                    : MaterialStateProperty.all<Color>(
                                        Colors.grey),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: BorderSide.none))),
                            child: const Text('VERIFICAR',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                )),
                            onPressed: () {
                              if (cardSelected != 0) {
                                showDialog<String>(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) => BoxDialog(
                                      feedback:
                                          (cardSelected == 1) ? true : false,
                                      resposta: "A"),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
