// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_01/models/layout_model.dart';
import 'package:flutter_01/routes/routes.dart';
import 'package:flutter_01/theme/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LauncherTabletPage extends StatelessWidget {
  const LauncherTabletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    final layoutModel = Provider.of<LayoutModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diseños en Tablet'),
        centerTitle: true,
      ),
      drawer: const _MenuPrincipal(),
      //body: const _ListaOpciones(),
      body: Row(
        children: [
          const SizedBox(
            width: 300,
            height: double.infinity,
            child: _ListaOpciones(),
          ),
          Container(
            width: 2,
            height: double.infinity,
            color: (theme.darkTheme)
                ? Colors.grey
                : theme.currentTheme.colorScheme.secondary,
          ),
          Expanded(child: layoutModel.currentPage)
        ],
      ),
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  const _ListaOpciones({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, i) => Divider(
        color: appTheme.primaryColorLight,
      ),
      itemCount: pageRoute.length,
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(
          pageRoute[i].icon,
          color: appTheme.colorScheme.secondary,
        ),
        title: Text(pageRoute[i].titulo),
        trailing: Icon(
          Icons.chevron_right,
          color: appTheme.colorScheme.secondary,
        ),
        onTap: () {
          final layoutModel = Provider.of<LayoutModel>(context, listen: false);
          layoutModel.currentPage = pageRoute[i].page;
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => pageRoute[i].page,
          //     ));
        },
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  const _MenuPrincipal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return Drawer(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                    backgroundColor: theme.currentTheme.colorScheme.secondary,
                    child: const Text(
                      'LC',
                      style: TextStyle(fontSize: 50),
                    )),
              ),
            ),
            const Expanded(child: _ListaOpciones()),
            ListTile(
              leading: Icon(
                Icons.lightbulb_outline,
                color: theme.currentTheme.colorScheme.secondary,
              ),
              title: const Text('Dark Mode'),
              trailing: Switch.adaptive(
                value: theme.darkTheme,
                onChanged: (value) {
                  theme.darkTheme = value;
                },
                activeColor: theme.currentTheme.colorScheme.secondary,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.add_to_home_screen,
                color: theme.currentTheme.colorScheme.secondary,
              ),
              title: const Text('Custom Theme'),
              trailing: Switch.adaptive(
                  value: theme.cutomTheme,
                  onChanged: (value) {
                    theme.cutomTheme = value;
                  },
                  activeColor: theme.currentTheme.colorScheme.secondary),
            )
          ],
        ),
      ),
    );
  }
}
