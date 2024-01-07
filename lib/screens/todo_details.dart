import 'package:flutter/material.dart';
import 'package:inf/classes/todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inf/cubits/todo_details_cubit.dart';
import 'package:inf/helpers/colors.dart';
import 'package:inf/main.dart';

class TodoDetails extends StatelessWidget {
  final ToDo todo;
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  TodoDetails({required this.todo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _titleController.text = todo.text!;
    _descriptionController.text = todo.description!;

    return BlocProvider(
      create: (context) => TodoDetailsCubit(todo),
      child: _TodoDetailsContent(
        titleController: _titleController,
        descriptionController: _descriptionController,
      ),
    );
  }
}

class _TodoDetailsContent extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController descriptionController;

  const _TodoDetailsContent({
    required this.titleController,
    required this.descriptionController,
  });

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
            onChanged: (String title) {
              context.read<TodoDetailsCubit>().updateTitle(title);
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
                onPressed: () {
                  context.read<TodoDetailsCubit>().updateDone();
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
          TextField(
            decoration: InputDecoration(labelText: "Description"),
            maxLines: 8,
            controller: descriptionController,
            onChanged: (String description) {
              context.read<TodoDetailsCubit>().updateDescription(description);
            },
          ),
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
