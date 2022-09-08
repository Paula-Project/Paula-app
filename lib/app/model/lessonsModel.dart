import 'package:paula/app/model/word.dart';

class AssetsPopulate {
  List<Word> words = [];
  List<String> wordsList = [
    "abajur",
    "antena",
    "apito",
    "arroz",
    "arvore",
    "escada",
    "oculos",
    "uva",
    "avião",
    "abacaxi",
    "lata"
  ];
  List<String> soundsList = [
    "assets/sounds/abajur.mp3",
    "assets/sounds/antena.mp3",
    "assets/sounds/apito.mp3",
    "assets/sounds/arroz.mp3",
    "assets/sounds/arvore.mp3",
    "assets/sounds/escada.mp3",
    "assets/sounds/oculos.mp3",
    "assets/sounds/uva.mp3",
    "assets/sounds/aviao.mp3",
    "assets/sounds/abacaxi.mp3",
    "assets/sounds/lata.mp3"
  ];
  List<String> imagesList = [
    "assets/images/abajur.jpg",
    "assets/images/antena.jpg",
    "assets/images/apito.jpg",
    "assets/images/arroz.jpg",
    "assets/images/arvore.jpg",
    "assets/images/escada.jpg",
    "assets/images/oculos.jpg",
    "assets/images/uva.jpg",
    "assets/images/aviao.jpg",
    "assets/images/abacaxi.jpg",
    "assets/images/lata.jpg"
  ];
  void populate() {
    for (int i = 0; i < wordsList.length; i++) {
      words.add(Word(
          text: wordsList[i],
          soundPath: soundsList[i],
          imagePath: imagesList[i]));
    }
  }

  AssetsPopulate() {
    populate();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.words != null) {
      data['words'] = this.words.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
