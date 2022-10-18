// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:antdesign_icons/antdesign_icons.dart';

import 'package:pro_cris_flutter/styles/pro_cris_colors.dart';
import 'package:pro_cris_flutter/styles/pro_cris_font_sizes.dart';

class AppointmentStatus {
  AppointmentStatus({
    required this.icon,
    required this.title,
  });
  IconData icon;
  String title;

  static AppointmentStatus ongoing = AppointmentStatus(
    icon: AntIcons.minusCircleFilled,
    title: 'Andamento',
  );
  static AppointmentStatus finished = AppointmentStatus(
    icon: AntIcons.checkCircleFilled,
    title: 'Finalizada',
  );
  static AppointmentStatus undone = AppointmentStatus(
    icon: AntIcons.closeSquareFilled,
    title: 'Restantes',
  );

  static AppointmentStatus getDateStatus({
    required DateTime dateStart,
    required DateTime dateEnd,
    required DateTime dateToCompare,
  }) {
    if (dateToCompare.isAfter(dateStart) && dateToCompare.isBefore(dateEnd)) {
      return ongoing;
    } else if (dateToCompare.isAfter(dateStart)) {
      return finished;
    } else {
      return undone;
    }
  }
}

class AppointmentCard extends StatelessWidget {
  AppointmentCard({
    super.key,
    String? mainText,
    String? secondaryText,
    Color? color,
    this.onPressed,
    this.onConfigPressed,
  }) {
    this.mainText = mainText ?? '';
    this.secondaryText = secondaryText ?? '';
    this.color = color ?? ProCrisColors.white;
  }

  String? mainText;
  String? secondaryText;
  Color? color;
  void Function()? onPressed;
  void Function()? onConfigPressed;

  @override
  Widget build(BuildContext context) {
    final appointmentStatus = AppointmentStatus.getDateStatus(
      dateStart: DateTime.now(),
      dateEnd: DateTime.now(),
      dateToCompare: DateTime.now(),
    );
    return Row(
      children: [
        Expanded(
          flex: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '10:30',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: ProCrisFontSizes.fontMd,
                ),
              ),
              Container(
                width: 6,
                height: 1,
                decoration: BoxDecoration(
                  color: ProCrisColors.black,
                  borderRadius: BorderRadius.all(Radius.circular(1000)),
                ),
              ),
              Text(
                '11:30',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: ProCrisFontSizes.fontXs,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 18),
        Expanded(
          child: Ink(
            decoration: BoxDecoration(
              color: color ?? ProCrisColors.white,
              boxShadow: [
                BoxShadow(blurRadius: 1, color: ProCrisColors.gray[300]!)
              ],
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
                  top: 10,
                  right: 8,
                  bottom: 10,
                  left: 14,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 0,
                      child: Container(
                        width: 35,
                        height: 35,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image(
                          image: true
                              ? AssetImage('assets/icons/emoji-placeholder.png')
                                  as dynamic
                              : NetworkImage(
                                  'https://firebasestorage.googleapis.com/v0/b/pro-cris-app.appspot.com/o/a6f1c6c8-0c9d-4ad0-8a88-74878e236f4c?alt=media&token=74144085-7a23-495b-b8ac-78cfa84caf9a',
                                ) as dynamic,
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
                          Text(
                            'Manchinha Arruda',
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: ProCrisFontSizes.fontSm,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Cristiani Arruda',
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: ProCrisFontSizes.fontSm,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Icon(
                          appointmentStatus.icon,
                          size: 22,
                        ),
                        Text(
                          appointmentStatus.title,
                          style: TextStyle(
                            fontSize: ProCrisFontSizes.font2xs,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
