import 'package:flutter/material.dart';

class HomePage2 extends StatefulWidget{
    final String letter;
    final String titleIntroduction;
    final LessonControllerInterface controller;
    final String audioUrl;
    ModuleVowelsController moduleVowelsController = ModuleVowelsController();
    LessonParanoaController lessonParanoaController = LessonParanoaController();
    LessonItapoaController lessonItapoaController = LessonItapoaController();
    
    const HomePage2({
        Key? key,
        required this.letter,
        required this.titleIntroduction,
        required this.controller,
        required this.audioUrl
    }): super(key: key);

    @override
    State<HomePage2> createState() =>_HomePage2State();
}

class _HomePage2State extends State<HomePage2>
    with WidgetsBindingObserver{
        AudioManager audioManager = AudioManager();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    audioManager.runAudio("audios/paula/${widget.audioUrl}");
    super.initState();
    }
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
  Widget build(BuildContext context){
    return Layout(
        indexPage: 0;
        bodyContent:
            Consumer<UsuarioState>(builder: (context,usuarioState, child){
                UsuarioAPI usuarioLogado = usuarioState.getUsuario();

            return Padding(
                padding: const EdgeInsets.fromLTRB(50,50,50,50),
                child: Column(children:[
                    mainAxisSize: mainAxisSize.max,
                    Container(
                        alignment: Alignment.topCenter,
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            
                        )
                    )
                ])
            )
            })

    )

  }