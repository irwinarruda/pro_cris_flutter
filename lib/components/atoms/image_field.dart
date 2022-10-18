// ignore_for_file: must_be_immutable

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:pro_cris_flutter/utils/is_network_image.dart';
import 'package:pro_cris_flutter/styles/pro_cris_colors.dart';
import 'package:pro_cris_flutter/styles/pro_cris_font_sizes.dart';

class ImageField extends StatelessWidget {
  ImageField({
    super.key,
    this.value,
    this.label,
    this.size = 100,
    this.onPressed,
  });

  double? size;
  String? label;
  String? value;
  void Function(String)? onPressed;

  Future<void> getFile() async {
    ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      if (onPressed != null) {
        onPressed!(image.path);
      }
    }
  }

  Widget _buildImageField() {
    return Container(
      width: size,
      height: size,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1000),
      ),
      child: Ink(
        decoration: BoxDecoration(
          color: ProCrisColors.white,
          borderRadius: BorderRadius.circular(1000),
          border: Border.all(
            color: ProCrisColors.gray[400]!,
            width: 1,
          ),
          image: value != null && value!.isNotEmpty
              ? DecorationImage(
                  fit: BoxFit.cover,
                  image: IsNetworkImage.execute(value!)
                      ? NetworkImage(value!) as dynamic
                      : FileImage(File(value!)) as dynamic,
                )
              : null,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(1000),
          onTap: () => getFile(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (label == null) {
      return _buildImageField();
    }
    return Column(
      children: [
        _buildImageField(),
        Text(
          label!,
          style: TextStyle(fontSize: ProCrisFontSizes.fontSm),
        ),
      ],
    );
  }
}
