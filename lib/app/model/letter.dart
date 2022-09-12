class Letter {
  String text;
  String soundPath;
  String imagePath;

  Letter(
      {required this.text, required this.soundPath, required this.imagePath});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = text;
    data['sounPath'] = soundPath;
    data['imagePath'] = imagePath;
    return data;
  }
}
