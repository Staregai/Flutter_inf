import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inf/firebase_options.dart';
import './screens/home.dart';
import 'cubits/todo_cubit.dart';
import 'classes/todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:inf/data_sources/todo_DataSource.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:inf/helpers/widget_tree.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  print("fdgfxxfhgd");
  IsarTodoDataSource dataSource = IsarTodoDataSource();
  await dataSource.init();
  TodoCubit todoCubit = TodoCubit(ds: dataSource);
  await todoCubit.init(null);
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
      home: WidgetTree(
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
