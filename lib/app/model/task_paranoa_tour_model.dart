import 'package:paula/app/model/task_model.dart';
import 'package:paula/app/model/word.dart';

class TaskParanoaTourModel extends TaskModel {
  final List<Word> words;
  final String audioPath;
  TaskParanoaTourModel({
    required this.words,
    required String title,
    required this.audioPath,
  }) : super(title: title);
}
