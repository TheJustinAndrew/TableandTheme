import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:softinfosystemsproj/Pages/Theme/theme_model.dart';
import 'package:softinfosystemsproj/Pages/Theme/theme_preference.dart';

class ThemePage extends StatefulWidget {
  const ThemePage({Key? key}) : super(key: key);

  @override
  State<ThemePage> createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  Color pickerColor = Color(0xff443a49);

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getColor();
  }

  getColor() async {
    int color = await ThemePreferences().getTheme();
    setState(() {
      pickerColor = Color(color);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
        body: Container(
          color: Theme.of(context).colorScheme.primary.withOpacity(.3),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ColorPicker(
                  //Alpha color does not recognized by material color eg: we need 0xff but it provides 0xXX so color cannot be identified
                  enableAlpha: false,
                  // hexInputBar: false,
                  pickerColor: pickerColor,
                  onColorChanged: changeColor,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          color: Theme.of(context).colorScheme.primary.withOpacity(.3),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                child: const Text('Change theme'),
                onPressed: () {
                  themeNotifier.changeColor = pickerColor;
                },
              ),
            ),
          ),
        ),
      );
    });
  }
}
