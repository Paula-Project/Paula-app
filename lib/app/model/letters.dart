import 'package:paula/app/model/letter.dart';

//set words assets from /assets/words
class Letters {
  List<Letter> letters = [];
  List<Letter> lettersVowels = [];
  List<String> lettersList = [
    'A', // 0
    'B', // 1
    'C', // 2
    'D', // 3
    'E', // 4
    'F', // 5
    'G', // 6
    'H', // 7
    'I', // 8
    'J', // 9
    'K', // 10
    'L', // 11
    'M', // 12
    'N', // 13
    'O', // 14
    'P', // 15
    'Q', // 16
    'R', // 17
    'S', // 18
    'T', // 19
    'U', // 20
    'V', // 21
    'W', // 22
    'X', // 23
    'Y', // 24
    'Z', // 25
  ];
   List<String> letterListVowels = [
    'A',
    'E', 
    'I', 
    'O',
    'U', 
  ];
  List<String> soundsList = [];
  List<String> imagesListVowels = [
    'letter-a.png',
    'letter-e.png',
    'letter-i.png',
    'letter-o.png',
    'letter-u.png',
  ];
  List<String> imagesList = [
    'letter-a.png',
    'antena.png',
    'apito.png',
    'arroz.png',
    'letter-e.png',
    'escada.png',
    'oculos.png',
    'uva.png',
    'letter-i.png',
    'abacaxi.png',
    'lata.png',
    'bebida.png',
    'boia.png',
    'bola.png',
    'letter-o.png',
    'capa.png',
    'cavalo.png',
    'dados.png',
    'envelope.png',
    'iguana.png',
    'letter-u.png',
    'meia.png',
    'ovo.png',
    'padaria.png',
    'onibus.png',
    'seta.png',
  ];
  void populate() {
    for (int i = 0; i < lettersList.length; i++) {
      letters.add (Letter(
          text: lettersList[i],
          soundPath: '',
          imagePath: imagesList[i]));
    }
  }

  void populateVowels() {
    for (int i = 0; i < letterListVowels.length; i++) {
      lettersVowels.add (Letter(
          text: letterListVowels[i],
          soundPath: '',
          imagePath: imagesListVowels[i]));
    }
  }

  Letters() {
    populate();
    populateVowels();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['letters'] = letters.map((v) => v.toJson()).toList();
    return data;
  }
}
