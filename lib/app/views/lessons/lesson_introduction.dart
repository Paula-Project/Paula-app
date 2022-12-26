import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:paula/app/controllers/lesson_controller_interface.dart';
import 'package:paula/app/views/components/DIalogTextBoxDown.dart';
import 'package:paula/app/views/components/exitDialog.dart';

class LessonIntroduction extends StatefulWidget {
  final String letter;
  final String titleIntroduction;
  final LessonControllerInterface controller;
  final String audioUrl;

  const LessonIntroduction(
      {Key? key,
      required this.letter,
      required this.titleIntroduction,
      required this.controller,
      required this.audioUrl})
      : super(key: key);

  @override
  State<LessonIntroduction> createState() => _LessonIntroductionState();
}

class _LessonIntroductionState extends State<LessonIntroduction> with WidgetsBindingObserver {
  //final _timer =   Timer(const Duration(seconds: 5), () => {Get.to(const Lesson())});
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
    WidgetsBinding.instance.addObserver(this);
    audioPlayer = AudioPlayer();
    _runAudio("audios/paula/${widget.audioUrl}");
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached) {
      audioPlayer?.pause();      
      return;
    } else if (state == AppLifecycleState.resumed) {
      audioPlayer?.resume();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (() => exitDialog(context)),
      child: Material(
        child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Container(
                      alignment: Alignment.topCenter,
                      height: MediaQuery.of(context).size.height * 0.45,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(37, 85, 124, 1),
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      child: Center(
                        child: Text(
                          widget.letter,
                          style: const TextStyle(fontSize: 200.0),
                        ),
                      )),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child:
                      DialogTextBoxDown(TextContent: widget.titleIntroduction),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Expanded(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        alignment: Alignment.bottomCenter,
                        width: (MediaQuery.of(context).size.width),
                        height: 275,
                        child: Image.asset(
                          'assets/images/paula/paula03.png',
                          scale: 1,
                        ),
                      ),
                      Positioned(
                        bottom: 30,
                        right: 30,
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: const BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          child: Center(
                            child: IconButton(
                              color: Colors.white,
                              iconSize: 40,
                              icon: const Icon(
                                Icons.arrow_forward_outlined,
                              ),
                              onPressed: () async {
                                audioPlayer?.stop();
                                Navigator.of(context).pushAndRemoveUntil(
                                    PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: widget.controller.nextTask()),
                                    (route) => false);
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
