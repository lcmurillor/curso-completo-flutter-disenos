// ignore_for_file: avoid_print, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final void Function()? onPressed;
  final IconData icon;

  PinterestButton({required this.onPressed, required this.icon});
}

class PinterestMenu extends StatelessWidget {
  const PinterestMenu(
      {Key? key,
      this.mostrar = true,
      this.backgroundColor = Colors.white,
      this.activeColor = Colors.red,
      this.inactiveColor = Colors.blueGrey,
      required this.items})
      : super(key: key);
  final bool mostrar;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final List<PinterestButton> items;


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => _MenuModel(),
        child: AnimatedOpacity(
            duration: const Duration(milliseconds: 250),
            opacity: (mostrar) ? 1 : 0,
            child: Builder(
              builder: (context) {
                Provider.of<_MenuModel>(context, listen: false)
                    .backgroundColor = backgroundColor;
                Provider.of<_MenuModel>(context, listen: false).activeColor =
                    activeColor;

                Provider.of<_MenuModel>(context, listen: false).inactiveColor =
                    inactiveColor;

                return _PinterestmenuBackground(
                    child: _MenuItems(menuItems: items));
              },
            )));
  }
}

class _PinterestmenuBackground extends StatelessWidget {
  const _PinterestmenuBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    Color backGroundColor = Provider.of<_MenuModel>(context).backgroundColor;
    return Container(
      child: child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
          color: backGroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          boxShadow: const [
            BoxShadow(
                color: Colors.black38,
                offset: Offset(0, 0),
                blurRadius: 10,
                spreadRadius: -5),
          ]),
    );
  }
}

class _MenuItems extends StatelessWidget {
  const _MenuItems({Key? key, required this.menuItems}) : super(key: key);

  final List<PinterestButton> menuItems;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
          menuItems.length,
          (index) =>
              _PinterestMenubutton(index: index, item: menuItems[index])),
    );
  }
}

class _PinterestMenubutton extends StatelessWidget {
  const _PinterestMenubutton(
      {Key? key, required this.index, required this.item})
      : super(key: key);
  final int index;
  final PinterestButton item;

  @override
  Widget build(BuildContext context) {
    final itemSeleccionado = Provider.of<_MenuModel>(context).itemSeleccionado;
    final menuModel = Provider.of<_MenuModel>(context);
    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado =
            index;
        item.onPressed!();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: (itemSeleccionado == index) ? 35 : 25,
          color: (itemSeleccionado == index)
              ? menuModel.activeColor
              : menuModel.inactiveColor,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSeleccionado = 0;

  Color backgroundColor = Colors.white;
  Color activeColor = Colors.black;
  Color inactiveColor = Colors.white10;
  int get itemSeleccionado => _itemSeleccionado;

  set itemSeleccionado(int index) {
    _itemSeleccionado = index;
    notifyListeners();
  }
}
