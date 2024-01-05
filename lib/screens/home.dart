import 'package:flutter/material.dart';
import 'package:inf/classes/todo_item.dart';
import 'package:inf/classes/todo.dart';
import 'package:inf/helpers/colors.dart';
import 'package:inf/main.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todoList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    _foundToDo = todoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: isDarkMode ? tdGrey : tdBGColor,
      appBar: _buildAppBar(context),
      body: Stack(children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(children: [
            searchBox(),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 50,
                      bottom: 20,
                    ),
                    child: Text(
                      "All todos",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                  ),
                  for (ToDo td in _foundToDo)
                    todo_item(
                      todo: td,
                      onToDoChanged: _handleToDoChange,
                      onDeleteItem: _handleDeleteToDo,
                    ),
                  SizedBox(
                    height: 75,
                  )
                ],
              ),
            )
          ]),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            // Expanded(
            //   child: Container(
            //     margin: EdgeInsets.only(
            //       bottom: 20,
            //       right: 20,
            //       left: 20,
            //     ),
            //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       boxShadow: [
            //         BoxShadow(
            //             color: Colors.grey,
            //             offset: Offset(0.0, 0.0),
            //             blurRadius: 10.0,
            //             spreadRadius: 0.0),
            //       ],
            //     ),
            //     child: TextField(
            //       decoration: InputDecoration(
            //         hintText: "Add new item",
            //         border: InputBorder.none,
            //       ),
            //       controller: _todoController,
            //     ),
            //   ),
            // ),
            Container(
              margin: EdgeInsets.only(bottom: 20, right: 20),
              child: ElevatedButton(
                child: Text(
                  "+",
                  style: TextStyle(fontSize: 40),
                ),
                onPressed: () {
                  _addToDoItem(_todoController.text);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: tdBlue,
                    minimumSize: Size(60, 60),
                    elevation: 10),
              ),
            )
          ]),
        )
      ]),
    );
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.done = !todo.done;
    });
  }

  void _handleDeleteToDo(String id) {
    setState(() {
      todoList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo) {
    setState(() {
      todoList.add(ToDo(
          id: DateTime.now().microsecondsSinceEpoch.toString(), text: toDo));
    });
    _todoController.clear();
  }

  void _runFilter(String key) {
    List<ToDo> results = [];
    if (key.isEmpty) {
      results = todoList;
    } else {
      results = todoList
          .where((item) => item.text!.toLowerCase().contains(key.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundToDo = results;
    });
  }

  AppBar _buildAppBar(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.currentTheme?.brightness == Brightness.dark;
    return AppBar(
      //backgroundColor: isDarkMode ? tdGrey : tdBGColor,
      elevation: 0,
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        IconButton(
          icon: Icon(Icons.menu,
              // color: isDarkMode ? Colors.white : Colors.black12,
              size: 30),
          onPressed: () {},
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

  Widget searchBox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: tdBlack,
            size: 30,
          ),
          prefixIconConstraints: BoxConstraints(maxHeight: 20, maxWidth: 25),
          border: InputBorder.none,
          hintText: "Search",
          hintStyle: TextStyle(color: tdGrey),
        ),
      ),
    );
  }
}
