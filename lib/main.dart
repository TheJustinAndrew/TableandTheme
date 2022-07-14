import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:softinfosystemsproj/Pages/Theme/theme_model.dart';
import 'package:softinfosystemsproj/Pages/TabBarPages/tabbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Change notifier is used to change the theme of the whole app
    return ChangeNotifierProvider(
        create: (_) => ThemeModel(),
        child: Consumer<ThemeModel>(
            builder: (context, ThemeModel themeNotifier, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: themeNotifier.themeData,
            debugShowCheckedModeBanner: false,
            home: const MyHomePage(),
          );
        }));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const HomeTabBar();
  }
}
