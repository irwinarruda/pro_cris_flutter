import 'package:flutter/material.dart';
import 'package:pro_cris_flutter/components/atoms/pro_cris_logo.dart';
import 'package:pro_cris_flutter/styles/pro_cris_colors.dart';

class ProCrisSplash extends StatelessWidget {
  const ProCrisSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          color: ProCrisColors.purple,
          height: double.infinity,
          alignment: Alignment.center,
          child: ProCrisLogo(
            width: 250,
          ),
        ),
        Positioned(
          bottom: 20,
          child: Center(
            child: Text(
              'Irwin Arruda',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Yellowtail',
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
