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
    'avô', //41
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
    'Moto', //64
    'Celular', //65
    'Copo',//66
    'Chave', //67
    'Relógio', //68
    'Bicicleta', //69'
    'Mochila', //70
    'Colher', //71
    'Garfo', //72
    'Panela', //73
  ];
  List<String> soundsList = [
    'abajur.mp3',//0
    'antena.mp3',//1
    'apito.mp3',//2
    'arroz.mp3',//3
    'arvore.mp3',//4
    'escada.mp3',//5
    'oculos.mp3',//6
    'uva.mp3',//7
    'aviao.mp3',//8
    'abacaxi.mp3',//9
    'lata.mp3',//10
    'bebida.mp3',//11
    'boia.mp3',//12
    'bola.mp3',//13
    'caneta.mp3',//14
    'capa.mp3',//15
    'cavalo.mp3',//16
    'dado.mp3',//17
    'envelope.mp3',//18
    'iguana.mp3',//19
    'ioio.mp3',//20
    'meia.mp3',//21
    'ovo.mp3',//22
    'padaria.mp3',//23
    'onibus.mp3',//24
    'seta.mp3',//25
    'escova.mp3',//26
    'esponja.mp3',//27
    'elefante.mp3',//28
    'estrela.mp3',//29
    'igreja.mp3',//30
    'iogurte.mp3',//31
    'urso.mp3',//32
    'unha.mp3',//33
    'um.mp3',//34
    'olho.mp3',//35
    'sorvete.mp3',//36
    'isca.mp3',//37
    'bala.mp3',//38
    'faca.mp3',//39
    'avó.mp3',//40
    'avô.mp3',//41
    'neto.mp3',//42
    'bebe.mp3',//43
    'carro.mp3',//44
    'onibus.mp3',//45
    'cavalo.mp3',//46
    'mae.mp3',//47
    'pai.mp3',//48
    'cama.mp3',//49
    'lápis.mp3',//50
    'criança.mp3',//51
    'menino.mp3',//52
    'menina.mp3',//53
    'cachorro.mp3',//54
    'gato.mp3',//55
    'vaca.mp3',//56
    'lixo.mp3',//57
    'escola.mp3',//58
    'casa.mp3',//59
    'capivara.mp3',//60
    'churrasco.mp3',//61
    'café.mp3',//62
    'leite.mp3',//63
    'moto.mp3',//64
    "celular.mp3",//65
    "copo.mp3",//66
    "chave.mp3",//67
    "relogio.mp3",//68
    "bicicleta.mp3",//69
    "mochila.mp3",//70
    "colher.mp3",//71
    "garfo.mp3",//72
    "panela.mp3",//73
    
  ];
  List<String> imagesList = [
    'abajur.png',//0
    'antena.png',//1
    'apito.png',//2
    'arroz.png',//3
    'arvore.png',//4
    'escada.png',//5
    'oculos.png',//6
    'uva.png',//7
    'aviao.png',//8
    'abacaxi.png',//9
    'lata.png',//10
    'bebida.png',//11
    'boia.png',//12
    'bola.png',//13
    'caneta.png',//14
    'capa.png',//15
    'cavalo.png',//16
    'dado.png',//17
    'envelope.png',//18
    'iguana.png',//19
    'ioio.png',//20
    'meia.png',//21
    'ovo.png',//22
    'padaria.png',//23
    'onibus.png',//24
    'seta.png',//25
    'escova.png',//26
    'esponja.png',//27
    'elefante.png',//28
    'estrela.png',//29
    'igreja.png',//30
    'iogurte.png',//31
    'urso.png',//32
    'unha.png',//33
    'um.png',//34
    'olho.png',//35
    'sorvete.png',//36
    'isca.png',//37
    'bala.png',//38
    'faca.png',//39
    'avó.png',//40
    'avô.png',//41
    'neto.png',//42
    'bebe.png',//43
    'carro.png',//44
    'onibus.png',//45
    'cavalo.png',//46
    'mae.png',//47
    'pai.png',//48
    'cama.png',//49
    'lapis.png',//50
    'criança.png',//51
    'menino.png',//52
    'menina.png',//53
    'cachorro.png',//54
    'gato.png',//55
    'vaca.png',//56
    'lixo.png',//57
    'escola.png',//58
    'casa.png',//59
    'capivara.png',//60
    'churrasco.png',//61
    'cafe.png',//62
    'leite.png',//63
    'moto.png',//64
    "celular.png", //65
    "copo.png", //66
    "chave.png", //67
    "relogio.png", //68
    "bicicleta.png", //69
    "mochila.png", //70
    "colher.png", //71
    "garfo.png", //72
    "panela.png", //73
    
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
