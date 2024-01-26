import 'package:flutter/material.dart';
import 'package:inf/main.dart';
import 'package:provider/provider.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';
import 'package:inf/screens/options.dart';

class WheelPickerPage extends StatefulWidget {
  const WheelPickerPage({Key? key, required this.color}) : super(key: key);
  final HSVColor color;
  @override
  State<WheelPickerPage> createState() => _WheelPickerPageState(cl: color);
}

class _WheelPickerPageState extends State<WheelPickerPage> {
  _WheelPickerPageState({required this.cl});
  final HSVColor cl;
  late HSVColor color = cl;
  void onChanged(HSVColor color) => this.color = color;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context, color),
      body: Center(
        child: SizedBox(
          child: Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(0.0),
              ),
            ),
            elevation: 2.0,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: color.toColor(),
                  ),
                  const Divider(),
                  SizedBox(
                    width: 222,
                    height: 222,
                    child: WheelPicker(
                      color: color,
                      onChanged: (value) => super.setState(
                        () => onChanged(value),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

AppBar _buildAppBar(BuildContext context, HSVColor color) {
  return AppBar(
    leading: IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () async {
        Navigator.of(context).pop(color);
      },
    ),
    elevation: 0,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.center,
          child: Text("Colors"),
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
