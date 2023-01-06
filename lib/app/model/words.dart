import 'package:paula/app/model/word.dart';

//set words assets from /assets/words
class Words {
  List<Word> words = [];
  List<String> wordsList = [
    'Abajur', // 0
    'Antena', // 1
    'Apito', // 2
    'Arroz', // 3
    'Arvore', // 4
    'Escada', // 5
    'Oculos', // 6
    'Uva', // 7
    'Avião', // 8
    'Abacaxi', // 9
    'Lata', // 10
    'Bebida', // 11
    'Bóia', // 12
    'Bola', // 13
    'Caneta', // 14
    'Capa', // 15
    'Cavalo', // 16
    'Dado', // 17
    'Envelope', // 18
    'Iguana', // 19
    'Ioio', // 20
    'Meia', // 21
    'Ovo', // 22
    'Padaria', // 23
    'Onibus', // 24
    'Seta', // 25
    'Escova', // 26
    'Esponja', // 27
    'Elefante', // 28
    'Estrela', // 29
    'Igreja', // 30
    'Iogurte', // 31
    'Urso', // 32
    'Unha', // 33
    'Um', // 34
    'Paranoá', // 35
    'Paranoá', // 36
    'Olho', // 37
    'Sorvete', // 38
    'Isca', // 39
    'Paranoá\nCarnes', // 40
    'Paranoá\nPanificadora', // 41
    'Paranoá\nTintas', // 42
    'Paranoá\nUpa', // 43
    'Casa\nNordestina', // 44
    'Paraíba\nDistribuidora', // 45
    'Lago Paranoá', // 46
    'Lago Paranoá', // 47
    'Paróquia', // 48
    'Pé na Jaca', // 49
    'Tintas', // 50
    'Universal', // 51
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
    'dado.mp3',
    'envelope.mp3',
    'iguana.mp3',
    'ioio.mp3',
    'meia.mp3',
    'ovo.mp3',
    'padaria.mp3',
    'onibus.mp3',
    'seta.mp3',
    'escova.mp3',
    'esponja.mp3',
    'elefante.mp3',
    'estrela.mp3',
    'igreja.mp3',
    'iogurte.mp3',
    'urso.mp3',
    'unha.mp3',
    'um.mp3',
    'paranoa.mp3',
    'paranoa.mp3',
    'olho.mp3',
    'sorvete.mp3',
    'isca.mp3',
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
    'ovo.png',
    'padaria.png',
    'onibus.png',
    'seta.png',
    'escova.png',
    'esponja.png',
    'elefante.png',
    'estrela.png',
    'igreja.png',
    'iogurte.png',
    'urso.png',
    'unha.png',
    'um.png',
    'paranoa.png',
    'paranoa_letreiro.jpg',
    'olho.png',
    'sorvete.png',
    'isca.png',
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
