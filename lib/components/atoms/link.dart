// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:pro_cris_flutter/styles/pro_cris_font_sizes.dart';

class LinkSizes {
  LinkSizes({required this.height, required this.fontSize});
  double height;
  double fontSize;

  static LinkSizes sm =
      LinkSizes(height: 22, fontSize: ProCrisFontSizes.fontSm);
  static LinkSizes md =
      LinkSizes(height: 22, fontSize: ProCrisFontSizes.fontMd);
  static LinkSizes lg =
      LinkSizes(height: 28, fontSize: ProCrisFontSizes.fontLg);
}

class Link extends StatelessWidget {
  Link({
    super.key,
    required this.title,
    required this.onPressed,
    this.width,
    this.alignment,
    LinkSizes? size,
  }) {
    this.size = size ?? LinkSizes.md;
    this.alignment = alignment ?? Alignment.center;
  }

  AlignmentGeometry? alignment;
  LinkSizes? size;
  double? width;
  String title;
  void Function() onPressed;

  factory Link.sizeSm({
    required String title,
    required void Function() onPressed,
    double? width,
    AlignmentGeometry? alignment,
  }) {
    return Link(
      title: title,
      onPressed: onPressed,
      width: width,
      alignment: alignment,
      size: LinkSizes.sm,
    );
  }

  factory Link.sizeMd({
    required String title,
    required void Function() onPressed,
    double? width,
    AlignmentGeometry? alignment,
  }) {
    return Link(
      title: title,
      onPressed: onPressed,
      width: width,
      alignment: alignment,
      size: LinkSizes.md,
    );
  }

  factory Link.sizeLg({
    required String title,
    required void Function() onPressed,
    double? width,
    AlignmentGeometry? alignment,
  }) {
    return Link(
      title: title,
      onPressed: onPressed,
      width: width,
      alignment: alignment,
      size: LinkSizes.lg,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      width: width,
      height: size!.height,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          fixedSize: Size.fromHeight(size!.height),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
