// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:pro_cris_flutter/styles/pro_cris_colors.dart';
import 'package:pro_cris_flutter/styles/pro_cris_font_sizes.dart';

class PopupMenuWidget<T> extends PopupMenuEntry<T> {
  PopupMenuWidget({
    Key? key,
    required this.height,
    required this.child,
    this.padding,
  }) : super(key: key);
  Widget child;

  EdgeInsetsGeometry? padding = EdgeInsets.zero;

  @override
  double height;

  @override
  State createState() => _PopupMenuWidgetState();

  @override
  bool represents(T? value) => false;
}

class _PopupMenuWidgetState extends State<PopupMenuWidget> {
  @override
  Widget build(BuildContext context) => Container(
        padding: widget.padding,
        height: widget.height,
        child: widget.child,
      );
}

class ColorsFieldSizes {
  ColorsFieldSizes({required this.fontSize});
  double fontSize;

  static ColorsFieldSizes sm = ColorsFieldSizes(
    fontSize: ProCrisFontSizes.fontSm,
  );
  static ColorsFieldSizes md = ColorsFieldSizes(
    fontSize: ProCrisFontSizes.fontMd,
  );
  static ColorsFieldSizes lg = ColorsFieldSizes(
    fontSize: ProCrisFontSizes.fontMd,
  );
}

class ColorsField extends StatelessWidget {
  ColorsField({
    super.key,
    this.label,
    this.onChanged,
    this.value,
    ColorsFieldSizes? size,
  }) {
    this.size = size ?? ColorsFieldSizes.md;
  }

  ColorsFieldSizes? size;
  String? label;
  String? value;
  void Function(String key)? onChanged;

  Widget _buildColorPopup() {
    return Material(
      color: ProCrisColors.custom[value],
      borderRadius: BorderRadius.circular(1000),
      child: PopupMenuButton(
        initialValue: 'colors_field',
        splashRadius: 0,
        padding: EdgeInsets.all(0),
        tooltip: 'Abrir menu de cores',
        position: PopupMenuPosition.over,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3),
          side: BorderSide(color: ProCrisColors.gold, width: 2),
        ),
        child: Container(
          width: 30,
          height: 30,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1000),
          ),
        ),
        itemBuilder: (BuildContext context) {
          return [
            PopupMenuWidget(
              height: 44,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (var color in ProCrisColors.custom.entries) ...[
                      SizedBox(
                        width: 3,
                      ),
                      Ink(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1000),
                          color: ProCrisColors.custom[color.key],
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(1000),
                          onTap: () {
                            Navigator.pop(context, 'colors_field');
                            onChanged!(color.key);
                          },
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                    ],
                  ],
                ),
              ),
            )
          ];
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Escolher cor:',
          style: TextStyle(
            fontSize: size!.fontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: 6),
        _buildColorPopup()
      ],
    );
  }
}
