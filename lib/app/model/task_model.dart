abstract class TaskModel {
  final String title;
  bool isCorrect;
  late String answer;
  TaskModel({String answer = "", required this.isCorrect, required this.title});
}
