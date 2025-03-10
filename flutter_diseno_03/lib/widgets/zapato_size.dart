import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesapp/models/zapato_model.dart';
import 'package:shoesapp/pages/zapato_desc_page.dart';

class ZapatoSizePreview extends StatelessWidget {
  const ZapatoSizePreview({Key? key, this.fullScreen = false})
      : super(key: key);

  final bool fullScreen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!fullScreen) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ZapatoDescPage(),
              ));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: (fullScreen) ? 5 : 30, vertical: (fullScreen) ? 5 : 0),
        child: Container(
            width: double.infinity,
            height: (fullScreen) ? 410 : 430,
            decoration: BoxDecoration(
              color: const Color(0xffffcf53),
              borderRadius: (fullScreen)
                  ? const BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))
                  : BorderRadius.circular(50),
            ),
            child: Column(
              children: [
                const _ZapatoConSombra(),
                if (!fullScreen) const _ZapatoTallas()
              ],
            )),
      ),
    );
  }
}

class _ZapatoTallas extends StatelessWidget {
  const _ZapatoTallas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _TallaZapatoCaja(talla: 7),
          _TallaZapatoCaja(talla: 7.5),
          _TallaZapatoCaja(talla: 8),
          _TallaZapatoCaja(talla: 8.5),
          _TallaZapatoCaja(talla: 9),
          _TallaZapatoCaja(talla: 9.5),
        ],
      ),
    );
  }
}

class _TallaZapatoCaja extends StatelessWidget {
  const _TallaZapatoCaja({
    Key? key,
    required this.talla,
  }) : super(key: key);
  final double talla;

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);
    return GestureDetector(
      onTap: () {
        zapatoModel.talla = talla;
      },
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: (talla == zapatoModel.talla)
                ? const Color(0xfff1a23a)
                : Colors.white,
            boxShadow: [
              if (talla == zapatoModel.talla)
                const BoxShadow(
                    color: Color(0xfff1a23a),
                    blurRadius: 10,
                    offset: Offset(0, 5)),
            ]),
        alignment: Alignment.center,
        child: Text(
          talla.toString().replaceAll('.0', ''),
          style: TextStyle(
              color: (talla != zapatoModel.talla)
                  ? const Color(0xfff1a23a)
                  : Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class _ZapatoConSombra extends StatelessWidget {
  const _ZapatoConSombra({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Stack(
        children: [
          const Positioned(
            bottom: 20,
            right: 0,
            child: _ZapatoSombra(),
          ),
          Image(image: AssetImage(zapatoModel.assetImage)),
        ],
      ),
    );
  }
}

class _ZapatoSombra extends StatelessWidget {
  const _ZapatoSombra({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 200,
        height: 120,
        decoration: BoxDecoration(
            // color: Colors.black,
            borderRadius: BorderRadius.circular(100),
            boxShadow: const [
              BoxShadow(color: Color(0xffeaa14e), blurRadius: 40),
            ]),
      ),
    );
  }
}
