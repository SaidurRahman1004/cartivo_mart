import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app/assets_pats.dart';

class AppLogo extends StatelessWidget {
  final double? height;
  final double? width;

  const AppLogo({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AssetsPats.logoSvg, height: height, width: width);
  }
}
