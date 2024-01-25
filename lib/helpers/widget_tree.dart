import 'package:inf/helpers/auth.dart';
import 'package:inf/screens/home.dart';
import 'package:inf/screens/login_register.dart';
import 'package:flutter/material.dart';
import 'package:inf/data_sources/todo_DataSource.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key, required this.dataSource}) : super(key: key);

  final dataSource;

  @override
  State<WidgetTree> createState() => _WidgetTreeState(dataSource: dataSource);
}

class _WidgetTreeState extends State<WidgetTree> {
  final dataSource;
  _WidgetTreeState({required this.dataSource});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Auth().authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Home(dataSource: dataSource);
          } else {
            return LoginPage();
          }
        });
  }
}
