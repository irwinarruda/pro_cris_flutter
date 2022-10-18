import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:pro_cris_flutter/components/atoms/button.dart';
import 'package:pro_cris_flutter/components/atoms/dismiss_keyboard.dart';
import 'package:pro_cris_flutter/components/atoms/link.dart';
import 'package:pro_cris_flutter/components/molecules/builder_form_text.dart';
import 'package:pro_cris_flutter/components/molecules/builder_form_password.dart';
import 'package:pro_cris_flutter/components/templates/pro_cris_banner.dart';

import 'package:pro_cris_flutter/stores/auth_controller.dart';

class SignIn extends StatelessWidget {
  final _authController = AuthController();
  final GlobalKey<FormBuilderState> _globalKey = GlobalKey<FormBuilderState>();

  final initialValue = {
    'email': '',
    'password': '',
  };

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: Scaffold(
        body: FormBuilder(
          key: _globalKey,
          initialValue: initialValue,
          child: Column(
            children: [
              ProCrisBanner(
                height: 155,
              ),
              Expanded(
                flex: 7,
                child: Container(
                  padding: EdgeInsets.only(
                    top: 22,
                    right: 16,
                    bottom: 0,
                    left: 16,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Fazer Login',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(height: 20),
                        BuilderFormText.sizeLg(
                          name: 'email',
                          label: 'Email',
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                              errorText: 'Digite um email válido',
                            ),
                            FormBuilderValidators.email(
                              errorText: 'Digite um email válido',
                            ),
                          ]),
                        ),
                        SizedBox(height: 16),
                        BuilderFormPassword.sizeLg(
                          name: 'password',
                          label: 'Senha',
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                              errorText: 'Digite uma senha',
                            )
                          ]),
                        ),
                        SizedBox(height: 36),
                        Button.sizeLg(
                          title: 'Fazer Login',
                          alignment: Alignment.center,
                          onPressed: () async {
                            _globalKey.currentState!.validate();
                            _globalKey.currentState!.save();
                            print(_globalKey.currentState!.value['email']);
                            await _authController.signIn(
                              email: _globalKey.currentState!.value['email'],
                              password:
                                  _globalKey.currentState!.value['password'],
                            );
                            // ignore: use_build_context_synchronously
                            Navigator.pushReplacementNamed(
                              context,
                              '/appointments_students_list',
                            );
                          },
                        ),
                        SizedBox(height: 6),
                        Link(
                          title: 'Criar conta',
                          onPressed: () {
                            Navigator.pushNamed(context, '/sign_up');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
