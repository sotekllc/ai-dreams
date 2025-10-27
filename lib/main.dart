import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';

import 'package:ai_dreams/generation/screen.dart';
import 'package:ai_dreams/user/settings_screen.dart';
import 'package:ai_dreams/bootstrap.dart';
import 'package:ai_dreams/theme.dart';
import 'package:ai_dreams/theme_provider.dart';

void main() async {
  BootstrapService.loadEnv();
  // DotEnv().env['googleAppID']
  WidgetsFlutterBinding.ensureInitialized();
  await initLocalStorage();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(storage: localStorage),
        ),
      ],
      child: AiDreamsApp(),
    ),
  );
  // runApp(const MyApp());
}

class AiDreamsApp extends StatelessWidget {
  const AiDreamsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'AI Dreams',
      theme: lightTheme,
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
    );
  }
}
