import 'package:paula/app/model/task_model.dart';
import 'package:paula/app/model/word.dart';

class TaskParanoaTourModel extends TaskModel {
  final List<Word> words;
  final String titleAudioPath;
  TaskParanoaTourModel({
    required this.words,
    required String title,
    required this.titleAudioPath,
  }) : super(title: title);
}
