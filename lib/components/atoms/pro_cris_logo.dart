// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProCrisLogo extends StatelessWidget {
  ProCrisLogo({super.key, this.width, this.height});
  double? width;
  double? height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/logos/pro_cris_logo.svg',
      width: width,
      height: height,
    );
  }
}
