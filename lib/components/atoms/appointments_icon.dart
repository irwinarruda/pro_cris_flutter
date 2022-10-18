// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pro_cris_flutter/styles/pro_cris_colors.dart';

class AppointmentsIcon extends StatelessWidget {
  AppointmentsIcon({
    super.key,
    this.width,
    this.height,
  });

  String svgPath = 'assets/icons/appointments_icon.svg';
  double? width;
  double? height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgPath,
      color: ProCrisColors.white,
      width: width,
      height: height,
      semanticsLabel: 'Aulas',
    );
  }
}
