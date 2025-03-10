import 'package:flutter/material.dart';
import 'package:transicion_app/pages/pagina2_page.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
      ),
      body: const Center(
        child: Text('Pagina1Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, _crearRuta());
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }

  Route _crearRuta() {
    return PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) =>
            const Pagina2Page(),
        transitionDuration: const Duration(milliseconds: 300),
        transitionsBuilder: (context, animation, secundaryAnimation, child) {
          final curvedAnimation =
              //En esta linea es donde se cambia la animacion.
              CurvedAnimation(parent: animation, curve: Curves.easeInOut);
          // return SlideTransition(
          //   position:
          //       //En esta se cambia la posiccion de entrada y salida de las animaciones.
          //       Tween<Offset>(begin: const Offset(0.5, 1.0), end: Offset.zero)
          //           .animate(curvedAnimation),
          //   child: child,
          // );

          // return ScaleTransition(
          //   scale: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
          //   child: child,
          // );

          // return RotationTransition(
          //   turns: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
          //   child: child,
          // );

          return FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(curvedAnimation),
            child: child,
          );
        });
  }
}
