import 'package:paula/app/model/word.dart';

//set words assets from /assets/words
class ParanoaWords {
  List<Word> wordsList = [];
  List<String> textList = [
    'Paranoá\nCarnes', // 0
    'Paranoá\nPanificadora', // 1
    'Paranoá\nTintas', //2
    'Paranoá\nUpa', //3
    'Casa\nNordestina', //4
    'Paraíba\nDistribuidora', //5
    'Lago Paranoá', //6
    'Lago Paranoá', //7
    'Paróquia', //8
    'Pé na Jaca', //9
    'Tintas', // 10
    'Universal', // 11
    'Paranoá', // 12
    'Paranoá', // 13
  ];
  List<String> soundsList = [
    'paranoa_carnes.mp3',
    'paranoa_panificadora.mp3',
    'paranoa_tintas.mp3',
    'paranoa_upa.mp3',
    'paranoa_casaNordestina.mp3',
    'paranoa_distribuidora.mp3',
    'paranoa_lago.mp3',
    'paranoa_lago.mp3',
    'paranoa_paroquia.mp3',
    'paranoa_penaJaca.mp3',
    'paranoa_tintas1.mp3',
    'paranoa_universal.mp3',
    'paranoa.mp3',
    'paranoa.mp3',
  ];
  List<String> imagesList = [
    'paranoa_carnes.jpg',
    'paranoa_panificadora.jpg',
    'paranoa_tintas.jpg',
    'paranoa_upa.jpg',
    'paranoa_casaNordestina.png',
    'paranoa_Distribuidora.png',
    'paranoa_lago1.png',
    'paranoa_lago2.png',
    'paranoa_paroquia.png',
    'paranoa_penaJaca.png',
    'paranoa_tintas1.png',
    'paranoa_Universal.png',
    'paranoa.png',
    'paranoa_letreiro.jpg',
  ];

  void populate() {
    for (int i = 0; i < textList.length; i++) {
      wordsList.add(Word(
          text: textList[i],
          soundPath: soundsList[i],
          imagePath: imagesList[i]));
    }
  }

  ParanoaWords() {
    populate();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['wordsList'] = wordsList.map((v) => v.toJson()).toList();
    return data;
  }
}
