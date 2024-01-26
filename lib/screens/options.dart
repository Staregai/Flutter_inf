import 'package:flutter/material.dart';
import 'package:inf/classes/colors.dart';
import 'package:inf/screens/color_picker.dart';
import 'package:provider/provider.dart';
import 'package:inf/screens/home.dart';
import 'package:inf/data_sources/todo_DataSource.dart';
import 'package:inf/main.dart';

class Options extends StatefulWidget {
  const Options({Key? key, required this.dataSource}) : super(key: key);
  final IsarTodoDataSource dataSource;

  @override
  State<Options> createState() => _OptionsState(dataSource: dataSource);
}

class _OptionsState extends State<Options> {
  final IsarTodoDataSource dataSource;
  _OptionsState({required this.dataSource});

  static late bool loaded = false;
  bool loading = false;
  bool ic = true;
  Color primary = Colors.white;
  Color onprimary = Colors.white;
  Color secondary = Colors.white;
  Color onsecondary = Colors.white;
  Color error = Colors.white;
  Color onerror = Colors.white;
  Color surface = Colors.white;
  Load() async {
    if (loading == false) {
      loading = true;
      Personalize? colors = await dataSource.getp(0);
      ic = colors?.customBrightness == Brightness.dark;
      var bg = colors!.tdBGColor;
      var ico = colors!.tdIcon;
      var tile = colors!.tdTile;
      var txt = colors!.tdText;
      var del = colors!.tdDelete;
      var nobg = colors!.tdTextWithoutBackground;
      var ch = colors!.tdCheckbox;
      primary = Color.fromARGB(bg[0], bg[1], bg[2], bg[3]);
      onprimary = Color.fromARGB(ico[0], ico[1], ico[2], ico[3]);
      secondary = Color.fromARGB(tile[0], tile[1], tile[2], tile[3]);
      onsecondary = Color.fromARGB(txt[0], txt[1], txt[2], txt[3]);
      error = Color.fromARGB(del[0], del[1], del[2], del[3]);
      onerror = Color.fromARGB(nobg[0], nobg[1], nobg[2], nobg[3]);
      surface = Color.fromARGB(ch[0], ch[1], ch[2], ch[3]);
      loaded = true;
      loading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Load();

    return Scaffold(
      appBar: _buildAppBar(context),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 5),
        children: [
          Row(
            children: [
              Text(
                "Base Theme:",
                style: TextStyle(fontSize: 20),
              ),
              IconButton(
                  onPressed: () async {
                    loaded = false;
                    await dataSource.tdCustomBrightness();

                    setState(() {});
                  },
                  icon: ic
                      ? Icon(
                          Icons.light_mode,
                          size: 40,
                        )
                      : Icon(
                          Icons.dark_mode,
                          size: 40,
                        )),
            ],
          ),
          ColorTile(
            txt: "Primary color:",
            color: primary,
            id: 1,
            ds: dataSource,
          ),
          ColorTile(
            txt: "Icon color:",
            color: onprimary,
            id: 2,
            ds: dataSource,
          ),
          ColorTile(
            txt: "Tile color:",
            color: secondary,
            id: 3,
            ds: dataSource,
          ),
          ColorTile(
            txt: "Text color:",
            color: onsecondary,
            id: 4,
            ds: dataSource,
          ),
          ColorTile(
            txt: "Error and Delete icon color:",
            color: error,
            id: 5,
            ds: dataSource,
          ),
          ColorTile(
            txt: "Alt Text:",
            color: onerror,
            id: 6,
            ds: dataSource,
          ),
          ColorTile(
            txt: "Checkbox color:",
            color: surface,
            id: 7,
            ds: dataSource,
          ),
          TextButton(
            onPressed: () async => {
              await showDialog(
                  context: context, builder: (_) => const LogoutDialog())
            },
            child: Text("logout"),
          ),
          TextButton(
            onPressed: () async {
              await Load();
              setState(() {});
            },
            child: Text("refresh"),
          ),
        ],
      ),
    );
  }

  void refresh() async {
    setState(() async {
      await Load();
    });
  }
}

AppBar _buildAppBar(BuildContext context) {
  return AppBar(
    leading: IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () async {
        Navigator.of(context).pop();
      },
    ),
    elevation: 0,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.center,
          child: Text("Options"),
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

class ColorTile extends StatelessWidget {
  const ColorTile({
    required this.id,
    required this.txt,
    required this.color,
    required this.ds,
    super.key,
  });
  final int id;
  final String txt;
  final Color color;
  final IsarTodoDataSource ds;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          txt,
          style: TextStyle(fontSize: 20),
        ),
        IconButton.filled(
          onPressed: () async {
            HSVColor col = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        WheelPickerPage(color: HSVColor.fromColor(color))));

            Color co = col.toColor();

            switch (id) {
              case 1:
                await ds.tdBgColor(co.alpha, co.red, co.green, co.blue);
              case 2:
                await ds.tdIcon(co.alpha, co.red, co.green, co.blue);
              case 3:
                await ds.tdTile(co.alpha, co.red, co.green, co.blue);
              case 4:
                await ds.tdText(co.alpha, co.red, co.green, co.blue);
              case 5:
                await ds.tdDelete(co.alpha, co.red, co.green, co.blue);
              case 6:
                await ds.tdTextWithoutBackground(
                    co.alpha, co.red, co.green, co.blue);
              case 7:
                await ds.tdCheckbox(co.alpha, co.red, co.green, co.blue);
            }
          },
          icon: Icon(
            Icons.square,
            color: color,
          ),
          color: Colors.black,
          iconSize: 40,
        )
      ],
    );
  }
}
