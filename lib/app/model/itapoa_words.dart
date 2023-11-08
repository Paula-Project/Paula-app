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
    "FARMÁCIA", //7//
  ];
  List<String> soundsList = [
    "panificadora_izadora.mp3", //0
    "itapoa.mp3", //1
    "itapoa.mp3", //2
    "onibus.mp3", //3
    "ponte_paranoa.mp3", //4
    "praça.mp3", //5
    "farmacia.mp3",
  ];
  List<String> imagesList = [
    "itapoa_panificadora.png", //0
    "itapoa.png", //1
    "itapoa_madeira.png", //2
    "onibus_itapoa.png", //3
    "ponte.png", //4
    "praça.jpg", //5
    "farmacia.png", //7
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
