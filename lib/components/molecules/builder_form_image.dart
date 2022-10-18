// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:pro_cris_flutter/components/atoms/image_field.dart';

class BuilderFormImage extends StatelessWidget {
  BuilderFormImage({
    super.key,
    required this.name,
    this.label,
    this.size = 100,
  });

  String name;
  double? size;
  String? label;

  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
      name: name,
      builder: (FormFieldState<String> field) => ImageField(
        label: label,
        size: size,
        value: field.value,
        onPressed: (String value) {
          field.didChange(value);
        },
      ),
    );
  }
}
