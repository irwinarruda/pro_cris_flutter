// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:pro_cris_flutter/styles/pro_cris_colors.dart';

class ManageCard extends StatelessWidget {
  ManageCard({
    super.key,
    this.title,
    this.description,
    required this.onDeletePressed,
  }) {
    title = title ?? '';
    description = description ?? '';
  }

  String? title;
  String? description;
  void Function() onDeletePressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: ProCrisColors.white,
        boxShadow: [BoxShadow(blurRadius: 1, color: ProCrisColors.gray[300]!)],
        borderRadius: BorderRadius.all(Radius.circular(5)),
        border: Border.all(width: 1, color: ProCrisColors.gray[300]!),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$title',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  '$description',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Container(
            width: 2,
            height: 30,
            color: ProCrisColors.gray[300]!,
            margin: EdgeInsets.only(right: 14),
          ),
          Material(
            color: ProCrisColors.red,
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: ProCrisColors.gold, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(1000)),
            ),
            child: SizedBox(
              width: 35,
              height: 35,
              child: IconButton(
                icon: Icon(Icons.delete_outlined, size: 18),
                color: ProCrisColors.white,
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
