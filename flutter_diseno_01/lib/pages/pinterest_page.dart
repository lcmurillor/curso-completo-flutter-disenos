// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_01/theme/theme.dart';
import 'package:flutter_01/widgets/pinterest_menu.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _MenuModel(),
      child: Scaffold(
        body:
            Stack(children: const [PinterestGrid(), _PinterestmenuLocation()]),
      ),
    );
  }
}

class _PinterestmenuLocation extends StatelessWidget {
  const _PinterestmenuLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final mostrar = Provider.of<_MenuModel>(context).mostrar;
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    if (width > 500) {
      width = width - 300;
    }
    return Positioned(
        bottom: 30,
        child: SizedBox(
            width: width,
            child: Row(
              children: [
                const Spacer(),
                PinterestMenu(
                    backgroundColor: appTheme.scaffoldBackgroundColor,
                    mostrar: mostrar,
                    activeColor: appTheme.colorScheme.secondary,
                    inactiveColor: Colors.blueGrey,
                    items: [
                      PinterestButton(
                          onPressed: () {
                            print('pie_chart');
                          },
                          icon: Icons.pie_chart),
                      PinterestButton(
                          onPressed: () {
                            print('search');
                          },
                          icon: Icons.search),
                      PinterestButton(
                          onPressed: () {
                            print('notifications');
                          },
                          icon: Icons.notifications),
                      PinterestButton(
                          onPressed: () {
                            print('supervised_user_circle');
                          },
                          icon: Icons.supervised_user_circle),
                    ]),
                const Spacer(),
              ],
            )));
  }
}

class PinterestGrid extends StatefulWidget {
  const PinterestGrid({Key? key}) : super(key: key);

  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(200, (index) => index);
  ScrollController controller = ScrollController();
  double scrollAnterior = 0;

  @override
  void initState() {
    controller.addListener(() {
      print('Scroll listener');
      if (controller.offset > scrollAnterior && controller.offset > 150) {
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;
      }
      scrollAnterior = controller.offset;
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int count;
    if (MediaQuery.of(context).size.width > 500) {
      count = 3;
    } else {
      count = 2;
    }

    return StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: count,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) =>
          _PinterestItem(index: index),
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(1, index.isEven ? 1 : 2),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {
  const _PinterestItem({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Center(
          child: CircleAvatar(
        backgroundColor: Colors.white,
        child: Text('$index'),
      )),
    );
  }
}

class _MenuModel with ChangeNotifier {
  bool _mostrar = true;
  bool get mostrar => _mostrar;

  set mostrar(bool valor) {
    _mostrar = valor;
    notifyListeners();
  }
}
