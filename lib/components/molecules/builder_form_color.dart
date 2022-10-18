// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:pro_cris_flutter/components/atoms/colors_field.dart';

class BuilderFormColor extends StatelessWidget {
  BuilderFormColor({
    super.key,
    required this.name,
    this.label,
    this.onChanged,
    this.value,
    ColorsFieldSizes? size,
  }) {
    this.size = size ?? ColorsFieldSizes.md;
  }

  String name;
  ColorsFieldSizes? size;
  String? label;
  String? value;
  void Function(String key)? onChanged;

  factory BuilderFormColor.sizeSm({
    Key? key,
    required String name,
    void Function(String key)? onChanged,
    String? label,
    String? value,
  }) {
    return BuilderFormColor(
      key: key,
      name: name,
      label: label,
      onChanged: onChanged,
      value: value,
      size: ColorsFieldSizes.sm,
    );
  }

  factory BuilderFormColor.sizeMd({
    Key? key,
    required String name,
    void Function(String key)? onChanged,
    String? label,
    String? value,
  }) {
    return BuilderFormColor(
      key: key,
      name: name,
      label: label,
      onChanged: onChanged,
      value: value,
      size: ColorsFieldSizes.md,
    );
  }

  factory BuilderFormColor.sizeLg({
    Key? key,
    required String name,
    void Function(String key)? onChanged,
    String? label,
    String? value,
  }) {
    return BuilderFormColor(
      key: key,
      name: name,
      label: label,
      onChanged: onChanged,
      value: value,
      size: ColorsFieldSizes.lg,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
      name: name,
      builder: (FormFieldState<dynamic> field) => ColorsField(
        value: field.value,
        onChanged: (String value) {
          field.didChange(value);
        },
        label: label,
        size: size,
      ),
    );
  }
}
