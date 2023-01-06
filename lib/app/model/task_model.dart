abstract class TaskModel {
  String title;
  String titleAudio;
  bool isCorrect;
  String answer;
  TaskModel(
      {this.answer = "",
      this.isCorrect = false,
      this.title = "",
      this.titleAudio = ""});
}
