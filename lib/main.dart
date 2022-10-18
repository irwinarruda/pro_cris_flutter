// ignore_for_file: prefer_const_constructors_in_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pro_cris_flutter/stores/auth_controller.dart';

import 'package:pro_cris_flutter/styles/pro_cris_colors.dart';

import 'package:pro_cris_flutter/styles/pro_cris_theme.dart';
import 'package:pro_cris_flutter/screens/sign_in.dart';
import 'package:pro_cris_flutter/screens/sign_up.dart';
import 'package:pro_cris_flutter/screens/appointments_students_list.dart';
import 'package:pro_cris_flutter/screens/students_management.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: ProCrisColors.purple,
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return MaterialApp(
          title: 'Pro Cris App',
          theme: ProCrisTheme.theme,
          initialRoute: _authController.platformUser != null
              ? 'appointments_students_list'
              : '/sign_in',
          supportedLocales: [Locale('pt'), Locale('en')],
          routes: {
            '/sign_in': (context) => SignIn(),
            '/sign_up': (context) => SignUp(),
            '/appointments_students_list': (context) =>
                AppointmentsStudentsList(),
            '/students_management': (context) => StudentsManagement(),
          },
        );
      },
    );
  }
}
