import 'package:flutter/material.dart';
import 'package:inf/data_sources/todo_DataSource.dart';
import 'package:inf/helpers/colors.dart';
import 'package:inf/classes/todo.dart';
import 'package:inf/screens/todo_details.dart';

class todo_item extends StatefulWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;
  final IsarTodoDataSource dataSource;

  const todo_item({
    Key? key,
    required this.todo,
    required this.onToDoChanged,
    required this.onDeleteItem,
    required this.dataSource,
  }) : super(key: key);

  @override
  State<todo_item> createState() => _todo_itemState(dataSource: dataSource);
}

class _todo_itemState extends State<todo_item> {
  IsarTodoDataSource dataSource;
  _todo_itemState({required this.dataSource});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: ListTile(
        onTap: () {
          navigateToDetails(dataSource);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: IconButton(
          icon: Icon(widget.todo.done
              ? Icons.check_box
              : Icons.check_box_outline_blank),
          color: tdBlue,
          onPressed: () {
            widget.onToDoChanged(widget.todo);
          },
        ),
        title: Text(
          widget.todo.text!,
          style: TextStyle(
            fontSize: 16,
            color: tdBlack,
            decoration: widget.todo.done ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
              color: tdRed, borderRadius: BorderRadius.circular(5)),
          child: IconButton(
            constraints: BoxConstraints.tight(Size(35, 35)),
            color: Colors.white,
            iconSize: 18,
            icon: Icon(Icons.delete),
            onPressed: () {
              widget.onDeleteItem(widget.todo.id);
            },
          ),
        ),
      ),
    );
  }

  void navigateToDetails(IsarTodoDataSource dataSource) {
    final route = TodoDeatilsRoute(widget.todo, dataSource);
    Navigator.push(context, route);
  }
}
