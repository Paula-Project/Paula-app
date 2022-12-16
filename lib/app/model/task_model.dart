abstract class TaskModel {
  String title;
  bool isCorrect;
  String answer;
  TaskModel({this.answer = "", required this.isCorrect, this.title = ""});
}
