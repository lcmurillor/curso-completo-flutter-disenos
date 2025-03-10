import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderCuadrado extends StatelessWidget {
  const HeaderCuadrado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: const Color(0xff615aab),
    );
  }
}

class HeaderBordesRedondeados extends StatelessWidget {
  const HeaderBordesRedondeados({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        color: Color(0xff615aab),
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  const HeaderDiagonal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    //Propiedades del lapiz
    paint.color = const Color(0xff615aab);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2;

    final path = Path();
    //Dibujar con el path t el lapiz
    //Se mueve
    path.moveTo(0, size.height * 0.35);
    //pinta
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(0, size.height * 0.35);

    //Dibuja
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderTriangular extends StatelessWidget {
  const HeaderTriangular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderTriangularPainter(),
      ),
    );
  }
}

class _HeaderTriangularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    //Propiedades del lapiz
    paint.color = const Color(0xff615aab);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2;

    final path = Path();

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    //Dibuja
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderPico extends StatelessWidget {
  const HeaderPico({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderPicoPainter(),
      ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    //Propiedades del lapiz
    paint.color = const Color(0xff615aab);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2;

    final path = Path();
    path.lineTo(0, size.height * 0.30);
    path.lineTo(size.width * 0.50, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    //Dibuja
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderCurvo extends StatelessWidget {
  const HeaderCurvo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    //Propiedades del lapiz
    paint.color = const Color(0xff615aab);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2;

    final path = Path();
    path.lineTo(0, size.height * 0.30);
    //Como hacer curbatura, las primeras 2 coodenas es por donde pasa la curva, la seguntas 2 coordenadas
    //son el din de la cruva.
    path.quadraticBezierTo(
        size.width * 0.50, size.height * 0.50, size.width, size.height * 0.30);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    //Dibuja
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderDobleCurva extends StatelessWidget {
  const HeaderDobleCurva({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDobleCurvaPainter(),
      ),
    );
  }
}

class _HeaderDobleCurvaPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    //Propiedades del lapiz
    paint.color = const Color(0xff615aab);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2;

    final path = Path();
    path.lineTo(0, size.height * 0.30);
    //Como hacer curbatura, las primeras 2 coodenas es por donde pasa la curva, la seguntas 2 coordenadas
    //son el din de la cruva.
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.35,
        size.width * 0.50, size.height * 0.30);

    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.25, size.width, size.height * 0.30);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    //Dibuja
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderDobleCurvaGrediente extends StatelessWidget {
  const HeaderDobleCurvaGrediente({Key? key, required this.color})
      : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDobleCurvaGredientePainter(color),
      ),
    );
  }
}

class _HeaderDobleCurvaGredientePainter extends CustomPainter {
  _HeaderDobleCurvaGredientePainter(this.color);

  final Color? color;

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect =
        Rect.fromCircle(center: const Offset(150.0, 150.0), radius: 180);
    Gradient gradiente = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          color!,
          const Color(0xffc012ff),
          color!,
        ]);
    final paint = Paint()..shader = gradiente.createShader(rect);
    //Propiedades del lapiz
    paint.color = color!;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2;

    final path = Path();
    path.lineTo(0, size.height * 0.30);
    //Como hacer curbatura, las primeras 2 coodenas es por donde pasa la curva, la seguntas 2 coordenadas
    //son el din de la cruva.
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.35,
        size.width * 0.50, size.height * 0.30);

    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.25, size.width, size.height * 0.30);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    //Dibuja
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class IconHeader extends StatelessWidget {
  const IconHeader(
      {Key? key,
      required this.icon,
      required this.titulo,
      required this.subTitulo,
      this.color1 = const Color(0xff526bf6),
      this.color2 = const Color(0xff67acf2)})
      : super(key: key);
  final IconData icon;
  final String titulo;
  final String subTitulo;
  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    final Color colorbalnco = Colors.white.withOpacity(0.7);
    return Stack(
      children: [
        _IconHeaderBackground(color1: color1, color2: color2),
        Positioned(
            top: -50,
            left: -70,
            child: FaIcon(
              icon,
              size: 250,
              color: Colors.white.withOpacity(0.2),
            )),
        Column(
          children: [
            const SizedBox(
              height: 80,
              width: double.infinity,
            ),
            Text(
              subTitulo,
              style: TextStyle(fontSize: 20, color: colorbalnco),
            ),
            const SizedBox(height: 20),
            Text(
              titulo,
              style: TextStyle(
                  fontSize: 25,
                  color: colorbalnco,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            FaIcon(
              icon,
              size: 80,
              color: Colors.white,
            ),
          ],
        )
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  const _IconHeaderBackground({
    Key? key,
    required this.color1,
    required this.color2,
  }) : super(key: key);
  final Color color1;
  final Color color2;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        //color: Colors.red,
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(80)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            color1,
            color2,
          ],
        ),
      ),
    );
  }
}
