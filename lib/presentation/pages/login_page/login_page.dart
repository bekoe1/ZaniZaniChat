import 'dart:developer';

import 'package:bloc_test_app/presentation/pages/login_page/bloc/log_in_bloc.dart';
import 'package:bloc_test_app/utils/form_submission_status.dart';
import 'package:bloc_test_app/utils/internal_storage_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/buttons.dart';
import '../../../utils/textfields.dart';
import '../../../utils/validation.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscuringPassword = true;
  IconData obscuringIcon = Icons.visibility_off;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogInBloc(),
      child: Scaffold(
        backgroundColor: Colors.white10,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 170,
                  child: Placeholder(
                    color: Colors.transparent,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    "Войдите в аккаунт",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: formKey,
                  child: Column(
                    children: [
                      BlocBuilder<LogInBloc, LogInState>(
                        builder: (context, state) {
                          return CustomTextFormField(
                            filled: true,
                            fillColor: Colors.white54,
                            inputType: TextInputType.name,
                            onChanged: (name) {
                              context.read<LogInBloc>().add(
                                  LoginUsernameChanged(
                                      username: usernameController.text));
                            },
                            width: 350,
                            validationFunc: (value) {
                              if (Validation.ValidateUsername(value!) != null) {
                                return Validation.ValidateUsername(value);
                              }
                              return null;
                            },
                            labelText: "Введите имя пользователя",
                            controller: usernameController,
                            icon: Icons.person,
                            obscuringPass: false,
                          );
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      BlocBuilder<LogInBloc, LogInState>(
                        builder: (context, state) {
                          return CustomTextFormField(
                              inputType: TextInputType.visiblePassword,
                              filled: true,
                              fillColor: Colors.white54,
                              width: 350,
                              validationFunc: (value) {
                                if (Validation.ValidatePass(value!) != null) {
                                  return Validation.ValidatePass(value);
                                }
                              },
                              labelText: "Введите пароль",
                              controller: passwordController,
                              icon: Icons.https,
                              obscuringPass: obscuringPassword,
                              suffixIcon: obscuringIcon,
                              onChanged: (name) {
                                context.read<LogInBloc>().add(
                                    LoginPasswordChanged(
                                        password: passwordController.text));
                              },
                              action: () {
                                setState(() {
                                  obscuringPassword = !obscuringPassword;
                                  obscuringPassword
                                      ? obscuringIcon = Icons.visibility_off
                                      : obscuringIcon = Icons.visibility;
                                });
                              });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                BlocConsumer<LogInBloc, LogInState>(builder: (context, state) {
                  return state.status is FormSubmitting
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                          backgroundColor: Colors.red,
                        )
                      : CustomElevatedButton(
                          text: "Войти",
                          fontSize: 20,
                          func: () {
                            if (formKey.currentState!.validate()) {
                              context.read<LogInBloc>().add(LoginDone());
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Введите корректные данные"),
                                  backgroundColor: Colors.white54,
                                ),
                              );
                            }
                          },
                          bckgroundColor: Colors.red,
                          textColor: Colors.white,
                        );
                }, listener: (context, state) {
                  if (formKey.currentState!.validate()) {
                    log("zashel");
                    if (state.status is SubmissionSuccess) {
                      SharedPrefsHelper.SetName(state.username);
                      Navigator.pushNamed(context, "/dialogs");
                    }
                    if (state.status is SubmissionFailed) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.status.exception!),
                          backgroundColor: Colors.white54,
                        ),
                      );
                    }
                  }
                }),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.white70,
                        endIndent: 15,
                        indent: 20,
                      ),
                    ),
                    Text(
                      "или войдите через",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.white70,
                        endIndent: 20,
                        indent: 15,
                      ),
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(30.0),
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: Placeholder(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "Нет аккаунта?",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed("/sign_in");
                      },
                      child: const Text(
                        "Зарегестрируйтесь",
                        style: TextStyle(color: Colors.red, fontSize: 20),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
