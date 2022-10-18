// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:pro_cris_flutter/styles/pro_cris_colors.dart';
import 'package:pro_cris_flutter/styles/pro_cris_font_sizes.dart';

class BuilderFormPasswordSizes {
  BuilderFormPasswordSizes({
    required this.height,
    required this.fontSize,
    required this.labelFontSize,
    required this.errorFontSize,
  });
  final double height;
  final double fontSize;
  final double labelFontSize;
  final double errorFontSize;

  static BuilderFormPasswordSizes sm = BuilderFormPasswordSizes(
    height: 36,
    fontSize: ProCrisFontSizes.fontSm,
    labelFontSize: ProCrisFontSizes.fontSm,
    errorFontSize: ProCrisFontSizes.fontXs,
  );
  static BuilderFormPasswordSizes md = BuilderFormPasswordSizes(
    height: 40,
    fontSize: ProCrisFontSizes.fontMd,
    labelFontSize: ProCrisFontSizes.fontMd,
    errorFontSize: ProCrisFontSizes.fontXs,
  );
  static BuilderFormPasswordSizes lg = BuilderFormPasswordSizes(
    height: 45,
    fontSize: ProCrisFontSizes.fontMd,
    labelFontSize: ProCrisFontSizes.fontLg,
    errorFontSize: ProCrisFontSizes.fontXs,
  );
}

class BuilderFormPassword extends StatefulWidget {
  BuilderFormPassword({
    super.key,
    this.label,
    this.controller,
    this.focusNode,
    this.errorText,
    this.onChanged,
    this.validator,
    this.placeholder,
    required this.name,
    BuilderFormPasswordSizes? size,
  }) {
    this.size = size ?? BuilderFormPasswordSizes.md;
  }
  String name;
  String? label;
  String? placeholder;
  String? errorText;
  BuilderFormPasswordSizes? size;
  TextEditingController? controller;
  FocusNode? focusNode;
  void Function(String)? onChanged;
  String? Function(String?)? validator;

  factory BuilderFormPassword.sizeSm({
    Key? key,
    String? label,
    TextEditingController? controller,
    FocusNode? focusNode,
    String? errorText,
    void Function(String)? onChanged,
    String? Function(String?)? validator,
    String? placeholder,
    required String name,
  }) {
    return BuilderFormPassword(
      key: key,
      label: label,
      controller: controller,
      focusNode: focusNode,
      errorText: errorText,
      onChanged: onChanged,
      validator: validator,
      placeholder: placeholder,
      name: name,
      size: BuilderFormPasswordSizes.sm,
    );
  }

  factory BuilderFormPassword.sizeMd({
    Key? key,
    String? label,
    TextEditingController? controller,
    FocusNode? focusNode,
    String? errorText,
    void Function(String)? onChanged,
    String? Function(String?)? validator,
    String? placeholder,
    required String name,
  }) {
    return BuilderFormPassword(
      key: key,
      label: label,
      controller: controller,
      focusNode: focusNode,
      errorText: errorText,
      onChanged: onChanged,
      validator: validator,
      placeholder: placeholder,
      name: name,
      size: BuilderFormPasswordSizes.md,
    );
  }

  factory BuilderFormPassword.sizeLg({
    Key? key,
    String? label,
    TextEditingController? controller,
    FocusNode? focusNode,
    String? errorText,
    void Function(String)? onChanged,
    String? Function(String?)? validator,
    String? placeholder,
    required String name,
  }) {
    return BuilderFormPassword(
      key: key,
      label: label,
      controller: controller,
      focusNode: focusNode,
      errorText: errorText,
      onChanged: onChanged,
      validator: validator,
      placeholder: placeholder,
      name: name,
      size: BuilderFormPasswordSizes.lg,
    );
  }

  @override
  State createState() => _BuilderFormPasswordState();
}

class _BuilderFormPasswordState extends State<BuilderFormPassword> {
  bool obscureText = true;
  Widget _buildBuilderFormPassword() {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        FormBuilderTextField(
          name: widget.name,
          focusNode: widget.focusNode,
          controller: widget.controller,
          validator: widget.validator,
          obscureText: obscureText,
          textAlignVertical: TextAlignVertical.bottom,
          style: TextStyle(
            fontSize: widget.size!.fontSize,
            height: 1,
          ),
          decoration: InputDecoration(
            hintText: widget.placeholder,
            errorText: widget.errorText,
            errorStyle:
                TextStyle(height: 0.6, fontSize: widget.size!.errorFontSize),
            contentPadding: EdgeInsets.symmetric(
              vertical: (widget.size!.height - widget.size!.fontSize) / 2,
              horizontal: 16,
            ),
          ),
        ),
        Positioned(
          child: IconButton(
            icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
            splashRadius: 20,
            iconSize: 20,
            color: ProCrisColors.gray,
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.label != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label!,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: widget.size!.labelFontSize,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 2),
          _buildBuilderFormPassword(),
        ],
      );
    }
    return _buildBuilderFormPassword();
  }
}
