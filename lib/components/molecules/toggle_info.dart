// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:pro_cris_flutter/styles/pro_cris_colors.dart';
import 'package:pro_cris_flutter/styles/pro_cris_font_sizes.dart';

class ToggleInfoItem extends StatefulWidget {
  ToggleInfoItem({super.key, this.title, this.value}) {
    title = title ?? '';
    value = value ?? '';
  }

  String? title;
  String? value;

  @override
  State createState() => _ToggleInfoItemState();
}

class _ToggleInfoItemState extends State<ToggleInfoItem> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isVisible = !isVisible;
        });
      },
      child: !isVisible
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  transform: Matrix4.translationValues(5, 0, 0),
                  child: Text(
                    widget.title!,
                    style: TextStyle(fontSize: ProCrisFontSizes.fontSm),
                  ),
                ),
                Container(
                  transform: Matrix4.translationValues(-1, 0, 0),
                  child: SizedBox(
                    width: 32,
                    child: Icon(
                      Icons.arrow_drop_down,
                      size: 32,
                    ),
                  ),
                ),
              ],
            )
          : Container(alignment: Alignment.center, child: Text(widget.value!)),
    );
  }
}

class ProCrisToggleInfo extends StatelessWidget {
  ProCrisToggleInfo({super.key, required this.statusItems});

  List<ToggleInfoItem> statusItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ProCrisColors.purple[100]!,
            width: 2,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 0,
            child: VerticalDivider(
              width: 1,
              thickness: 1,
              color: ProCrisColors.purple[100],
            ),
          ),
          for (var index = 0; index < statusItems.length; index++) ...[
            Expanded(
              flex: 0,
              child: VerticalDivider(
                width: 1,
                thickness: 1,
                color: ProCrisColors.purple[100],
              ),
            ),
            Expanded(flex: 1, child: statusItems[index]),
            Expanded(
              flex: 0,
              child: VerticalDivider(
                width: 1,
                thickness: 1,
                color: ProCrisColors.purple[100],
              ),
            ),
          ],
          Expanded(
            flex: 0,
            child: VerticalDivider(
              width: 1,
              thickness: 1,
              color: ProCrisColors.purple[100],
            ),
          ),
        ],
      ),
    );
  }
}
