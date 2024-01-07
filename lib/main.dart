import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(),
      )
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'I Nearly Forgot',
      home: Home(),
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
