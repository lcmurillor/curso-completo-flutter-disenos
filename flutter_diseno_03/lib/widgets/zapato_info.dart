import 'package:flutter/material.dart';

class ZapatoInfo extends StatelessWidget {
  const ZapatoInfo({Key? key, required this.titulo, required this.descripcion})
      : super(key: key);
  final String titulo;
  final String descripcion;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            titulo,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
          Text(descripcion,
              style: const TextStyle(color: Colors.black54, height: 1.6)),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
