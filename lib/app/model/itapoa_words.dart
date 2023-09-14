import 'package:paula/app/model/word.dart';

//set words assets from /assets/words
class ItapoaWords {
  List<Word> wordsList = [];
  List<String> textList = [
    "PANIFICADORA \n IZADORA", //0
    "ITAPOÃ", //1//
    "ITAPOÃ", //2//
    "ÔNIBUS", //3*/
    "PONTE JK", //4//
    "PRAÇA", //5*//
    "MOTO", //6*//
    "FARMÁCIA", //7//
    "CELULAR", //8//
    "COPO", //9//
    "CHAVE", //10//
    "RELÓGIO", //11//
    "BICICLETA", //12//
    "MOCHILA", //13
    "COLHER", //14//
    "GARFO", //15//
    "PANELA", //16//
  ];
  List<String> soundsList = [
    "panificadora_izadora.mp3", //0
    "itapoa.mp3", //1
    "itapoa.mp3", //2
    "onibus.mp3", //3
    "ponte_paranoa.mp3", //4
    "praça.mp3", //5
    "moto.mp3", //6
    "farmacia.mp3",
    "celular.mp3",
    "copo.mp3",
    "chave.mp3",
    "relogio.mp3",
    "bicicleta.mp3",
    "mochila.mp3",
    "colher.mp3",
    "garfo.mp3",
    "panela.mp3",
  ];
  List<String> imagesList = [
    "itapoa_panificadora.png", //0
    "itapoa.png", //1
    "itapoa_madeira.png", //2
    "onibus_itapoa.png", //3
    "ponte.png", //4
    "praça.jpg", //5
    "moto.png", //6
    "farmacia.png", //7
    "celular.png", //8*
    "copo.png", //9
    "chave.png", //10
    "relogio.png", //11
    "bicicleta.png", //12
    "mochila.png", //3
    "colher.png", //14
    "garfo.png", //15
    "panela.png", //16
  ];

  void populate() {
    for (int i = 0; i < textList.length; i++) {
      wordsList.add(Word(
          text: textList[i],
          soundPath: soundsList[i],
          imagePath: imagesList[i]));
    }
  }

  ItapoaWords() {
    populate();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['wordsList'] = wordsList.map((v) => v.toJson()).toList();
    return data;
  }
}
