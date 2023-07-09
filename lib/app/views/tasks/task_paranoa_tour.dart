import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:paula/app/controllers/lessons/lesson_controller_interface.dart';
import 'package:paula/app/model/task_paranoa_tour_model.dart';
import 'package:paula/app/views/components/CardParanoaTour.dart';
import 'package:paula/app/views/components/audioManager.dart';
import 'package:paula/app/views/components/buttonContinue.dart';
import 'package:paula/app/views/layout/task_layout.dart';

class TaskParanoaTour extends StatefulWidget {
  final LessonControllerInterface lessonController;
  final TaskParanoaTourModel task;
  const TaskParanoaTour({
    super.key,
    required this.lessonController,
    required this.task,
  });

  @override
  State<TaskParanoaTour> createState() => _TaskParanoaTourState();
}

class _TaskParanoaTourState extends State<TaskParanoaTour>
    with WidgetsBindingObserver {
  AudioManager audioManager = AudioManager();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    audioManager.runAudio("audios/paula/${widget.task.audioPath}");
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    audioManager.stopAudio();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    audioManager.didLifecycleChange(state);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return TaskLayout(
      shouldPop: true,
      paddingDefault: false,
      taskProgress: Container(),
      body: Material(
          color: Colors.white,
          child: Container(
            width: width,
            height: height,
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/images/paula/paula09.png",
                      width: width * 0.38,
                    ),
                    MaterialButton(
                      onPressed: () {
                        audioManager.runAudio(
                            "audios/paula/${widget.task.audioPath}");
                      },
                      padding: EdgeInsets.zero,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: ClipPath(
                              clipper: CustomTriangleClipper(),
                              child: Container(
                                width: 20,
                                height: 30,
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(199, 37, 85, 124)),
                              ),
                            ),
                          ),
                          Stack(children: [
                            Container(
                              width: (width - 30) / 2,
                              height: height * 0.22,
                              padding: const EdgeInsets.all(10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(199, 37, 85, 124),
                                  borderRadius: BorderRadius.circular(10)),
                              child: AutoSizeText(
                                widget.task.title,
                                textScaleFactor: 1,
                                style: const TextStyle(
                                  fontSize: 22, 
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                                )),
                            ),
                            const Positioned(
                              right: 10,
                              bottom: 10,
                              child: Icon(
                                Icons.spatial_audio_off_sharp,
                                color: Colors.white,
                              ),
                            )
                          ]),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: widget.task.words
                      .map(
                        (e) => CardParanoaTour(
                          width: width,
                          height: height,
                          word: e,
                          audioManager: audioManager,
                        ),
                      )
                      .toList(),
                ),
                
                ButtonContinue(lessonController: widget.lessonController),
                
              ],
            ),
          )),
    );
  }
}

class CustomTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(size.width, size.height / 1.5);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
