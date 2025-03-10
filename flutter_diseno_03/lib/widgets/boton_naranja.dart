import 'package:flutter/material.dart';

class BotonNaranja extends StatelessWidget {
  const BotonNaranja(
      {Key? key,
      required this.texto,
      this.alto = 50,
      this.ancho = 150,
      this.color = Colors.orange})
      : super(key: key);
  final String texto;
  final double alto;
  final double ancho;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ancho,
      height: alto,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(100), color: color),
      alignment: Alignment.center,
      child: Text(
        texto,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
