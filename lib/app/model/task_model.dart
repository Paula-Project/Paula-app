abstract class TaskModel {
  String title;
  bool isCorrect;
  String answer;
  TaskModel({this.answer = "", this.isCorrect = false, this.title = ""});
}
