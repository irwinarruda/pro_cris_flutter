import 'package:flutter/material.dart';
import 'package:pro_cris_flutter/components/atoms/pro_cris_logo.dart';
import 'package:pro_cris_flutter/styles/pro_cris_colors.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ProCrisColors.purple,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ProCrisLogo(),
          Text('Irwin Arruda'),
        ],
      ),
    );
  }
}
