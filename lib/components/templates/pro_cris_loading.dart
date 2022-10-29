// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:pro_cris_flutter/styles/pro_cris_colors.dart';

class ProCrisLoading extends StatelessWidget {
  ProCrisLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 75,
        height: 75,
        child: CircularProgressIndicator(
          color: ProCrisColors.gold,
          strokeWidth: 8,
        ),
      ),
    );
  }
}
