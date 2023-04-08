import 'package:flutter/material.dart';

import 'package:pro_cris_flutter/components/atoms/appointments_icon.dart';
import 'package:pro_cris_flutter/components/atoms/students_icon.dart';
import 'package:pro_cris_flutter/components/templates/pro_cris_tabs_scaffold.dart';
import 'package:pro_cris_flutter/router/pro_cris_router.dart';

import 'package:pro_cris_flutter/screens/appointments_list.dart';
import 'package:pro_cris_flutter/screens/students_list.dart';

import 'package:pro_cris_flutter/stores/auth_controller.dart';

class AppointmentsStudentsList extends StatefulWidget {
  @override
  State<AppointmentsStudentsList> createState() =>
      _AppointmentsStudentsListState();
}

class _AppointmentsStudentsListState extends State<AppointmentsStudentsList> {
  final _authController = AuthController();

  Future<void> onSignOut() async {
    final navigator = Navigator.of(context);
    await _authController.signOut();
    navigator.pushNamedAndRemoveUntil(
      ProCrisRouteNames.signIn,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ProCrisTabsScaffold(
      menuItems: [
        ProCrisMenuItem(
          title: 'Sair',
          onPressed: onSignOut,
        )
      ],
      tabs: [
        ProCrisTab(
          title: 'Rotina',
          icon: AppointmentsIcon(),
          body: AppointmentsList(),
        ),
        ProCrisTab(
          title: 'Alunos',
          icon: StudentsIcon(),
          body: StudentsList(),
        ),
      ],
    );
  }
}
