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
  ];
  List<String> soundsList = [
    "panificadora_izadora.mp3",
    "itapoa.mp3",
    "itapoa.mp3",
    "onibus.mp3",
    "ponte_paranoa.mp3",
  ];
  List<String> imagesList = [
    "itapoa_panificadora.png",
    "itapoa.png",
    "itapoa_madeira.png",
    "onibus_itapoa.png",
    "ponte.png",
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