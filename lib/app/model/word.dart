class Word {
  String text;
  String soundPath;
  String imagePath;

  Word({required this.text, required this.soundPath, required this.imagePath});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = text;
    data['sounPath'] = soundPath;
    data['imagePath'] = imagePath;
    return data;
  }
}
