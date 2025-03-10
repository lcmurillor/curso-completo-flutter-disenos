// ignore_for_file: unnecessary_getters_setters

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavegacionPage extends StatelessWidget {
  const NavegacionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notifications page'),
          centerTitle: true,
          backgroundColor: Colors.pink,
        ),
        floatingActionButton: const BotonFlotante(),
        bottomNavigationBar: const BottomNavigation(),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int numero = Provider.of<_NotificationModel>(context).numero;
    return BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.pink,
        items: [
          const BottomNavigationBarItem(
              label: 'Bones', icon: FaIcon(FontAwesomeIcons.bone)),
          BottomNavigationBarItem(
              label: 'Notifications',
              icon: Stack(
                children: [
                  const FaIcon(FontAwesomeIcons.bell),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: BounceInDown(
                      from: 10,
                      animate: (numero > 0),
                      child: Bounce(
                        from: 10,
                        controller: (controller) =>
                            Provider.of<_NotificationModel>(context,
                                    listen: false)
                                .bounceController = controller,
                        child: Container(
                          alignment: Alignment.center,
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(
                              color: Colors.red, shape: BoxShape.circle),
                          child: Text(
                            '$numero',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 7),
                          ),
                        ),
                      ),
                    ),
                    // child: Icon(
                    //   Icons.brightness_1,
                    //   size: 8,
                    //   color: Colors.red,
                    // ),
                  )
                ],
              )),
          const BottomNavigationBarItem(
              label: 'My Dog', icon: FaIcon(FontAwesomeIcons.dog)),
        ]);
  }
}

class BotonFlotante extends StatelessWidget {
  const BotonFlotante({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        final notificationModel =
            Provider.of<_NotificationModel>(context, listen: false);
        int numero = notificationModel.numero;

        notificationModel.numero = ++numero;
        if (numero >= 2) {
          final controller = notificationModel.bounceController;
          controller.forward(from: 0.0);
        }
      },
      backgroundColor: Colors.pink,
      child: const FaIcon(FontAwesomeIcons.play),
    );
  }
}

class _NotificationModel extends ChangeNotifier {
  int _numero = 0;
  late AnimationController _bounceController;

  int get numero => _numero;

  set numero(int valor) {
    _numero = valor;
    notifyListeners();
  }

  AnimationController get bounceController => _bounceController;

  set bounceController(AnimationController controller) {
    _bounceController = controller;
  }
}
