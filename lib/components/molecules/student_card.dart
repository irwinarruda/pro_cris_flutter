// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:pro_cris_flutter/styles/pro_cris_colors.dart';
import 'package:pro_cris_flutter/styles/pro_cris_font_sizes.dart';

class StudentCard extends StatelessWidget {
  StudentCard({
    super.key,
    String? name,
    String? nameCaregiver,
    Color? color,
    this.avatar,
    this.onPressed,
    this.onConfigPressed,
  }) {
    this.name = name ?? '';
    this.nameCaregiver = nameCaregiver ?? '';
    this.color = color ?? ProCrisColors.white;
  }

  String? name;
  String? nameCaregiver;
  String? avatar;
  Color? color;
  void Function()? onPressed;
  void Function()? onConfigPressed;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: color ?? ProCrisColors.white,
        boxShadow: [BoxShadow(blurRadius: 1, color: ProCrisColors.gray[300]!)],
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        splashColor: ProCrisColors.black.withOpacity(0.2),
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.only(
            top: 4,
            right: 6,
            bottom: 4,
            left: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 0,
                child: Container(
                  width: 40,
                  height: 40,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image(
                    image: avatar == null
                        ? AssetImage('assets/icons/emoji-placeholder.png')
                            as dynamic
                        : NetworkImage(avatar!) as dynamic,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Aluno: ',
                          style: TextStyle(fontSize: ProCrisFontSizes.fontMd),
                        ),
                        Expanded(
                          child: Text(
                            name!,
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: ProCrisFontSizes.fontMd,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Responsável: ',
                          style: TextStyle(fontSize: ProCrisFontSizes.fontSm),
                        ),
                        Expanded(
                          child: Text(
                            nameCaregiver!,
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: ProCrisFontSizes.fontSm,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 50,
                height: 50,
                child: RotatedBox(
                  quarterTurns: 3,
                  child: IconButton(
                    icon: Icon(Icons.tune_rounded, size: 30),
                    splashRadius: 25,
                    onPressed: onConfigPressed,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
