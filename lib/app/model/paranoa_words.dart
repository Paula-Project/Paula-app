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
    'churrasco', //14
    'mãe', //15
    'pai', //16
    'avó', //17
    'avô', //18
    'neto', //19
    'bebe', //20
    'carro', //21
    'onibus', //22
    'cavalo', //23
    'cama', //24
    'lápis', //25
    'criança', //26
    'menino', //27
    'menina', //28
    'cachorro', //29
    'gato', //30
    'vaca', //31
    'lixo', //32
    'escola', //33
    'casa', //34
    'capivara', //35
    'churrasco', //36
    'café', //37
    'leite', //38
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
    'churrasco.mp3',
    'mae.mp3',
    'pai.mp3',
    'avó.mp3',
    'avô.mp3',
    'neto.mp3',
    'bebe.mp3',
    'carro.mp3',
    'onibus.mp3',
    'cavalo.mp3',
    'cama.mp3',
    'lápis.mp3',
    'criança.mp3',
    'menino.mp3',
    'menina.mp3',
    'cachorro.mp3',
    'gato.mp3',
    'vaca.mp3',
    'lixo.mp3',
    'escola.mp3',
    'casa.mp3',
    'capivara.mp3',
    'churrasco.mp3',
    'café.mp3',
    'leite.mp3',
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
    'churrasco.png',
    'mae.png',
    'pai.png',
    'avo.png',
    'avô.png',
    'neto.png',
    'bebe.png',
    'carro.png',
    'onibus.png',
    'cavalo.png',
    'cama.png',
    'lapis.png',
    'criança.png',
    'menino.png',
    'menina.png',
    'cachorro.png',
    'gato.png',
    'vaca.png',
    'lixo.png',
    'escola.png',
    'casa.png',
    'capivara.png',
    'churrasco.png',
    'cafe.png',
    'leite.png',
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
