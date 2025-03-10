import 'package:flutter/material.dart';
import 'package:flutter_01/models/layout_model.dart';
import 'package:flutter_01/pages/launcher_page.dart';
import 'package:flutter_01/pages/launcher_tablet_page.dart';
import 'package:flutter_01/theme/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ThemeChanger(1)),
      ChangeNotifierProvider(create: (_) => LayoutModel())
    ], child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context).currentTheme;
    return MaterialApp(
        theme: theme,
        title: 'Diseños App',
        debugShowCheckedModeBanner: false,
        home: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            final screenSize = MediaQuery.of(context).size;
            if (screenSize.width > 500) {
              return const LauncherTabletPage();
            } else {
              return const LauncherPage();
            }
          },
        ));
  }
}
