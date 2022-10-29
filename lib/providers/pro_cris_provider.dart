import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

import 'package:pro_cris_flutter/components/templates/pro_cris_loading.dart';

import 'package:pro_cris_flutter/stores/auth_controller.dart';
import 'package:pro_cris_flutter/stores/student_controller.dart';

class ProCrisProvider {
  static Widget build({required Widget child}) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => AuthController()),
        Provider(create: (_) => StudentController()),
      ],
      child: GlobalLoaderOverlay(
        useDefaultLoading: false,
        overlayWidget: ProCrisLoading(),
        overlayColor: Colors.black,
        overlayOpacity: 0.28,
        child: child,
      ),
    );
  }

  static AuthController useAuth(BuildContext context) {
    return context.read<AuthController>();
  }

  static StudentController useStudent(BuildContext context) {
    return context.read<StudentController>();
  }
}
