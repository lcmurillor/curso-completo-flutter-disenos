import 'package:flutter/material.dart';
import 'package:flutter_01/theme/theme.dart';
import 'package:flutter_01/widgets/headers.dart';
import 'package:provider/provider.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context).currentTheme;
    return Scaffold(
        body: HeaderDobleCurvaGrediente(
      color: theme.colorScheme.secondary,
    ));
  }
}
