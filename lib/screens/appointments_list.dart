// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:pro_cris_flutter/components/atoms/button.dart';
import 'package:pro_cris_flutter/components/atoms/expandable_fab.dart';

import 'package:pro_cris_flutter/components/molecules/appointment_card.dart';
import 'package:pro_cris_flutter/components/molecules/date_picker.dart';
import 'package:pro_cris_flutter/components/templates/pro_cris_modal.dart';

import 'package:pro_cris_flutter/styles/pro_cris_colors.dart';
import 'package:pro_cris_flutter/styles/pro_cris_font_sizes.dart';

class AppointmentsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: ProCrisColors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hoje: 13/10/2022',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: ProCrisFontSizes.fontLg,
                    ),
                  ),
                  SizedBox(width: 10),
                  DatePicker(
                    onDateChanged: (DateTime? date) {
                      print(date);
                    },
                  ),
                ],
              ),
              SizedBox(height: 2),
              Expanded(
                child: Material(
                  child: RefreshIndicator(
                    color: ProCrisColors.gold,
                    onRefresh: () async {},
                    child: ListView(
                      padding: EdgeInsets.only(top: 10, left: 16, right: 16),
                      scrollDirection: Axis.vertical,
                      children: [
                        AppointmentCard(
                          color: ProCrisColors.custom['green'],
                          onPressed: () {},
                          onConfigPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/students_management',
                            );
                          },
                        ),
                        SizedBox(height: 10),
                        AppointmentCard(
                          color: ProCrisColors.custom['red'],
                          onPressed: () {},
                          onConfigPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/students_management',
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        ExpandableFab(
          distance: 50,
          children: [
            ActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => ModalCreateAppointment(),
                );
              },
              color: ProCrisColors.red[900]!,
              child: Text(
                'Criar Aula',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: ProCrisFontSizes.fontMd,
                ),
              ),
            ),
            ActionButton(
              onPressed: () {},
              color: ProCrisColors.green[900]!,
              child: Text(
                'Iniciar Rotina',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: ProCrisFontSizes.fontMd,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class ModalCreateAppointment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProCrisModal(
      children: [
        ProCrisModalHeader(
          title: 'Adicionar Aula',
        ),
        ProCrisModalBody(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [],
          ),
        ),
        ProCrisModalFooter(
          children: [
            Button.sizeSm(
              title: 'Fechar',
              alignment: Alignment.centerRight,
              color: ProCrisColors.gray[500]!,
              height: 10,
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        )
      ],
    );
  }
}
