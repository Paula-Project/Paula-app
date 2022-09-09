import 'package:flutter/material.dart';
import 'package:paula/app/model/word.dart';
import 'package:paula/app/model/words.dart';
import 'package:paula/app/views/components/CardImage.dart';
import 'package:paula/app/views/components/BoxDialog.dart';
import 'package:paula/app/views/components/task_progress.dart';

class TaskSelectImage extends StatefulWidget {
  const TaskSelectImage({Key? key}) : super(key: key);

  @override
  State<TaskSelectImage> createState() => _TaskSelectImageState();
}

class _TaskSelectImageState extends State<TaskSelectImage> {
  String cardSelected = "";
  String answer = "Árvore";
  Words words = Words();
  late List<Word> taskwords;

  void initState() {
    super.initState();
    taskwords = [
      words.words[5],
      words.words[6],
      words.words[4],
      words.words[7],
    ];
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
              top: 50.0, bottom: 50.0, left: 15.0, right: 15.0),
          child: Column(
            children: [
              TaskProgress(
                tasksNUmber: 5,
              ),
              const SizedBox(height: 20.0),
              Expanded(
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
                    Wrap(
                      spacing: 0,
                      runSpacing: 100,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: taskwords
                          .map(
                            (e) => CardImage(
                              imageUrl: "assets/images/${e.imagePath}",
                              scale: 5.0,
                              audioUrl: e.soundPath,
                              isSelected: cardSelected == e.text ? true : false,
                              onPress: () {
                                setState(() {
                                  cardSelected = e.text;
                                });
                              },
                            ),
                          )
                          .toList(),
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
                                      backgroundColor: cardSelected != ""
                                          ? MaterialStateProperty.all<Color>(
                                              Colors.blue)
                                          : MaterialStateProperty.all<Color>(
                                              Colors.grey),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              side: BorderSide.none))),
                                  child: const Text('VERIFICAR',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      )),
                                  onPressed: () {
                                    if (cardSelected != "") {
                                      showGeneralDialog(
                                        barrierColor:
                                            Colors.black.withOpacity(0.5),
                                        transitionDuration:
                                            const Duration(milliseconds: 300),
                                        barrierDismissible: false,
                                        barrierLabel: '',
                                        context: context,
                                        pageBuilder:
                                            (context, animation1, animation2) {
                                          return widget;
                                        },
                                        transitionBuilder:
                                            (context, a1, a2, widget) {
                                          final curvedValue = Curves.easeInOut
                                                  .transform(a1.value) -
                                              1;
                                          return Transform(
                                            transform:
                                                Matrix4.translationValues(0.0,
                                                    (curvedValue * -300), 0.0),
                                            child: Opacity(
                                              opacity: a1.value,
                                              child: BoxDialog(
                                                  feedback:
                                                      (cardSelected == answer)
                                                          ? true
                                                          : false,
                                                  resposta: answer),
                                            ),
                                          );
                                        },
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
            ],
          ),
        ),
      ),
    );
  }
}
