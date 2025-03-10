import 'package:flutter/material.dart';
import 'package:flutter_01/theme/theme.dart';
import 'package:flutter_01/widgets/slideshow.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLarge;

    if (MediaQuery.of(context).size.height > 500) {
      isLarge = true;
    } else {
      isLarge = false;
    }
    final chlilden = [
      const Expanded(child: MiSlideshow()),
      const Expanded(child: MiSlideshow()),
    ];
    return Scaffold(
        body: (isLarge)
            ? Column(children: chlilden)
            : Row(
                children: chlilden,
              ));
  }
}

class MiSlideshow extends StatelessWidget {
  const MiSlideshow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Slideshow(
      bulletPrimario: 15,
      bulletSecundario: 12,
      colorPrimario: appTheme.currentTheme.colorScheme.secondary,
      colorSecundario: Colors.black12,
      slides: [
        SvgPicture.asset('assets/1.svg'),
        SvgPicture.asset('assets/2.svg'),
        SvgPicture.asset('assets/3.svg'),
        SvgPicture.asset('assets/4.svg'),
        SvgPicture.asset('assets/5.svg'),
      ],
    );
  }
}
