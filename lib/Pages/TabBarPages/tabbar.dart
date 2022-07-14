import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:softinfosystemsproj/Pages/TabBarPages/TablePage/table_page.dart';
import 'package:softinfosystemsproj/Pages/Theme/theme_page.dart';

import '../Theme/theme_model.dart';

class HomeTabBar extends StatefulWidget {
  const HomeTabBar({Key? key}) : super(key: key);

  @override
  State<HomeTabBar> createState() => _HomeTabBarState();
}

class _HomeTabBarState extends State<HomeTabBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Table and Theme"),
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(
                    Icons.table_view,
                  ),
                  child: Text("Entries"),
                ),
                Tab(
                  icon: Icon(Icons.settings_rounded),
                  child: Text("Theme Settings"),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              TablePage(),
              ThemePage(),
            ],
          ),
        ),
      );
    });
  }
}
