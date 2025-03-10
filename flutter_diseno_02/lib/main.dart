import 'package:animate_do_app/pages/pagina1_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Animate_do',
        debugShowCheckedModeBanner: false,
        home: Pagina1Page());
  }
}
