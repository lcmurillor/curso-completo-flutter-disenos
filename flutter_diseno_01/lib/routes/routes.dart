import 'package:flutter/material.dart';
import 'package:flutter_01/pages/emergency_page.dart';
import 'package:flutter_01/pages/graficas_circulares_page.dart';
import 'package:flutter_01/pages/headers_page.dart';
import 'package:flutter_01/pages/pinterest_page.dart';
import 'package:flutter_01/pages/slider_list_page.dart';
import 'package:flutter_01/pages/slideshow_page.dart';
import 'package:flutter_01/retos/cuadrado_animado_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final pageRoute = <_Route>[
  _Route(FontAwesomeIcons.slideshare, 'Slidershow', const SlideshowPage()),
  _Route(FontAwesomeIcons.truckMedical, 'Emergencia', const EmergencyPage()),
  _Route(FontAwesomeIcons.heading, 'Encabezado', const HeadersPage()),
  _Route(FontAwesomeIcons.peopleCarryBox, 'Cuadro Animado',
      const CuadradoAnimadoPage()),
  _Route(FontAwesomeIcons.circleNotch, 'Barra Progeso',
      const GraficasCircularesPage()),
  _Route(FontAwesomeIcons.pinterest, 'Pinterest', const PinterestPage()),
  _Route(FontAwesomeIcons.mobile, 'Slivers', const SliverListPage()),
];

class _Route {
  final IconData icon;
  final String titulo;
  final Widget page;

  _Route(this.icon, this.titulo, this.page);
}
