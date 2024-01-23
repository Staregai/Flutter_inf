import 'package:inf/cubits/todo_cubit.dart';
import 'package:isar/isar.dart';

part 'todo.g.dart';

@collection
class ToDo {
  Id id = Isar.autoIncrement;
  String? text;
  String? description;
  bool done;

  final subtasks = IsarLinks<ToDo>();
  ToDo({
    //required this.id,
    required this.text,
    this.done = false,
    this.description = "",
  
  });

 
  // ToDo copyWith({
  //   String? text,
  //   String? description,
  //   bool? done,
  //   List<ToDo>? subtasks,
  //   ToDo? subtask,
  // }) {
  //   ToDo newtodo = ToDo(
  //     //id: id ?? this.id,
  //     text: text ?? this.text,
  //     description: description ?? this.description,
  //     done: done ?? this.done,
  //   );

  //   newtodo.subtasks = [...this.subtasks];
  //   if (subtask != null) {
  //     newtodo.subtasks.add(subtask);
  //   }
  //   if (subtasks != null) {
  //     newtodo.subtasks = subtasks;
  //   }
  //   return newtodo;
  // }

  // static List<ToDo> todoList() {
  //   List<ToDo> list = List.empty(growable: true);
  //   list.add(ToDo(
  //       //id: '1',
  //       text: "aaaaa",
  //       done: true,
  //       description: "opis probny \n ccccccc"));
  //   list.add(ToDo(text: "bbbbb", done: true));
  //   list.add(ToDo(text: "asd"));
  //   list.add(ToDo(text: "dsa"));
  //   list.add(ToDo(text: "qwe"));
  //   list.add(ToDo(text: "trew"));
  //   list[0].subtasks = list;
  //   return list;
  // }
}
