import 'package:flutter/material.dart';
import 'package:flutter_01/theme/theme.dart';
import 'package:flutter_01/widgets/radial_progrees.dart';
import 'package:provider/provider.dart';

class GraficasCircularesPage extends StatefulWidget {
  const GraficasCircularesPage({Key? key}) : super(key: key);

  @override
  State<GraficasCircularesPage> createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  double porcentaje = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () => setState(() {
                  porcentaje += 10;
                  if (porcentaje > 100) {
                    porcentaje = 0;
                  }
                }),
            child: const Icon(Icons.refresh)),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadialProgress(
                  porcentaje: porcentaje,
                  backgroudStroke: 10,
                  backgroundColor: Colors.grey.withOpacity(0.1),
                  color: Colors.blue,
                  stroke: 10,
                ),
                CustomRadialProgress(
                  porcentaje: porcentaje * 1.2,
                  backgroudStroke: 1,
                  backgroundColor: Colors.grey.withOpacity(0.1),
                  color: Colors.red,
                  stroke: 5,
                ),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadialProgress(
                  porcentaje: porcentaje * 1.4,
                  backgroudStroke: 5,
                  backgroundColor: Colors.grey.withOpacity(0.1),
                  color: Colors.green,
                  stroke: 10,
                ),
                CustomRadialProgress(
                  porcentaje: porcentaje * 1.6,
                  backgroudStroke: 15,
                  backgroundColor: Colors.grey.withOpacity(0.1),
                  color: Colors.amber,
                  stroke: 10,
                ),
              ],
            )
          ],
        ));
  }
}

class CustomRadialProgress extends StatelessWidget {
  const CustomRadialProgress({
    Key? key,
    required this.porcentaje,
    required this.color,
    required this.backgroundColor,
    required this.stroke,
    required this.backgroudStroke,
  }) : super(key: key);

  final double porcentaje;
  final Color color;
  final Color backgroundColor;
  final double stroke;
  final double backgroudStroke;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context).currentTheme;
    return SizedBox(
        width: 150,
        height: 150,
        child: RadialProgress(
          porcentaje: porcentaje,
          color: color,
          backgroundColor: theme.textTheme.bodyText1!.color!,
          stroke: stroke,
          backgroudStroke: backgroudStroke,
        ));
  }
}
