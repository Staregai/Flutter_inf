import 'package:flutter/material.dart';
import 'package:inf/classes/todo_item.dart';
import 'package:inf/classes/todo.dart';
import 'package:inf/helpers/colors.dart';
import 'package:inf/main.dart';
import 'package:inf/cubits/todo_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inf/screens/todo_details.dart';

class Home extends StatelessWidget {
  final _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(ToDo.todoList()),
      child: HomeContent(todoController: _todoController),
    );
  }
}

class HomeContent extends StatelessWidget {
  final TextEditingController _todoController;

  const HomeContent({Key? key, required TextEditingController todoController})
      : _todoController = todoController,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Stack(children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              searchBox(context),
              Expanded(
                child: BlocBuilder<TodoCubit, TodoState>(
                  builder: (context, state) {
                    return ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 50, bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "All todos",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.w500),
                              ),
                              IconButton(
                                onPressed: () {
                                  _showSortOptions(context);
                                },
                                icon: Icon(Icons.filter_list),
                              ),
                            ],
                          ),
                        ),
                        for (ToDo td in state.shownTodos)
                          todo_item(
                            todo: td,
                            onToDoChanged: (todo) {
                              context.read<TodoCubit>().handleToDoChange(todo);
                            },
                            onDeleteItem: (id) {
                              context.read<TodoCubit>().handleDeleteToDo(id);
                            },
                          ),
                        SizedBox(
                          height: 75,
                        ),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
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
                  ToDo td = context
                      .read<TodoCubit>()
                      .addToDoItem(_todoController.text);
                  final route = MaterialPageRoute(
                    builder: (context) => TodoDetails(todo: td),
                  );
                  Navigator.push(context, route);
                  _todoController.clear();
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

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.menu, size: 30),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              context.watch<ThemeProvider>().isDarkMode
                  ? Icons.dark_mode
                  : Icons.light_mode,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              context.read<ThemeProvider>().toggleTheme();
            },
          ),
        ],
      ),
    );
  }

  Widget searchBox(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        style: TextStyle(color: tdBlack),
        onChanged: (value) {
          context.read<TodoCubit>().runFilter(value);
        },
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

  Future<void> _showSortOptions(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sort Options'),
          content: Column(
            children: [
              _buildSortOption(
                  context, 'Alphabetically Increasing (Not Done First)'),
              _buildSortOption(
                  context, 'Alphabetically Decreasing (Not Done First)'),
              _buildSortOption(
                  context, 'Alphabetically Increasing (Done First)'),
              _buildSortOption(
                  context, 'Alphabetically Decreasing (Done First)'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSortOption(BuildContext context, String option) {
    return InkWell(
      onTap: () {
        // Implement sorting logic based on the selected option
        context.read<TodoCubit>().sortTodos(option);
        Navigator.pop(context); // Close the dialog
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          option,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
