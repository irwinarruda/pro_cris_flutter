import 'package:flutter/material.dart';
import 'package:pro_cris_flutter/stores/auth_controller.dart';
import 'package:pro_cris_flutter/stores/student_controller.dart';
import 'package:provider/provider.dart';

class ProCrisProvider {
  static Widget build({required Widget child}) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => AuthController()),
        Provider(create: (_) => StudentController()),
      ],
      child: child,
    );
  }

  static AuthController useAuth(BuildContext context) {
    return context.read<AuthController>();
  }

  static StudentController useStudent(BuildContext context) {
    return context.read<StudentController>();
  }
}
