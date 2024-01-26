import 'package:flutter/material.dart';
import 'package:inf/classes/subtask_item.dart';
import 'package:inf/classes/todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inf/cubits/todo_cubit.dart';
import 'package:inf/cubits/todo_details_cubit.dart';
import 'package:inf/data_sources/todo_DataSource.dart';
import 'package:inf/main.dart';

class TodoDeatilsRoute extends MaterialPageRoute {
  TodoDeatilsRoute(ToDo todo, IsarTodoDataSource _dataSource)
      : super(
          builder: (context) => BlocProvider(
            create: (context) =>
                TodoDetailsCubit(td: todo, dataSource: _dataSource),
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

    return BlocBuilder<TodoDetailsCubit, DetailsState>(
      builder: (context, state) => _TodoDetailsContent(
        titleController: _titleController,
        descriptionController: _descriptionController,
        newsubController: _newsubcontroller,
        todo: state.toDo,
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
      body: BlocBuilder<TodoDetailsCubit, DetailsState>(
          builder: (context, state) {
        return ListView(
          padding: EdgeInsets.symmetric(horizontal: 5),
          children: [
            TextField(
              style: TextStyle(color: Theme.of(context).colorScheme.onError),
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
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                tileColor: Colors.transparent,
                leading: IconButton(
                  icon: Icon(context.watch<TodoDetailsCubit>().isDone()
                      ? Icons.check_box
                      : Icons.check_box_outline_blank),
                  color: Theme.of(context).colorScheme.surface,
                  onPressed: () async {
                    await context.read<TodoDetailsCubit>().DoneChange();
                  },
                ),
                title: Text(
                  "Done",
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onError,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: TextField(
                style: TextStyle(color: Theme.of(context).colorScheme.onError),
                decoration: InputDecoration(labelText: "Description"),
                maxLines: 8,
                controller: descriptionController,
                onChanged: (String description) async {
                  await context
                      .read<TodoDetailsCubit>()
                      .DescChange(description);
                },
              ),
            ),
            for (Subtask td in state.subs)
              subtask_item(
                sub: td,
                dataSource: dataSource,
                onToDoChanged: (id) {
                  context.read<TodoDetailsCubit>().SubDoneChange(id);
                },
                onDeleteItem: (sub) {
                  context
                      .read<TodoDetailsCubit>()
                      .handleDeleteSub(state.toDo.id, sub);
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
                      color: Theme.of(context).colorScheme.secondary,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 10.0,
                            spreadRadius: 0.0),
                      ],
                    ),
                    child: TextField(
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary),
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary),
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
                    onPressed: () async {
                      await context
                          .read<TodoDetailsCubit>()
                          .addToDoSubItem(newsubController.text);
                      await context.read<TodoDetailsCubit>().refresh(null);
                      newsubController.text = "";
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        minimumSize: Size(60, 60),
                        elevation: 10),
                  ),
                )
              ]),
            )
          ],
        );
      }),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () async {
          await context.read<TodoCubit>().refresh(null);
          Navigator.of(context).pop();
        },
      ),
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text("Details"),
          ),
          IconButton(
            icon: context.watch<ThemeProvider>().isDarkMode == 1
                ? Icon(Icons.dark_mode, size: 30)
                : context.watch<ThemeProvider>().isDarkMode == 0
                    ? Icon(Icons.light_mode, size: 30)
                    : Icon(Icons.person, size: 30),
            onPressed: () {
              context.read<ThemeProvider>().toggleTheme();
            },
          ),
        ],
      ),
    );
  }
}
