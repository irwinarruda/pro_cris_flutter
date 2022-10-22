import 'package:flutter/material.dart';
import 'package:pro_cris_flutter/stores/auth_controller.dart';

import 'package:pro_cris_flutter/screens/sign_in.dart';
import 'package:pro_cris_flutter/screens/sign_up.dart';
import 'package:pro_cris_flutter/screens/appointments_students_list.dart';
import 'package:pro_cris_flutter/screens/students_management.dart';

class ProCrisRouteNames {
  static const signIn = '/sign_in';
  static const signUp = '/sign_up';
  static const home = '/home';
  static const studentsManagement = '/students_management';
}

class ProCrisRouter {
  static Route<dynamic> generateRoute({
    required RouteSettings settings,
    required AuthController authController,
  }) {
    if (!authController.isAuthenticated) {
      return getUnAuthenticatedRoutes(settings);
    } else {
      return getAuthenticatedRoutes(settings);
    }
  }

  static Route<dynamic> getUnAuthenticatedRoutes(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case ProCrisRouteNames.signIn:
        return MaterialPageRoute(
          builder: (context) => SignIn(),
        );
      case ProCrisRouteNames.signUp:
        return MaterialPageRoute(
          builder: (context) => SignUp(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => SignIn(),
        );
    }
  }

  static Route<dynamic> getAuthenticatedRoutes(RouteSettings settings) {
    switch (settings.name) {
      case ProCrisRouteNames.home:
        return MaterialPageRoute(
          builder: (context) => AppointmentsStudentsList(),
        );
      case ProCrisRouteNames.studentsManagement:
        return MaterialPageRoute(
          builder: (context) => StudentsManagement(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => AppointmentsStudentsList(),
        );
    }
  }
}
