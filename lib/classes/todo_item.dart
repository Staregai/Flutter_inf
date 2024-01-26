import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inf/cubits/todo_cubit.dart';
import 'package:inf/data_sources/todo_DataSource.dart';
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
        onTap: () async {
          await navigateToDetails(dataSource);
          //await refresh(context);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Theme.of(context).colorScheme.secondary,
        leading: IconButton(
          icon: Icon(widget.todo.done
              ? Icons.check_box
              : Icons.check_box_outline_blank),
          color: Theme.of(context).colorScheme.surface,
          onPressed: () {
            widget.onToDoChanged(widget.todo);
          },
        ),
        title: Text(
          widget.todo.text!,
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).colorScheme.onSecondary,
            decoration: widget.todo.done ? TextDecoration.lineThrough : null,
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
              widget.onDeleteItem(widget.todo.id);
            },
          ),
        ),
      ),
    );
  }

  Future<void> navigateToDetails(IsarTodoDataSource dataSource) async {
    final route = TodoDeatilsRoute(widget.todo, dataSource);
    Navigator.push(context, route);
  }

  Future<void> refresh(BuildContext context) async {
    await context.read<TodoCubit>().refresh(null);
  }
}
