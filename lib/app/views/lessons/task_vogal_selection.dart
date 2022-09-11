import 'package:flutter/material.dart';
import 'package:paula/app/views/components/BoxDialog.dart';
import 'package:paula/app/views/lessons/task_page.dart';
import '../components/ButtonNext.dart';
import 'lesson_a.dart';

class TaskVogalSelection extends StatelessWidget {
  TaskVogalSelection({Key? key}) : super(key: key);

  var letterSelected = 0;

  get widget => null;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 100.0,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(37, 85, 124, 1),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: const Center(
              child: Padding(
                padding: EdgeInsets.all(28.0),
                child: Text(
                  "SELECIONE AS VOGAIS ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w300,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 200.0,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 194, 197, 199),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0, top: 12.0),
                  child: Container(
                      height: 87.0, child: Image.asset('images/escada.png')),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SelectLetterButton(
                        isSelected: letterSelected == 1 ? true : false,
                        onPress: () {
                          setState(() {
                            letterSelected = 1;
                          });
                        },
                        letter: 'E',
                      ),
                      SelectLetterButton(
                        isSelected: letterSelected == 2 ? true : false,
                        onPress: () {
                          setState(() {
                            letterSelected = 2;
                          });
                        },
                        letter: 'S',
                      ),
                      SelectLetterButton(
                        isSelected: letterSelected == 3 ? true : false,
                        onPress: () {
                          setState(() {
                            letterSelected = 3;
                          });
                        },
                        letter: 'C',
                      ),
                      SelectLetterButton(
                        isSelected: letterSelected == 4 ? true : false,
                        onPress: () {
                          setState(() {
                            letterSelected = 4;
                          });
                        },
                        letter: 'A',
                      ),
                      SelectLetterButton(
                        isSelected: letterSelected == 5 ? true : false,
                        onPress: () {
                          setState(() {
                            letterSelected = 5;
                          });
                        },
                        letter: 'D',
                      ),
                      SelectLetterButton(
                        isSelected: letterSelected == 6 ? true : false,
                        onPress: () {
                          setState(() {
                            letterSelected = 6;
                          });
                        },
                        letter: 'A',
                      ),
                    ])
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 200.0,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 194, 197, 199),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: Container(
                      height: 87.0, child: Image.asset('images/uva.png')),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SelectLetterButton(
                        isSelected: letterSelected == 7 ? true : false,
                        onPress: () {
                          setState(() {
                            letterSelected = 7;
                          });
                        },
                        letter: 'F',
                      ),
                      SelectLetterButton(
                        isSelected: letterSelected == 8 ? true : false,
                        onPress: () {
                          setState(() {
                            letterSelected = 8;
                          });
                        },
                        letter: 'A',
                      ),
                      SelectLetterButton(
                        isSelected: letterSelected == 9 ? true : false,
                        onPress: () {
                          setState(() {
                            letterSelected = 9;
                          });
                        },
                        letter: 'C',
                      ),
                      SelectLetterButton(
                        isSelected: letterSelected == 10 ? true : false,
                        onPress: () {
                          setState(() {
                            letterSelected = 10;
                          });
                        },
                        letter: 'A',
                      ),
                    ]),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: Container(
            height: 45.0,
            width: 200.0,
            child: ElevatedButton(
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide.none))),
              onPressed: () => {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (BuildContext context) => const Lesson(),
                  ),
                  (route) => false,
                ),
              },
              child: const Text('Confirmar',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  )),
            ),
          ),
        ),
      ],
    );
  }

  setState(Null Function() param0) {}
}

class SelectLetterButton extends StatefulWidget {
  final String letter;

  const SelectLetterButton({
    Key? key,
    required this.letter,
    required bool isSelected,
    required Null Function() onPress,
  }) : super(key: key);

  @override
  State<SelectLetterButton> createState() => _SelectLetterButtonState();
}

class _SelectLetterButtonState extends State<SelectLetterButton> {
  bool isSelected = false;

  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 40,
      margin: const EdgeInsets.all(5),
      child: TextButton(
        onPressed: () => {
          if (isSelected != 0)
            {
              showGeneralDialog(
                  barrierColor: Colors.black,
                  transitionDuration: const Duration(milliseconds: 500),
                  barrierDismissible: true,
                  barrierLabel: '',
                  context: context,
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return widget;
                  },
                  transitionBuilder: (context, a1, a2, widget) {
                    final curvedValue =
                        Curves.easeInOutBack.transform(a1.value) - 1.0;
                    return Transform(
                      transform: Matrix4.translationValues(
                          0.0, curvedValue * 200, 0.0),
                      child: Opacity(
                        opacity: a1.value,
                        child: BoxDialog(
                            feedback: (isSelected == 1) ? true : false,
                            resposta: 'Parabens!'),
                      ),
                    );
                  })
            }
        },
        style: TextButton.styleFrom(
          backgroundColor: isSelected ? Colors.blue : Colors.white70,
          primary: Colors.black,
          textStyle: const TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
        ),
        child: Text(widget.letter),
      ),
    );
  }
}
