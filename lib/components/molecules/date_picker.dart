// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:pro_cris_flutter/styles/pro_cris_colors.dart';

class DatePicker extends StatelessWidget {
  DatePicker({super.key, this.onDateChanged});

  void Function(DateTime?)? onDateChanged;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ProCrisColors.purple[300]!,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: ProCrisColors.gold, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(1000)),
      ),
      child: SizedBox(
        width: 32,
        height: 32,
        child: TextButton(
          child: Icon(
            Icons.filter_alt_outlined,
            size: 22,
            color: ProCrisColors.white,
          ),
          onPressed: () async {
            DateTime? newDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );
            if (onDateChanged != null) onDateChanged!(newDate);
          },
        ),
      ),
    );
  }
}
