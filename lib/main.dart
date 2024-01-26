import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inf/firebase_options.dart';
import 'package:inf/classes/colors.dart';
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

  IsarTodoDataSource dataSource = IsarTodoDataSource();
  await dataSource.init();
  TodoCubit todoCubit = TodoCubit(ds: dataSource);
  await todoCubit.init(null);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(ds: dataSource),
        ),
      ],
      child: BlocProvider(
        create: (context) => todoCubit,
        child: MyApp(
          dataSource: dataSource,
        ),
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
  int isDarkMode = 0;
  IsarTodoDataSource ds;

  ThemeProvider({required this.ds}) {
    setLightMode();
  }

  setLightMode() {
    currentTheme = ThemeData(
      //brightness: Brightness.light,
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Color.fromARGB(255, 94, 183, 243),
          onPrimary: Color.fromARGB(221, 255, 255, 255),
          secondary: Color.fromARGB(255, 237, 242, 246),
          onSecondary: Colors.black, //text
          error: Color.fromARGB(255, 208, 12, 48),
          onError: Colors.black,
          background: Colors.white,
          onBackground: Colors.black,
          surface: Color.fromARGB(255, 110, 217, 232),
          onSurface: Colors.black),
    );
    isDarkMode = 0;
    notifyListeners();
  }

  setDarkMode() {
    currentTheme = ThemeData(
        colorScheme: ColorScheme(
            brightness: Brightness.dark,
            primary: const Color(0xffbb86fc),
            onPrimary: Colors.white,
            secondary: Colors.white,
            onSecondary: Colors.black,
            error: const Color(0xffcf6679),
            onError: Colors.white,
            background: const Color(0xff121212),
            onBackground: Colors.white,
            surface: const Color(0xff121212),
            onSurface: Colors.white),
        brightness: Brightness.dark);
    isDarkMode = 1;
    notifyListeners();
  }

  setCustomMode() async {
    Personalize? colors = await ds.getp(0);
    if (colors != null) {
      var bg = colors!.tdBGColor;
      var ic = colors!.tdIcon;
      var tile = colors!.tdTile;
      var txt = colors!.tdText;
      var del = colors!.tdDelete;
      var nobg = colors!.tdTextWithoutBackground;
      var ch = colors!.tdCheckbox;
      currentTheme = ThemeData(
        colorScheme: ColorScheme(
            brightness: colors!.customBrightness,
            primary: Color.fromARGB(bg[0], bg[1], bg[2], bg[3]),
            onPrimary: Color.fromARGB(ic[0], ic[1], ic[2], ic[3]),
            secondary: Color.fromARGB(tile[0], tile[1], tile[2], tile[3]),
            onSecondary: Color.fromARGB(txt[0], txt[1], txt[2], txt[3]),
            error: Color.fromARGB(del[0], del[1], del[2], del[3]),
            onError: Color.fromARGB(nobg[0], nobg[1], nobg[2], nobg[3]),
            background: Colors.white,
            onBackground: Colors.black,
            surface: Color.fromARGB(ch[0], ch[1], ch[2], ch[3]),
            onSurface: Colors.white),
      );
    }
    isDarkMode = 2;
    notifyListeners();
  }

  toggleTheme() {
    switch (isDarkMode) {
      case 0:
        setDarkMode();
      case 1:
        setCustomMode();
      case 2:
        setLightMode();
    }
  }
}
