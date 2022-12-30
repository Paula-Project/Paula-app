import 'package:flutter/material.dart';
import 'package:paula/app/controllers/task_words_paranoa_controller.dart';
import 'package:paula/app/views/components/ButtonNext.dart';
import 'package:paula/app/views/components/exitDialog.dart';

class TaskWordsParanoaIntroduction extends StatefulWidget {
  final TaskWordsParanoaController lessonController;
  const TaskWordsParanoaIntroduction({
    Key? key,
    required this.lessonController,
  }) : super(key: key);

  @override
  State<TaskWordsParanoaIntroduction> createState() => _TaskWordsParanoaIntroductionState();
}

class _TaskWordsParanoaIntroductionState extends State<TaskWordsParanoaIntroduction> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => exitDialog(context),
      child: Material(
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 240, 240, 240),
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 50.0, horizontal: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: (MediaQuery.of(context).size.height * 0.13),
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(37, 85, 124, 1),
                        ),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          "Paranoá",
                          style: TextStyle(
                              fontSize: 70, fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                  ),
                  Stack(
                    children: [Container(
                      height: MediaQuery.of(context).size.height * 0.18,
                      width: (MediaQuery.of(context).size.width * 0.8),
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(37, 85, 124, 1),
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          ),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: 
                        const Text("Bem-vindo ao Paranoá. Agora vamos conhecer a minha cidade.", 
                            style: TextStyle(fontSize: 22)),
                      
                    ),
                     const Positioned(
                        right: 10,
                        top: 10,
                        child: Icon(
                          Icons.spatial_audio_off_sharp,
                          color: Colors.white,
                        ),
                      ),]
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: (MediaQuery.of(context).size.width * 0.8),
                    padding: const EdgeInsets.symmetric(horizontal:20),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                            'assets/images/paula/paula08.png',
                            height: MediaQuery.of(context).size.height * 0.38,
                          ),
                    ),
                  ),
                   SizedBox(  
                      height: 50.0,
                      width: 150.0,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(
                                    Colors.white),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(
                                    Colors.blue)
                                ,
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(10),
                                    side: BorderSide.none))),
                        child: const Text('CONTINUAR',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            )),
                            onPressed: (){},),)
                ],
              )),
        ),
      ),
    );
  }
}
