import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './screens/home.dart';
import 'cubits/todo_cubit.dart';
import 'classes/todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:inf/data_sources/todo_DataSource.dart';

void main() {
  IsarTodoDataSource dataSource = IsarTodoDataSource();
  TodoCubit todoCubit = TodoCubit(ds: dataSource);
  todoCubit.init(null);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
      ],
      child: BlocProvider(
        create: (context) => todoCubit,
        child: MyApp(dataSource: dataSource),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.dataSource});

  final IsarTodoDataSource dataSource;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'I Nearly Forgot',
      home: Home(
        dataSource: dataSource,
      ),
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}

class ThemeProvider extends ChangeNotifier {
  ThemeData? currentTheme;
  bool isDarkMode = false;

  setLightMode() {
    currentTheme = ThemeData(
      brightness: Brightness.light,
    );
    isDarkMode = false;
    notifyListeners();
  }

  setDarkMode() {
    currentTheme = ThemeData(
      brightness: Brightness.dark,
    );
    isDarkMode = true;
    notifyListeners();
  }

  toggleTheme() {
    isDarkMode ? setLightMode() : setDarkMode();
  }
}
