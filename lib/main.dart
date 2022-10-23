// ignore_for_file: prefer_const_constructors_in_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:pro_cris_flutter/providers/pro_cris_provider.dart';

import 'package:pro_cris_flutter/styles/pro_cris_colors.dart';

import 'package:pro_cris_flutter/styles/pro_cris_theme.dart';

import 'package:pro_cris_flutter/router/pro_cris_router.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProCrisProvider.build(child: MyApp()));
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: ProCrisColors.purple,
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final authController = ProCrisProvider.useAuth(context);
        return MaterialApp(
          title: 'Pro Cris App',
          theme: ProCrisTheme.theme,
          supportedLocales: [Locale('pt'), Locale('en')],
          onGenerateRoute: (settings) => ProCrisRouter.generateRoute(
            settings: settings,
            isAuthenticated: authController.isAuthenticated,
          ),
          initialRoute: !authController.isAuthenticated
              ? ProCrisRouteNames.signIn
              : ProCrisRouteNames.home,
        );
      },
    );
  }
}
