// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StudentsIcon extends StatelessWidget {
  StudentsIcon({
    super.key,
    this.width,
    this.height,
  });

  String svgPath = 'assets/icons/students_icon.svg';
  double? width;
  double? height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgPath,
      width: width,
      height: height,
      semanticsLabel: 'Aulas',
    );
  }
}
