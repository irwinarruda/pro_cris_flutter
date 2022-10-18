// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:pro_cris_flutter/styles/pro_cris_font_sizes.dart';

class ButtonSizes {
  ButtonSizes({required this.height, required this.fontSize});
  final double height;
  final double fontSize;

  static ButtonSizes sm =
      ButtonSizes(height: 34, fontSize: ProCrisFontSizes.fontXs);
  static ButtonSizes md =
      ButtonSizes(height: 40, fontSize: ProCrisFontSizes.fontSm);
  static ButtonSizes lg =
      ButtonSizes(height: 45, fontSize: ProCrisFontSizes.fontMd);
}

class Button extends StatelessWidget {
  Button({
    super.key,
    required this.title,
    required this.onPressed,
    this.width,
    this.height,
    this.alignment,
    this.color,
    ButtonSizes? size,
  }) {
    this.size = size ?? ButtonSizes.md;
  }

  AlignmentGeometry? alignment;
  ButtonSizes? size;
  String title;
  double? width;
  double? height;
  Color? color;
  void Function() onPressed;

  factory Button.sizeSm({
    Key? key,
    required String title,
    required void Function() onPressed,
    double? width,
    double? height,
    AlignmentGeometry? alignment,
    Color? color,
  }) {
    return Button(
      key: key,
      title: title,
      onPressed: onPressed,
      width: width,
      height: height,
      alignment: alignment,
      color: color,
      size: ButtonSizes.sm,
    );
  }

  factory Button.sizeMd({
    Key? key,
    required String title,
    required void Function() onPressed,
    double? width,
    double? height,
    AlignmentGeometry? alignment,
    Color? color,
  }) {
    return Button(
      key: key,
      title: title,
      onPressed: onPressed,
      width: width,
      height: height,
      alignment: alignment,
      color: color,
      size: ButtonSizes.md,
    );
  }

  factory Button.sizeLg({
    Key? key,
    required String title,
    required void Function() onPressed,
    double? width,
    double? height,
    AlignmentGeometry? alignment,
    Color? color,
  }) {
    return Button(
      key: key,
      title: title,
      onPressed: onPressed,
      width: width,
      height: height,
      alignment: alignment,
      color: color,
      size: ButtonSizes.lg,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      width: width,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          fixedSize: Size.fromHeight(height ?? size!.height),
          backgroundColor: color,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: size!.fontSize,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
