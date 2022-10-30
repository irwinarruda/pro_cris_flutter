// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'package:pro_cris_flutter/components/atoms/button.dart';
import 'package:pro_cris_flutter/components/atoms/dismiss_keyboard.dart';
import 'package:pro_cris_flutter/components/molecules/builder_form_image.dart';
import 'package:pro_cris_flutter/components/molecules/builder_form_text.dart';
import 'package:pro_cris_flutter/components/molecules/builder_form_color.dart';
import 'package:pro_cris_flutter/components/molecules/builder_form_mask.dart';
import 'package:pro_cris_flutter/components/molecules/manage_card.dart';
import 'package:pro_cris_flutter/components/templates/pro_cris_header_scaffold.dart';
import 'package:pro_cris_flutter/providers/pro_cris_provider.dart';

import 'package:pro_cris_flutter/styles/pro_cris_colors.dart';
import 'package:pro_cris_flutter/styles/pro_cris_font_sizes.dart';

class StudentsManagement extends StatefulWidget {
  @override
  State<StudentsManagement> createState() => _StudentsManagementState();
}

class _StudentsManagementState extends State<StudentsManagement> {
  GlobalKey<FormBuilderState> globalKey = GlobalKey<FormBuilderState>();

  final initialValue = {
    'name': '',
    'avatar': '',
    'date_of_birth': '',
    'phone': '',
    'address': '',
    'name_caregiver': '',
    'map_location': '',
    'observation': '',
    'color': ProCrisColors.custom['black'],
  };

  void onGoBack() {
    final studentController = ProCrisProvider.useStudent(context);
    studentController.resetStudentId();
  }

  Future<void> onManageStudent() async {
    final studentController = ProCrisProvider.useStudent(context);
    try {
      context.loaderOverlay.show();
      await studentController.getManageStudent();
      globalKey.currentState!.patchValue({
        'name': studentController.student!.name,
        'avatar': studentController.student!.avatar ?? '',
        'date_of_birth': studentController.student!.dateOfBirth,
        'phone': studentController.student!.phone,
        'address': studentController.student!.address,
        'name_caregiver': studentController.student!.nameCaregiver,
        'map_location': studentController.student!.mapLocation,
        'observation': studentController.student!.observation,
        'color': ProCrisColors.fromHex(studentController.student!.color),
      });
    } finally {
      context.loaderOverlay.hide();
    }
  }

  @override
  void initState() {
    super.initState();
    final studentController = ProCrisProvider.useStudent(context);
    if (studentController.studentId != null) {
      onManageStudent();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ProCrisHeaderScaffold(
      title: 'Criar Aluno',
      onPressed: onGoBack,
      body: FormBuilder(
        key: globalKey,
        initialValue: initialValue,
        child: Container(
          padding: EdgeInsets.only(
            top: 22,
            right: 16,
            bottom: 0,
            left: 16,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: BuilderFormImage(
                        label: 'Adicionar Imagem',
                        name: 'avatar',
                        size: 96,
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          BuilderFormText.sizeSm(
                            label: 'Nome Completo',
                            placeholder: 'Nome do Aluno',
                            name: 'name',
                          ),
                          SizedBox(height: 10),
                          BuilderFormMask.sizeSm(
                            label: 'Data de Nascimento',
                            placeholder: 'dd/mm/aaaa',
                            mask: '##/##/####',
                            name: 'date_of_birth',
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: BuilderFormText.sizeSm(
                        label: 'Nome do Responsável',
                        placeholder: 'Responsável',
                        name: 'name_caregiver',
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: BuilderFormMask.sizeSm(
                        label: 'Telefone',
                        placeholder: '(00) 00000-0000',
                        mask: '(##) #####-####',
                        name: 'phone',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                BuilderFormText.sizeSm(
                  label: 'Endereço',
                  placeholder: 'Av, logradouro, etc...',
                  name: 'address',
                ),
                SizedBox(height: 10),
                BuilderFormText.sizeSm(
                  label: 'Google Maps Link',
                  placeholder: 'Link da Localização',
                  name: 'map_location',
                ),
                SizedBox(height: 10),
                BuilderFormText.sizeSm(
                  label: 'Observação Adicional',
                  placeholder: 'Apartamento, número da casa, etc...',
                  name: 'observation',
                ),
                SizedBox(height: 12),
                BuilderFormColor.sizeSm(
                  label: 'Imagem Adicionada',
                  name: 'color',
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Button.sizeSm(
                        title: 'Gerenciar Preços',
                        color: ProCrisColors.gray[400],
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            isScrollControlled: true,
                            builder: (context) => ModalManageCosts(),
                          );
                        },
                      ),
                    ),
                    SizedBox(width: 30),
                    Expanded(
                      child: Button.sizeSm(
                        title: 'Gerenciar Horários',
                        color: ProCrisColors.gray[400],
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            isScrollControlled: true,
                            builder: (context) => ModalManageSchedules(),
                          );
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Button.sizeLg(
                  title: 'Salvar Aluno',
                  alignment: Alignment.center,
                  onPressed: () {
                    globalKey.currentState!.save();
                    print(globalKey.currentState!.value);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ModalManageCosts extends StatelessWidget {
  GlobalKey<FormBuilderState> globalKey = GlobalKey<FormBuilderState>();

  final initialValue = {
    'time': '',
    'price': '',
  };

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.85;
    return DismissKeyboard(
      child: FormBuilder(
        key: globalKey,
        initialValue: initialValue,
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
              SizedBox(height: 24),
              Text(
                'Gerenciar Valores',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: ProCrisFontSizes.fontLg,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: BuilderFormMask.sizeSm(
                      label: 'Hora aula',
                      placeholder: '01:00',
                      mask: '##:##',
                      name: 'time',
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: BuilderFormText.sizeSm(
                      label: 'Preço',
                      placeholder: 'R\$0.00',
                      name: 'time',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Button.sizeSm(
                title: 'Adicionar',
                onPressed: () {},
              ),
              SizedBox(height: 3),
              Divider(thickness: 2, color: ProCrisColors.gold),
              SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ManageCard(
                        mainText: 'Hora Aula: 01:00',
                        secondaryText: 'Preço: R\$2.00',
                        onDeletePressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class ModalManageSchedules extends StatelessWidget {
  GlobalKey<FormBuilderState> globalKey = GlobalKey<FormBuilderState>();

  final initialValue = {
    'week_day': '',
    'day_time': '',
  };

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.85;
    return DismissKeyboard(
      child: FormBuilder(
        key: globalKey,
        initialValue: initialValue,
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
              SizedBox(height: 24),
              Text(
                'Gerenciar Horários',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: ProCrisFontSizes.fontLg,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: BuilderFormMask.sizeSm(
                      label: 'Dia da semana',
                      placeholder: '01:00',
                      mask: '##:##',
                      name: 'week_day',
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: BuilderFormText.sizeSm(
                      label: 'Hora do dia',
                      placeholder: 'R\$0.00',
                      name: 'day_time',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Button.sizeSm(
                title: 'Adicionar',
                onPressed: () {},
              ),
              SizedBox(height: 3),
              Divider(thickness: 2, color: ProCrisColors.gold),
              SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ManageCard(
                        mainText: 'Dia da semana: Terça',
                        secondaryText: 'Hora do dia: 08:00',
                        onDeletePressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
