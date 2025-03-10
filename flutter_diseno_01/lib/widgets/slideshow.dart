// ignore_for_file: unnecessary_getters_setters

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  const Slideshow(
      {Key? key,
      required this.slides,
      this.puntosArriba = false,
      required this.colorPrimario,
      required this.colorSecundario,
      this.bulletPrimario = 15,
      this.bulletSecundario = 15})
      : super(key: key);

  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;
  final double bulletPrimario;
  final double bulletSecundario;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SlideshowModel(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (context) {
              Provider.of<_SlideshowModel>(context, listen: false)
                  .colorPrimario = colorPrimario;
              Provider.of<_SlideshowModel>(context, listen: false)
                  .colorSecundario = colorSecundario;
              Provider.of<_SlideshowModel>(context, listen: false)
                  .bulletPrimario = bulletPrimario;
              Provider.of<_SlideshowModel>(context, listen: false)
                  .bulletSecundario = bulletSecundario;

              return _CrearExtructuraSlideshow(
                  puntosArriba: puntosArriba, slides: slides);
            },
          ),
        ),
      ),
    );
  }
}

class _CrearExtructuraSlideshow extends StatelessWidget {
  const _CrearExtructuraSlideshow({
    Key? key,
    required this.puntosArriba,
    required this.slides,
  }) : super(key: key);

  final bool puntosArriba;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (puntosArriba) ...[_Dots(totalSlides: slides.length)],
        Expanded(child: _Slides(slides: slides)),
        if (!puntosArriba) ...[_Dots(totalSlides: slides.length)],
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({Key? key, required this.totalSlides}) : super(key: key);

  final int totalSlides;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(totalSlides, (index) => _Dot(index: index)),
        //children: const [_Dot(index: 0), _Dot(index: 1), _Dot(index: 2)],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    final slideshowModel = Provider.of<_SlideshowModel>(context);
    double tamano;
    Color color;
    if (slideshowModel.currentPage >= index - 0.5 &&
        slideshowModel.currentPage < index + 0.5) {
      tamano = slideshowModel.bulletPrimario;
      color = slideshowModel.colorPrimario;
    } else {
      tamano = slideshowModel.bulletSecundario;
      color = slideshowModel.colorSecundario;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: tamano,
      height: tamano,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class _Slides extends StatefulWidget {
  const _Slides({Key? key, required this.slides}) : super(key: key);

  final List<Widget> slides;
  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      Provider.of<_SlideshowModel>(context, listen: false).currentPage =
          pageViewController.page!;
    });
    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageViewController,
      physics: const BouncingScrollPhysics(),
      children: widget.slides.map((slide) => _Slide(slide: slide)).toList(),
      // children: const [
      //   _Slide(svg: 'assets/1.svg'),
      //   _Slide(svg: 'assets/2.svg'),
      //   _Slide(svg: 'assets/3.svg'),
      // ],
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide({
    Key? key,
    required this.slide,
  }) : super(key: key);
  final Widget slide;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: slide,
    );
  }
}

class _SlideshowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _colorPrimario = Colors.pink;
  Color _colorSecundario = Colors.grey;

  double _bulletPrimario = 12;
  double _bulletSecundario = 12;

  double get currentPage => _currentPage;

  set currentPage(double currentPage) {
    _currentPage = currentPage;
    notifyListeners();
  }

  Color get colorPrimario => _colorPrimario;

  set colorPrimario(Color color) {
    _colorPrimario = color;
    //notifyListeners();
  }

  Color get colorSecundario => _colorSecundario;

  set colorSecundario(Color color) {
    _colorSecundario = color;
    //notifyListeners();
  }

  double get bulletPrimario => _bulletPrimario;

  set bulletPrimario(double valor) {
    _bulletPrimario = valor;
    //notifyListeners();
  }

  double get bulletSecundario => _bulletSecundario;

  set bulletSecundario(double valor) {
    _bulletSecundario = valor;
    //notifyListeners();
  }
}
