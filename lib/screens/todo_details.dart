import 'package:flutter/material.dart';
import 'package:inf/classes/todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inf/classes/todo_item.dart';
import 'package:inf/cubits/todo_cubit.dart';
import 'package:inf/cubits/todo_details_cubit.dart';
import 'package:inf/data_sources/todo_DataSource.dart';
import 'package:inf/helpers/colors.dart';
import 'package:inf/main.dart';

class TodoDeatilsRoute extends MaterialPageRoute {
  TodoDeatilsRoute(ToDo todo, IsarTodoDataSource _dataSource)
      : super(
          builder: (context) => BlocProvider(
            create: (context) =>
                TodoDetailsCubit(todo, dataSource: _dataSource),
            child: TodoDetails(
              todo: todo,
              dataSource: _dataSource,
            ),
          ),
        );
}

class TodoDetails extends StatelessWidget {
  final ToDo todo;
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _newsubcontroller = TextEditingController();
  final IsarTodoDataSource dataSource;

  TodoDetails({required this.todo, Key? key, required this.dataSource})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    _titleController.text = todo.text!;
    _descriptionController.text = todo.description!;

    return BlocBuilder<TodoDetailsCubit, ToDo>(
      builder: (context, state) => _TodoDetailsContent(
        titleController: _titleController,
        descriptionController: _descriptionController,
        newsubController: _newsubcontroller,
        todo: state,
        dataSource: dataSource,
      ),
    );
  }
}

class _TodoDetailsContent extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TextEditingController newsubController;
  final ToDo todo;
  final IsarTodoDataSource dataSource;

  const _TodoDetailsContent(
      {required this.titleController,
      required this.descriptionController,
      required this.newsubController,
      required this.todo,
      required this.dataSource});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 5),
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: "Title",
            ),
            controller: titleController,
            onChanged: (String title) async {
              await context.read<TodoDetailsCubit>().TitleChange(title);
            },
          ),
          Container(
            margin: EdgeInsets.only(bottom: 5),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              tileColor: Colors.white,
              leading: IconButton(
                icon: Icon(context.watch<TodoDetailsCubit>().isDone()
                    ? Icons.check_box
                    : Icons.check_box_outline_blank),
                color: tdBlue,
                onPressed: () async {
                  await context.read<TodoDetailsCubit>().DoneChange();
                },
              ),
              title: Text(
                "Done",
                style: TextStyle(
                  fontSize: 16,
                  color: tdBlack,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: TextField(
              decoration: InputDecoration(labelText: "Description"),
              maxLines: 8,
              controller: descriptionController,
              onChanged: (String description) async {
                await context.read<TodoDetailsCubit>().DescChange(description);
              },
            ),
          ),
          for (ToDo td in todo.subtasks)
            todo_item(
              todo: td,
              dataSource: dataSource,
              onToDoChanged: (todo) {
                //context.read<TodoDetailsCubit>().;
              },
              onDeleteItem: (id) {
                //context.read<TodoDetailsCubit>().handleDeleteSub(id);
              },
            ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                    left: 20,
                    top: 10,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Add new subtask",
                      border: InputBorder.none,
                    ),
                    controller: newsubController,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20, right: 20, top: 10),
                child: ElevatedButton(
                  child: Text(
                    "+",
                    style: TextStyle(fontSize: 40),
                  ),
                  onPressed: () {
                    // context
                    //     .read<TodoDetailsCubit>()
                    //     .addToDoSubItem(newsubController.text);
                    newsubController.text = "";
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: tdBlue,
                      minimumSize: Size(60, 60),
                      elevation: 10),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text("Details"),
          ),
          IconButton(
            icon: context.watch<ThemeProvider>().isDarkMode
                ? Icon(Icons.dark_mode, color: Colors.white, size: 30)
                : Icon(Icons.light_mode, color: Colors.black12, size: 30),
            onPressed: () {
              context.read<ThemeProvider>().toggleTheme();
            },
          ),
        ],
      ),
    );
  }
}
