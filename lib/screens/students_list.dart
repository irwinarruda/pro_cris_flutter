// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:pro_cris_flutter/components/atoms/button.dart';
import 'package:pro_cris_flutter/components/atoms/dismiss_keyboard.dart';
import 'package:pro_cris_flutter/components/atoms/link.dart';
import 'package:pro_cris_flutter/components/molecules/student_card.dart';
import 'package:pro_cris_flutter/components/molecules/toggle_info.dart';
import 'package:pro_cris_flutter/components/templates/pro_cris_modal.dart';

import 'package:pro_cris_flutter/styles/pro_cris_colors.dart';

class StudentsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: ProCrisColors.white,
          child: Column(
            children: [
              Material(
                child: ProCrisToggleInfo(
                  statusItems: [
                    ToggleInfoItem(
                      title: 'Quantidade de aulas',
                      value: '19 aulas',
                    ),
                    ToggleInfoItem(
                      title: 'Valor a receber',
                      value: 'R\$ 1.000,00',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),
              Expanded(
                child: Material(
                  child: RefreshIndicator(
                    color: ProCrisColors.gold,
                    onRefresh: () async {},
                    child: ListView(
                      padding: EdgeInsets.only(top: 10, left: 16, right: 16),
                      scrollDirection: Axis.vertical,
                      children: [
                        StudentCard(
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
                        StudentCard(
                          color: ProCrisColors.custom['red'],
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => ModalSummary(),
                            );
                          },
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
        Positioned(
          right: 20,
          bottom: 30,
          child: FloatingActionButton(
            child: Icon(
              Icons.add_rounded,
              size: 40,
              color: ProCrisColors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/students_management');
            },
          ),
        )
      ],
    );
  }
}

class ModalSummary extends StatelessWidget {
  const ModalSummary({super.key});

  Widget _buildModalSummaryCard({
    required String title,
    required void Function() onPressed,
  }) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: ProCrisColors.gray[400]!),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: ProCrisColors.gray,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ProCrisModal(
      children: [
        ProCrisModalHeader(
          title: 'Relatórios: Gabriel',
        ),
        ProCrisModalBody(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildModalSummaryCard(
                title: 'Aulas Não Pagas',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => ModalAppointmentsSummary(),
                  );
                },
              ),
              SizedBox(height: 10),
              _buildModalSummaryCard(
                title: 'Todas as Aulas',
                onPressed: () {},
              ),
            ],
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

class ModalAppointmentsSummary extends StatelessWidget {
  Widget _buildModalAppointmentsSummaryHeader() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              'Data',
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              'Valor',
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Extra',
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Ações',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModalAppointmentsSummaryCard({
    required String data,
    required String cost,
    required bool isExtra,
    required void Function() onPayPressed,
    required void Function() onPressed,
  }) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 4),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: ProCrisColors.gray[400]!),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                data,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: ProCrisColors.black,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                cost,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: ProCrisColors.black,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Icon(
                isExtra
                    ? Icons.check_box
                    : Icons.check_box_outline_blank_outlined,
                color: isExtra ? ProCrisColors.green[900]! : ProCrisColors.gray,
              ),
            ),
            Expanded(
              flex: 2,
              child: SizedBox(
                width: 25,
                height: 25,
                child: IconButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  splashRadius: 20,
                  icon: Icon(
                    Icons.credit_card,
                    color: ProCrisColors.green[900]!,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ProCrisModal(
      children: [
        ProCrisModalHeader(
          title: 'Aulas Não Pagas: Gabriel',
        ),
        ProCrisModalBody(
          paddingY: 8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildModalAppointmentsSummaryHeader(),
              _buildModalAppointmentsSummaryCard(
                data: '27/09/2022',
                cost: 'R\$ 100,00',
                isExtra: false,
                onPayPressed: () {},
                onPressed: () {},
              ),
              SizedBox(height: 10),
              _buildModalAppointmentsSummaryCard(
                data: '44/44/4444',
                cost: 'R\$ 44444,44',
                isExtra: true,
                onPayPressed: () {},
                onPressed: () {},
              ),
            ],
          ),
        ),
        ProCrisModalFooter(
          children: [
            Link.sizeSm(
              title: 'Ver recibo',
              alignment: Alignment.centerRight,
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  isScrollControlled: true,
                  builder: (context) => ModalBilling(),
                );
              },
            ),
            SizedBox(width: 16),
            Button.sizeSm(
              title: 'Fechar',
              alignment: Alignment.centerRight,
              color: ProCrisColors.gray,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(width: 16),
            Button.sizeSm(
              title: 'Pagar Todas',
              alignment: Alignment.centerRight,
              color: ProCrisColors.green[900]!,
              onPressed: () {},
            ),
          ],
        )
      ],
    );
  }
}

class ModalBilling extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.5;
    return DismissKeyboard(
      child: Container(
        height: height,
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: ProCrisColors.white,
          border: Border.all(width: 2, color: ProCrisColors.gold),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 6,
                  alignment: Alignment.topRight,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: ProCrisColors.purple,
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Button.sizeSm(
              title: 'Adicionar',
              onPressed: () {},
            ),
            SizedBox(height: 3),
          ],
        ),
      ),
    );
  }
}
