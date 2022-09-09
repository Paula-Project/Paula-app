import 'package:paula/app/model/word.dart';

class Words {
  List<Word> words = [];
  List<String> wordsList = [
    'Abajur',
    'Antena',
    'Apito',
    'Arroz',
    'Árvore',
    'Escada',
    'Oculos',
    'Uva',
    'Avião',
    'Abacaxi',
    'lata'
  ];
  List<String> soundsList = [
    'abajur.mp3',
    'antena.mp3',
    'apito.mp3',
    'arroz.mp3',
    'arvore.mp3',
    'escada.mp3',
    'oculos.mp3',
    'uva.mp3',
    'aviao.mp3',
    'abacaxi.mp3',
    'lata.mp3'
  ];
  List<String> imagesList = [
    'abajur.png',
    'antena.png',
    'apito.png',
    'arroz.png',
    'arvore.png',
    'escada.png',
    'oculos.png',
    'uva.png',
    'aviao.png',
    'abacaxi.png',
    'lata.png'
  ];
  void populate() {
    for (int i = 0; i < wordsList.length; i++) {
      words.add(Word(
          text: wordsList[i],
          soundPath: soundsList[i],
          imagePath: imagesList[i]));
    }
  }

  Words() {
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
