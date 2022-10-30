// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:pro_cris_flutter/styles/pro_cris_colors.dart';
import 'package:pro_cris_flutter/styles/pro_cris_font_sizes.dart';

class ProCrisModal extends StatelessWidget {
  ProCrisModal({super.key, this.children}) {
    this.children = children ?? [];
  }

  List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Material(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: ProCrisColors.gold, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        color: ProCrisColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children!,
        ),
      ),
    );
  }
}

class ProCrisModalHeader extends StatelessWidget {
  ProCrisModalHeader({
    super.key,
    required this.title,
    this.transparentBackground = false,
  });

  String title;
  bool transparentBackground;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color:
            transparentBackground ? Colors.transparent : ProCrisColors.purple,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        border: transparentBackground
            ? Border.all(color: ProCrisColors.gray[100]!, width: 1)
            : null,
      ),
      child: Text(
        title,
        style: TextStyle(
          color:
              transparentBackground ? ProCrisColors.black : ProCrisColors.white,
          fontSize: ProCrisFontSizes.fontLg,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class ProCrisModalBody extends StatelessWidget {
  ProCrisModalBody({super.key, this.child, this.paddingY}) {
    this.paddingY = paddingY ?? 16;
  }

  Widget? child;
  double? paddingY;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: paddingY!, horizontal: 16),
      child: child,
    );
  }
}

class ProCrisModalFooter extends StatelessWidget {
  ProCrisModalFooter({super.key, this.children}) {
    this.children = children ?? [];
  }

  List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 16),
      decoration: BoxDecoration(
        color: ProCrisColors.gray[50]!,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: children!),
    );
  }
}
