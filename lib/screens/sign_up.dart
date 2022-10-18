import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:pro_cris_flutter/components/atoms/button.dart';
import 'package:pro_cris_flutter/components/atoms/dismiss_keyboard.dart';
import 'package:pro_cris_flutter/components/atoms/link.dart';
import 'package:pro_cris_flutter/components/molecules/builder_form_password.dart';
import 'package:pro_cris_flutter/components/molecules/builder_form_text.dart';
import 'package:pro_cris_flutter/components/templates/pro_cris_banner.dart';

class SignUp extends StatelessWidget {
  final GlobalKey<FormBuilderState> globalKey = GlobalKey<FormBuilderState>();

  final initialValue = {
    'name': '',
    'email': '',
    'password': '',
    'confirm_password': '',
  };

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: Scaffold(
        body: FormBuilder(
          key: globalKey,
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Criar Conta',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(height: 20),
                        BuilderFormText.sizeLg(
                          name: 'name',
                          label: 'Nome Completo',
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                              errorText: 'Esse campo é obrigatório',
                            ),
                          ]),
                        ),
                        SizedBox(height: 16),
                        BuilderFormText.sizeLg(
                          name: 'email',
                          label: 'Email',
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                              errorText: 'Esse campo é obrigatório',
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
                              errorText: 'Esse campo é obrigatório',
                            ),
                          ]),
                        ),
                        SizedBox(height: 16),
                        BuilderFormPassword.sizeLg(
                          name: 'confirm_password',
                          label: 'Confirmar Senha',
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                              errorText: 'Esse campo é obrigatório',
                            ),
                            FormBuilderValidators.match(
                              globalKey.currentState?.fields['password']
                                      ?.value ??
                                  '',
                              errorText: 'As senhas não são iguais',
                            ),
                          ]),
                        ),
                        SizedBox(height: 36),
                        Button.sizeLg(
                          alignment: Alignment.center,
                          title: 'Criar conta',
                          onPressed: () {
                            globalKey.currentState!.validate();
                            globalKey.currentState!.save();
                            print(globalKey.currentState!.value);
                          },
                        ),
                        SizedBox(height: 6),
                        Link(
                          title: 'Fazer login',
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
