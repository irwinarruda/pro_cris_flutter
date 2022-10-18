import 'package:flutter/material.dart';

import 'package:pro_cris_flutter/components/atoms/appointments_icon.dart';
import 'package:pro_cris_flutter/components/atoms/students_icon.dart';
import 'package:pro_cris_flutter/components/templates/pro_cris_tabs_scaffold.dart';

import 'package:pro_cris_flutter/screens/appointments_list.dart';
import 'package:pro_cris_flutter/screens/students_list.dart';

import 'package:pro_cris_flutter/stores/auth_controller.dart';

class AppointmentsStudentsList extends StatelessWidget {
  final _authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return ProCrisTabsScaffold(
      menuItems: [
        ProCrisMenuItem(
          title: 'Sair',
          onPressed: () async {
            await _authController.signOut();
            // ignore: use_build_context_synchronously
            Navigator.pushReplacementNamed(context, '/sign_in');
          },
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
