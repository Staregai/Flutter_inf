import 'package:flutter/material.dart';
import 'package:inf/data_sources/todo_DataSource.dart';
import 'package:inf/classes/todo.dart';

class subtask_item extends StatefulWidget {
  final Subtask sub;
  final onToDoChanged;
  final onDeleteItem;
  final IsarTodoDataSource dataSource;

  const subtask_item({
    Key? key,
    required this.sub,
    required this.onToDoChanged,
    required this.onDeleteItem,
    required this.dataSource,
  }) : super(key: key);

  @override
  State<subtask_item> createState() => _sub_itemState(dataSource: dataSource);
}

class _sub_itemState extends State<subtask_item> {
  IsarTodoDataSource dataSource;
  _sub_itemState({required this.dataSource});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: ListTile(
        onTap: () async {
          widget.onToDoChanged(widget.sub.id);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Theme.of(context).colorScheme.secondary,
        leading: IconButton(
          icon: Icon(widget.sub.done
              ? Icons.check_box
              : Icons.check_box_outline_blank),
          color: Theme.of(context).colorScheme.surface,
          onPressed: () {
            widget.onToDoChanged(widget.sub.id);
          },
        ),
        title: Text(
          widget.sub.text ?? " ",
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).colorScheme.onSecondary,
            decoration: widget.sub.done ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.error,
              borderRadius: BorderRadius.circular(5)),
          child: IconButton(
            constraints: BoxConstraints.tight(Size(35, 35)),
            color: Theme.of(context).colorScheme.onPrimary,
            iconSize: 18,
            icon: Icon(Icons.delete),
            onPressed: () {
              widget.onDeleteItem(widget.sub);
            },
          ),
        ),
      ),
    );
  }
}
