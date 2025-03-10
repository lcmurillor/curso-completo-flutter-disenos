// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_01/theme/theme.dart';
import 'package:provider/provider.dart';

class SliverListPage extends StatelessWidget {
  const SliverListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        _MainScroll(),
        Positioned(bottom: 0, right: 0, child: _BotonNewList())
      ],
    ));
  }
}

class _BotonNewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Provider.of<ThemeChanger>(context);
    return ButtonTheme(
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    theme.currentTheme.colorScheme.secondary),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(50))))),
            child: SizedBox(
              height: size.height * 0.1,
              width: size.width * 0.7,
              child: Center(
                child: Text(
                  'CREATE A NEW LIST',
                  style: TextStyle(
                      color: theme.currentTheme.scaffoldBackgroundColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2),
                ),
              ),
            ),
            onPressed: () {}));
  }
}

class _MainScroll extends StatelessWidget {
  _MainScroll({Key? key}) : super(key: key);

  final items = [
    const _ListItem(titulo: 'Orange', color: Color(0xffF08F66)),
    const _ListItem(titulo: 'Family', color: Color(0xffF2A38A)),
    const _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5)),
    const _ListItem(titulo: 'Books', color: Color(0xffFCEBAF)),
    const _ListItem(titulo: 'Orange', color: Color(0xffF08F66)),
    const _ListItem(titulo: 'Family', color: Color(0xffF2A38A)),
    const _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5)),
    const _ListItem(titulo: 'Books', color: Color(0xffFCEBAF)),
    const _ListItem(titulo: 'Orange', color: Color(0xffF08F66)),
    const _ListItem(titulo: 'Family', color: Color(0xffF2A38A)),
    const _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5)),
    const _ListItem(titulo: 'Books', color: Color(0xffFCEBAF)),
    const _ListItem(titulo: 'Orange', color: Color(0xffF08F66)),
    const _ListItem(titulo: 'Family', color: Color(0xffF2A38A)),
    const _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5)),
    const _ListItem(titulo: 'Books', color: Color(0xffFCEBAF)),
  ];
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
            floating: true,
            delegate: _SiverCustomHeaderDelegate(
                maxHeigth: 200,
                minHeight: 190,
                child: Container(
                  alignment: Alignment.centerLeft,
                  color: theme.currentTheme.scaffoldBackgroundColor,
                  child: const _Titulo(),
                ))),
        SliverList(
            delegate: SliverChildListDelegate([
          ...items,
          const SizedBox(
            height: 100,
          )
        ]))
      ],
    );
  }
}

class _SiverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  _SiverCustomHeaderDelegate(
      {required this.minHeight, required this.maxHeigth, required this.child});

  final double minHeight;
  final double maxHeigth;
  final Widget child;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeigth;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(_SiverCustomHeaderDelegate oldDelegate) {
    return maxHeigth != oldDelegate.maxHeigth ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class _ListaTareas extends StatelessWidget {
  _ListaTareas({
    Key? key,
  }) : super(key: key);

  final items = [
    const _ListItem(titulo: 'Orange', color: Color(0xffF08F66)),
    const _ListItem(titulo: 'Family', color: Color(0xffF2A38A)),
    const _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5)),
    const _ListItem(titulo: 'Books', color: Color(0xffFCEBAF)),
    const _ListItem(titulo: 'Orange', color: Color(0xffF08F66)),
    const _ListItem(titulo: 'Family', color: Color(0xffF2A38A)),
    const _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5)),
    const _ListItem(titulo: 'Books', color: Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) => items[index]);
  }
}

class _Titulo extends StatelessWidget {
  const _Titulo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return Column(
      children: [
        const SizedBox(height: 30),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Text(
            'New',
            style: TextStyle(
                color:
                    (theme.darkTheme) ? Colors.pink : const Color(0xff532128),
                fontSize: 50),
          ),
        ),
        Stack(
          children: [
            const SizedBox(width: 100),
            Positioned(
              bottom: 8,
              child: Container(
                width: 150,
                height: 8,
                color:
                    (theme.darkTheme) ? Colors.grey : const Color(0xfff7cdd5),
              ),
            ),
            const Text(
              'List',
              style: TextStyle(
                  color: Color(0xffd93a30),
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({
    Key? key,
    required this.titulo,
    required this.color,
  }) : super(key: key);
  final String titulo;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(30),
      child: Text(
        titulo,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      margin: const EdgeInsets.all(10),
      height: 130,
      decoration: BoxDecoration(
        color: (theme.darkTheme) ? Colors.grey : color,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
