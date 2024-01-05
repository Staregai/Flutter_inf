import 'package:flutter/material.dart';
import 'package:inf/classes/todo.dart';
import 'package:provider/provider.dart';
import 'package:inf/main.dart';

class TodoDetails extends StatefulWidget {
  final ToDo todo;

  const TodoDetails({required this.todo, Key? key}) : super(key: key);

  @override
  State<TodoDetails> createState() => _TodoDetailsState();
}

class _TodoDetailsState extends State<TodoDetails> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _titleController.text = widget.todo.text!;
    _descriptionController.text = widget.todo.description!;
    return Scaffold(
      appBar: _buildAppBar(context),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 5),
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: "Title",
            ),
            controller: _titleController,
            onChanged: (String _) {
              setState(() {
                widget.todo.text = _titleController.text;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: "Description"),
            maxLines: 8,
            controller: _descriptionController,
            onChanged: (String _) {
              setState(() {
                widget.todo.description = _descriptionController.text;
              });
            },
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.currentTheme?.brightness == Brightness.dark;

    return AppBar(
      //backgroundColor: isDarkMode ? tdGrey : tdBGColor,
      elevation: 0,
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Align(
          alignment: Alignment.center,
          child: Text("Details"),
        ),
        IconButton(
          icon: isDarkMode
              ? Icon(Icons.dark_mode, color: Colors.white, size: 30)
              : Icon(Icons.light_mode, color: Colors.black12, size: 30),
          onPressed: () {
            isDarkMode
                ? themeProvider.setLightMode()
                : themeProvider.setDarkMode();
          },
        ),
      ]),
    );
  }
}
