// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:pro_cris_flutter/styles/pro_cris_colors.dart';
import 'package:pro_cris_flutter/components/atoms/pro_cris_logo.dart';

class ProCrisBanner extends StatelessWidget {
  ProCrisBanner({
    super.key,
    this.width,
    this.height,
  });

  double? width;
  double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: ProCrisColors.purple,
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(top: 24, right: 0, bottom: 20, left: 0),
      child: ProCrisLogo(width: 235),
    );
  }
}
