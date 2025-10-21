import 'package:flutter/cupertino.dart';

import 'package:ai_dreams/generation/screen.dart';
import 'package:ai_dreams/user/settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'AI Dreams',
      theme: CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: CupertinoColors.systemBlue,
      ),
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      // ),

      // NOTE: FutureBuilder ST 3 tabs for logged in users, 2 for free/adds users.
      home: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),
            // BottomNavigationBarItem(icon: Icon(CupertinoIcons.book), label: 'Library'),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings),
              label: 'Settings',
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return const <Widget>[
            GenerationScreen(),
            // LibraryPage(),
            SettingsPage(),
          ][index];
        },
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
