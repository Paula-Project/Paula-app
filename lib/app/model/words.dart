import 'package:paula/app/model/word.dart';

//set words assets from /assets/words
class Words {
  List<Word> wordsList = [];
  List<String> textList = [
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
    'Olho', // 35
    'Sorvete', // 36
    'Isca', // 37
    'Bala', //38
    'Faca', //39
    'avó', //40
    'avô', //41*
    'neto', //42
    'bebe', //43
    'carro', //44
    'onibus', //45
    'cavalo', //46
    'mãe', //47
    'pai', //48
    'cama', //49
    'lápis', //50
    'criança', //51
    'menino', //52
    'menina', //53
    'cachorro', //54
    'gato', //55
    'vaca', //56
    'lixo', //57
    'escola', //58
    'casa', //59
    'capivara', //60
    'churrasco', //61
    'café', //62
    'leite', //63
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
    'olho.mp3',
    'sorvete.mp3',
    'isca.mp3',
    'bala.mp3',
    'faca.mp3',
    'avó.mp3',
    'avô.mp3',
    'neto.mp3',
    'bebe.mp3',
    'carro.mp3',
    'onibus.mp3',
    'cavalo.mp3',
    'mae.mp3',
    'pai.mp3',
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
    'olho.png',
    'sorvete.png',
    'isca.png',
    'bala.png',
    'faca.png',
    'avo.png',
    'avô.png',
    'neto.png',
    'bebe.png',
    'carro.png',
    'onibus.png',
    'cavalo.png',
    'mae.png',
    'pai.png',
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

  Words() {
    populate();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['wordsList'] = wordsList.map((v) => v.toJson()).toList();
    return data;
  }
}
