import 'package:flutter/material.dart';
import 'package:inf/helpers/colors.dart';
import 'package:inf/classes/todo.dart';
import 'package:inf/screens/todo_details.dart';

class todo_item extends StatefulWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;

  const todo_item(
      {Key? key,
      required this.todo,
      required this.onToDoChanged,
      required this.onDeleteItem})
      : super(key: key);

  @override
  State<todo_item> createState() => _todo_itemState();
}

class _todo_itemState extends State<todo_item> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: ListTile(
        onTap: () {
          navigateToDetails();
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
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
              color: tdRed, borderRadius: BorderRadius.circular(5)),
          child: IconButton(
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

  void navigateToDetails() {
    final route = MaterialPageRoute(
      builder: (context) => TodoDetails(todo: widget.todo),
    );
    Navigator.push(context, route);
  }
}
