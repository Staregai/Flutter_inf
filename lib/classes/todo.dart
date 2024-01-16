import 'package:inf/cubits/todo_cubit.dart';
import 'package:isar/isar.dart';

class ToDo {
  String? id;
  String? text;
  String? description;
  bool done;
  List<ToDo> subtasks = new List.empty(growable: true);
  ToDo({
    required this.id,
    required this.text,
    this.done = false,
    this.description = "",
  });

  ToDo copyWith({
    String? id,
    String? text,
    String? description,
    bool? done,
    List<ToDo>? subtasks,
    ToDo? subtask,
  }) {
    ToDo newtodo = ToDo(
      id: id ?? this.id,
      text: text ?? this.text,
      description: description ?? this.description,
      done: done ?? this.done,
    );

    newtodo.subtasks = [...this.subtasks];
    if (subtask != null) {
      newtodo.subtasks.add(subtask);
    }
    if (subtasks != null) {
      newtodo.subtasks = subtasks;
    }
    return newtodo;
  }

  static List<ToDo> todoList() {
    List<ToDo> list = List.empty(growable: true);
    list.add(ToDo(
        id: '1',
        text: "aaaaa",
        done: true,
        description: "opis probny \n ccccccc"));
    list.add(ToDo(id: "2", text: "bbbbb", done: true));
    list.add(ToDo(id: "3", text: "asd"));
    list.add(ToDo(id: "4", text: "dsa"));
    list.add(ToDo(id: "5", text: "qwe"));
    list.add(ToDo(id: "6", text: "trew"));
    list[0].subtasks = list;
    return list;
  }
}
