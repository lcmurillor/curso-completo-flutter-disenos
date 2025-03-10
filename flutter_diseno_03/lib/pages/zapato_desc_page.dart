import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesapp/helpers/helpers.dart';
import 'package:shoesapp/models/zapato_model.dart';
import 'package:shoesapp/widgets/widgets.dart';

class ZapatoDescPage extends StatelessWidget {
  const ZapatoDescPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    cambiarStatusLight();
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              const Hero(
                  tag: 'zapato-1', child: ZapatoSizePreview(fullScreen: true)),
              Positioned(
                  top: 80,
                  child: FloatingActionButton(
                    onPressed: () {
                      cambiarStatusDark();
                      Navigator.pop(context);
                    },
                    elevation: 0,
                    hoverElevation: 0,
                    backgroundColor: Colors.transparent,
                    child: const Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: 60,
                    ),
                  ))
            ],
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: const [
                ZapatoInfo(
                  titulo: 'Nike Air Max 720',
                  descripcion:
                      "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                ),
                _MontoBoyNow(),
                _ColoresYMas(),
                _BotonesLikeCartSettings()
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class _BotonesLikeCartSettings extends StatelessWidget {
  const _BotonesLikeCartSettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const _BotonoSombreado(
            icon: Icon(
              Icons.star,
              color: Colors.red,
              size: 25,
            ),
          ),
          _BotonoSombreado(
            icon: Icon(
              Icons.add_shopping_cart,
              color: Colors.grey.withOpacity(0.4),
              size: 25,
            ),
          ),
          _BotonoSombreado(
            icon: Icon(
              Icons.settings,
              color: Colors.grey.withOpacity(0.4),
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}

class _BotonoSombreado extends StatelessWidget {
  const _BotonoSombreado({
    Key? key,
    required this.icon,
  }) : super(key: key);
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: -5,
              blurRadius: 12,
              offset: Offset(0, 1),
            )
          ]),
      child: icon,
    );
  }
}

class _ColoresYMas extends StatelessWidget {
  const _ColoresYMas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
              child: Stack(children: const [
            Positioned(
                left: 90,
                child: _BotonColor(
                  color: Color(0xffc6d642),
                  index: 4,
                  ruta: 'assets/verde.png',
                )),
            Positioned(
                left: 60,
                child: _BotonColor(
                  color: Color(0xffffad29),
                  index: 3,
                  ruta: 'assets/amarillo.png',
                )),
            Positioned(
                left: 30,
                child: _BotonColor(
                  color: Color(0xff2099f1),
                  index: 2,
                  ruta: 'assets/azul.png',
                )),
            _BotonColor(
              color: Color(0xff364d56),
              index: 1,
              ruta: 'assets/negro.png',
            ),
          ])),
          const BotonNaranja(
            texto: 'More related items',
            alto: 30,
            ancho: 150,
            color: Color(0xffffc675),
          )
        ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {
  const _BotonColor({
    Key? key,
    required this.color,
    required this.index,
    required this.ruta,
  }) : super(key: key);
  final Color color;
  final int index;
  final String ruta;
  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: index * 100),
      duration: const Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
          zapatoModel.assetImage = ruta;
        },
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class _MontoBoyNow extends StatelessWidget {
  const _MontoBoyNow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 20),
        child: Row(children: [
          const Text(
            '\$180.0',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Bounce(
              delay: const Duration(seconds: 1),
              from: 8,
              child:
                  const BotonNaranja(texto: 'Buy now', alto: 40, ancho: 120)),
        ]),
      ),
    );
  }
}
