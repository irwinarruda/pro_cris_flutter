// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'package:pro_cris_flutter/styles/pro_cris_font_sizes.dart';

class BuilderFormMaskSizes {
  BuilderFormMaskSizes({
    required this.height,
    required this.fontSize,
    required this.labelFontSize,
    required this.errorFontSize,
  });
  final double height;
  final double fontSize;
  final double labelFontSize;
  final double errorFontSize;

  static BuilderFormMaskSizes sm = BuilderFormMaskSizes(
    height: 36,
    fontSize: ProCrisFontSizes.fontSm,
    labelFontSize: ProCrisFontSizes.fontSm,
    errorFontSize: ProCrisFontSizes.fontXs,
  );
  static BuilderFormMaskSizes md = BuilderFormMaskSizes(
    height: 40,
    fontSize: ProCrisFontSizes.fontMd,
    labelFontSize: ProCrisFontSizes.fontMd,
    errorFontSize: ProCrisFontSizes.fontXs,
  );
  static BuilderFormMaskSizes lg = BuilderFormMaskSizes(
    height: 45,
    fontSize: ProCrisFontSizes.fontMd,
    labelFontSize: ProCrisFontSizes.fontLg,
    errorFontSize: ProCrisFontSizes.fontXs,
  );
}

class BuilderFormMask extends StatelessWidget {
  BuilderFormMask({
    super.key,
    this.label,
    this.controller,
    this.focusNode,
    this.errorText,
    this.onChanged,
    this.validator,
    this.placeholder,
    required this.mask,
    required this.name,
    BuilderFormMaskSizes? size,
  }) {
    this.size = size ?? BuilderFormMaskSizes.md;
  }
  String name;
  String mask;
  String? label;
  String? placeholder;
  String? errorText;
  BuilderFormMaskSizes? size;
  TextEditingController? controller;
  FocusNode? focusNode;
  void Function(String)? onChanged;
  String? Function(String?)? validator;

  factory BuilderFormMask.sizeSm({
    Key? key,
    String? label,
    String? placeholder,
    String? errorText,
    TextEditingController? controller,
    FocusNode? focusNode,
    void Function(String)? onChanged,
    String? Function(String?)? validator,
    required String name,
    required String mask,
  }) {
    return BuilderFormMask(
      key: key,
      name: name,
      label: label,
      placeholder: placeholder,
      errorText: errorText,
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      validator: validator,
      mask: mask,
      size: BuilderFormMaskSizes.sm,
    );
  }

  factory BuilderFormMask.sizeMd({
    Key? key,
    String? label,
    String? placeholder,
    String? errorText,
    TextEditingController? controller,
    FocusNode? focusNode,
    void Function(String)? onChanged,
    String? Function(String?)? validator,
    required String name,
    required String mask,
  }) {
    return BuilderFormMask(
      key: key,
      name: name,
      label: label,
      placeholder: placeholder,
      errorText: errorText,
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      validator: validator,
      mask: mask,
      size: BuilderFormMaskSizes.md,
    );
  }

  factory BuilderFormMask.sizeLg({
    Key? key,
    String? label,
    String? placeholder,
    String? errorText,
    TextEditingController? controller,
    FocusNode? focusNode,
    void Function(String)? onChanged,
    String? Function(String?)? validator,
    required String name,
    required String mask,
  }) {
    return BuilderFormMask(
      key: key,
      name: name,
      label: label,
      placeholder: placeholder,
      errorText: errorText,
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      validator: validator,
      mask: mask,
      size: BuilderFormMaskSizes.lg,
    );
  }

  Widget _buildBuilderFormMask() {
    return FormBuilderTextField(
      name: name,
      focusNode: focusNode,
      controller: controller,
      validator: validator,
      textAlignVertical: TextAlignVertical.bottom,
      inputFormatters: [
        MaskTextInputFormatter(
          mask: mask,
          filter: {"#": RegExp(r'[0-9]')},
          type: MaskAutoCompletionType.lazy,
        )
      ],
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
          _buildBuilderFormMask(),
        ],
      );
    }
    return _buildBuilderFormMask();
  }
}
