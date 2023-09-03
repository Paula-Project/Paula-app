import 'package:paula/app/model/word.dart';

//set words assets from /assets/words
class ItapoaWords {
  List<Word> wordsList = [];
  List<String> textList = [
    "PANIFICADORA \n IZADORA",
    "ITAPOÃ",
    "ITAPOÃ",
    "ÔNIBUS",
    "PONTE JK",
    "PRAÇA",
    "MOTO",
    "AVENIDA", //
    "HOSPITAL",
    "FARMÁCIA",
    "CELULAR", //
    "COMPUTADOR",
    "COPO",
    "CHAVE",
    "RELÓGIO",
    "BICICLETA", //
    "MOCHILA", //
    "COLHER", //
    "GARFO", //
    "PANELA", //
    "CADEIRA" //
  ];
  List<String> soundsList = [
    "panificadora_izadora.mp3",
    "itapoa.mp3",
    "itapoa.mp3",
    "onibus.mp3",
    "ponte_paranoa.mp3",
    "praça.mp3",
    "moto.mp3",
    "avenida.mp3",
    "hospital.mp3",
    "farmacia.mp3",
    "celular.mp3",
    "computador.mp3",
    "copo.mp3",
    "chave.mp3",
    "relogio.mp3",
    "bicicleta.mp3",
    "mochila.mp3",
    "colher.mp3",
    "garfo.mp3",
    "panela.mp3",
    "cadeira.mp3",
  ];
  List<String> imagesList = [
    "itapoa_panificadora.png",
    "itapoa.png",
    "itapoa_madeira.png",
    "onibus_itapoa.png",
    "ponte.png",
    "moto.png", //
    "avenida.jpg", //
    "hospital.png", //
    "praça.jng",
    "farmacia.png",
    "celular.png",
    "computador.png",
    "copo.png",
    "chave.png",
    "relogio.png",
    "bicicleta.png",
    "mochila.png",
    "colher.png",
    "garfo.png",
    "panela.png",
    "cadeira.png",
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
