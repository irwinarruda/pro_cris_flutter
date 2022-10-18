// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:pro_cris_flutter/styles/pro_cris_font_sizes.dart';

class BuilderFormTextSizes {
  BuilderFormTextSizes({
    required this.height,
    required this.fontSize,
    required this.labelFontSize,
    required this.errorFontSize,
  });
  final double height;
  final double fontSize;
  final double labelFontSize;
  final double errorFontSize;

  static BuilderFormTextSizes sm = BuilderFormTextSizes(
    height: 36,
    fontSize: ProCrisFontSizes.fontSm,
    labelFontSize: ProCrisFontSizes.fontSm,
    errorFontSize: ProCrisFontSizes.fontXs,
  );
  static BuilderFormTextSizes md = BuilderFormTextSizes(
    height: 40,
    fontSize: ProCrisFontSizes.fontMd,
    labelFontSize: ProCrisFontSizes.fontMd,
    errorFontSize: ProCrisFontSizes.fontXs,
  );
  static BuilderFormTextSizes lg = BuilderFormTextSizes(
    height: 45,
    fontSize: ProCrisFontSizes.fontMd,
    labelFontSize: ProCrisFontSizes.fontLg,
    errorFontSize: ProCrisFontSizes.fontXs,
  );
}

class BuilderFormText extends StatelessWidget {
  BuilderFormText({
    super.key,
    this.label,
    this.controller,
    this.focusNode,
    this.errorText,
    this.onChanged,
    this.validator,
    this.placeholder,
    required this.name,
    BuilderFormTextSizes? size,
  }) {
    this.size = size ?? BuilderFormTextSizes.md;
  }
  String name;
  String? label;
  String? placeholder;
  String? errorText;
  BuilderFormTextSizes? size;
  TextEditingController? controller;
  FocusNode? focusNode;
  void Function(String)? onChanged;
  String? Function(String?)? validator;

  factory BuilderFormText.sizeSm({
    Key? key,
    String? label,
    String? placeholder,
    String? errorText,
    TextEditingController? controller,
    FocusNode? focusNode,
    void Function(String)? onChanged,
    String? Function(String?)? validator,
    required String name,
  }) {
    return BuilderFormText(
      key: key,
      name: name,
      label: label,
      placeholder: placeholder,
      errorText: errorText,
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      validator: validator,
      size: BuilderFormTextSizes.sm,
    );
  }

  factory BuilderFormText.sizeMd({
    Key? key,
    String? label,
    String? placeholder,
    String? errorText,
    TextEditingController? controller,
    FocusNode? focusNode,
    void Function(String)? onChanged,
    String? Function(String?)? validator,
    required String name,
  }) {
    return BuilderFormText(
      key: key,
      name: name,
      label: label,
      placeholder: placeholder,
      errorText: errorText,
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      validator: validator,
      size: BuilderFormTextSizes.md,
    );
  }

  factory BuilderFormText.sizeLg({
    Key? key,
    String? label,
    String? placeholder,
    String? errorText,
    TextEditingController? controller,
    FocusNode? focusNode,
    void Function(String)? onChanged,
    String? Function(String?)? validator,
    required String name,
  }) {
    return BuilderFormText(
      key: key,
      name: name,
      label: label,
      placeholder: placeholder,
      errorText: errorText,
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      validator: validator,
      size: BuilderFormTextSizes.lg,
    );
  }

  Widget _buildBuilderFormText() {
    return FormBuilderTextField(
      name: name,
      focusNode: focusNode,
      controller: controller,
      validator: validator,
      textAlignVertical: TextAlignVertical.bottom,
      style: TextStyle(
        fontSize: size!.fontSize,
        height: 1,
      ),
      decoration: InputDecoration(
        hintText: placeholder,
        errorText: errorText,
        errorStyle: TextStyle(height: 0.6, fontSize: size!.errorFontSize),
        contentPadding: EdgeInsets.symmetric(
          vertical: (size!.height - size!.fontSize) / 2,
          horizontal: 16,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (label != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label!,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: size!.labelFontSize,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 2),
          _buildBuilderFormText(),
        ],
      );
    }
    return _buildBuilderFormText();
  }
}
