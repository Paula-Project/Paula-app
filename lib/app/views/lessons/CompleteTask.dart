

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/BoxDialog.dart';

class CompleteTask extends StatefulWidget {
  const CompleteTask({Key? key}) : super(key: key);

  @override
  State<CompleteTask> createState() => _CompleteTaskState();
}

class _CompleteTaskState extends State<CompleteTask> {
  @override

  int qtdTargets = 6;
  int targetsCompletos = 0;



  Widget NoDraggableLetter(letter)=> Container(
    width: MediaQuery.of(context).size.width*0.14,
    height: MediaQuery.of(context).size.height*0.08,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      color: Color.fromRGBO(209, 220, 221, 1),
    ),
    child: Text(letter,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
    ),
  );


  Widget Target(letterReceived,bool accepted)=> DragTarget<String>(

    builder: (BuildContext context, List<Object?> candidateData, List<dynamic> rejectedData) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Container(
          width: MediaQuery.of(context).size.width*0.14,
          height: MediaQuery.of(context).size.height*0.06,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Color.fromRGBO(37, 85, 124, 1),
          ),
          child: accepted == true ? LetterBox(letterReceived) : LetterBox(''),

        ),
      );

    },
    onAccept: (letter){

        accepted = true;
        letterReceived = letter;
        targetsCompletos = targetsCompletos +1;


    },
    onWillAccept: (letter) {
      return letter == letterReceived ? true : false;
    },

  );





  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 15.0),
          child: Column(

            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(

                  height: MediaQuery.of(context).size.height*0.1,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(37, 85, 124, 1),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        "Complete as palavras:",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(209, 220, 221, 1),
                      borderRadius: BorderRadius.all(Radius.circular(15))
                  ),

                  height: MediaQuery.of(context).size.height*0.5,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: SizedBox(
                                height: 120,
                                child:
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Image.asset('images/bola.png'),
                                ),
                          ),
                          ),
                           Expanded(
                            flex: 8,
                            child: SizedBox(
                              width: double.infinity,
                              child: Row(
                                children: [

                                  NoDraggableLetter('B'),
                                  Target('O',false),
                                  NoDraggableLetter('L'),
                                  Target('A',false),


                                ],
                              ),
                            ),
                          ),
                        ],

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: SizedBox(
                              height: 120,
                              child:
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Image.asset('images/lata.png'),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 8,
                            child: SizedBox(
                              width: double.infinity,
                              child: Row(
                                children: [

                                  NoDraggableLetter('L'),
                                  Target('A',false),
                                  NoDraggableLetter('T'),
                                  Target('A',false),


                                ],
                              ),
                            ),
                          ),
                        ],

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: SizedBox(
                              height: 120,
                              child:
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Image.asset('images/seta.png'),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 8,
                            child: SizedBox(
                              width: double.infinity,
                              child: Row(
                                children: [

                                  NoDraggableLetter('S'),
                                  Target('E',false),
                                  NoDraggableLetter('T'),
                                  Target('A',false),


                                ],
                              ),
                            ),
                          ),
                        ],

                      ),
                    ),
                  ],
                ),

                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0,20.0,20.0,0),
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    LetterBox('A'),
                    LetterBox('E'),
                    LetterBox('O'),




                  ],
                ),
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
                              qtdTargets == targetsCompletos ? print('Atividade completa'): print('Atividade NÃO COMPLETA');

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
class LetterBox extends StatelessWidget {
  final String letter;

  LetterBox(this.letter);

  @override
  Widget build(BuildContext context) {
    return Draggable(
      data: letter,
      feedback:  letterCard(context),
      child: letterCard(context),
    );

  }
  Widget letterCard(context)=> Container(
    width: MediaQuery.of(context).size.width*0.14,
    height: MediaQuery.of(context).size.height*0.06,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      color: Color.fromRGBO(37, 85, 124, 1),
    ),
    child: Text(letter,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.white,
        decoration: TextDecoration.none,
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
    ),


  );



}





