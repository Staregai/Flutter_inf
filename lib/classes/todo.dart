import 'package:isar/isar.dart';

part 'todo.g.dart';

@collection
class ToDo {
  Id id = Isar.autoIncrement;
  String? text;
  String? description;
  bool done;

  final subtasks = IsarLinks<Subtask>();
  ToDo({
    required this.text,
    this.done = false,
    this.description = "",
  });
}

@collection
class Subtask {
  Id id = Isar.autoIncrement;
  String? text;
  String? description;
  bool done;

  Subtask({required this.text, this.done = false, this.description = ""});
}
