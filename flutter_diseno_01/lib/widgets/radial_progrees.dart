// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  const RadialProgress(
      {Key? key,
      required this.porcentaje,
      this.color = Colors.blue,
      this.backgroundColor = Colors.grey,
      this.stroke = 5.0,
      this.backgroudStroke = 2.0})
      : super(key: key);
  final porcentaje;
  final Color color;
  final Color backgroundColor;
  final double stroke;
  final double backgroudStroke;
  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late double porcentajeAnterior;
  @override
  void initState() {
    porcentajeAnterior = widget.porcentaje;
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);
    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;
    return AnimatedBuilder(
      animation: controller,
      // child: ,
      builder: (BuildContext context, Widget? child) {
        return Container(
          padding: const EdgeInsets.all(10.0),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MiRadialProggress(
                (widget.porcentaje - diferenciaAnimar) +
                    (diferenciaAnimar * controller.value),
                widget.color,
                widget.backgroundColor,
                widget.stroke,
                widget.backgroudStroke),
          ),
        );
      },
    );
  }
}

class _MiRadialProggress extends CustomPainter {
  _MiRadialProggress(this.porcentaje, this.color, this.backgroundColor,
      this.stroke, this.backgroudStroke);
  final double porcentaje;
  final Color color;
  final Color backgroundColor;
  final double stroke;
  final double backgroudStroke;
  @override
  void paint(Canvas canvas, Size size) {
    //Circulo completado
    final paint = Paint()
      ..strokeWidth = backgroudStroke
      ..color = backgroundColor
      ..style = PaintingStyle.stroke;
    final Offset center = Offset(size.width * 0.5, size.height / 2);
    final double radio = min(size.width * 0.5, size.height * 0.5);
    canvas.drawCircle(center, radio, paint);

    const Gradient gradiente = LinearGradient(
        colors: [Color(0xffc012ff), Color(0xff6d05e8), Colors.red]);
    final Rect rect = Rect.fromCircle(center: const Offset(0, 0), radius: 180);
    //..color = color
    //Arco
    final paintArco = Paint()
      ..strokeWidth = stroke
      ..shader = gradiente.createShader(rect)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    //Parte que se deberá ir llenando
    double arcAngle = 2 * pi * (porcentaje / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radio), -pi / 2,
        arcAngle, false, paintArco);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
