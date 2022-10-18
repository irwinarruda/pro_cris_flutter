// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:pro_cris_flutter/components/atoms/dismiss_keyboard.dart';
import 'package:pro_cris_flutter/styles/pro_cris_font_sizes.dart';

class ProCrisHeaderScaffold extends StatelessWidget {
  ProCrisHeaderScaffold({
    super.key,
    required this.title,
    this.body,
    this.onPressed,
  });

  Widget? body;
  String title;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            style: TextStyle(
              fontSize: ProCrisFontSizes.fontMd,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            splashRadius: 20,
            icon: Icon(Icons.keyboard_arrow_left_rounded, size: 30),
            onPressed: () {
              Navigator.pop(context);
              if (onPressed != null) {
                onPressed!();
              }
            },
          ),
        ),
        body: body,
      ),
    );
  }
}
