import 'package:paula/app/model/word.dart';

//set words assets from /assets/words
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
    'Lata',
    'bebida',
    'boia',
    'bola',
    'caneta',
    'capa',
    'cavalo',
    'dados',
    'envelope',
    'iguana',
    'ioio',
    'meia',
    'onibus',
    'ovo',
    'padaria'
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
    'lata.mp3',
    'bebida.mp3',
    'boia.mp3',
    'bola.mp3',
    'caneta.mp3',
    'capa.mp3',
    'cavalo.mp3',
    'dados.mp3',
    'envelope.mp3',
    'iguana.mp3',
    'ioio.mp3',
    'meia.mp3',
    'onibus.mp3',
    'ovo.mp3',
    'padaria.mp3'
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
    'lata.png',
    'bebida.png',
    'boia.png',
    'bola.png',
    'caneta.png',
    'capa.png',
    'cavalo.png',
    'dados.png',
    'envelope.png',
    'iguana.png',
    'ioio.png',
    'meia.png',
    'onibus.png',
    'ovo.png',
    'padaria.png'
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
    data['words'] = this.words.map((v) => v.toJson()).toList();
    return data;
  }
}
