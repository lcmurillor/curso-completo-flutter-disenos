// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.texto}) : super(key: key);
  final String texto;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          margin: const EdgeInsets.only(top: 30),
          width: double.infinity,
          child: Row(children: [
            Text(texto,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w700)),
            const Spacer(),
            const Icon(Icons.search, size: 30)
          ]),
        ),
      ),
    );
  }
}
