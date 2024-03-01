import 'package:bloc_test_app/bloc/log_in/log_in_bloc.dart';
import 'package:bloc_test_app/utils/network/form_submission_status.dart';
import 'package:bloc_test_app/utils/network/test_network.dart';
import 'package:bloc_test_app/utils/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/buttons.dart';
import '../../../utils/textfields.dart';
import '../../../utils/validation.dart';
import '../sign_in_page/sign_in_page.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  final usernameController = TextEditingController.fromValue(
      const TextEditingValue(text: "sdjdjd@gm.cc"));
  final passwordController =
  TextEditingController.fromValue(const TextEditingValue(text: "sdjdjd!Q"));
  bool obscuringPassword = true;
  IconData obscuringIcon = Icons.visibility_off;
  final formKey = GlobalKey<FormState>();
  final snackBar = const SnackBar(
    backgroundColor: Colors.white54,
    content: Text("Введите корректные данные!"),
  );
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogInBloc(),
      child: Scaffold(
        backgroundColor: Colors.white10,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 320,
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
                          onChanged: (name){BlocProvider.of<LogInBloc>(context).add(LoginUsernameChanged(username: usernameController.text));},
                          width: 350,
                          validationFunc: (value) {
                            if (Validation.ValidateUsername(value!) != null) {
                              return Validation.ValidateUsername(value);
                            }
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
                            onChanged: (name){
                              BlocProvider.of<LogInBloc>(context).add(
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
              const SizedBox(
                height: 50,
              ),
              BlocBuilder<LogInBloc, LogInState>(
                builder: (context, state) {
                   return state.status is FormSubmitting
                      ? const CircularProgressIndicator(
                    color: Colors.white, backgroundColor: Colors.red,) :
                  CustomElevatedButton(
                    text: "Войти",
                    fontSize: 20,
                    func: () async{
                        context.read<LogInBloc>().add(LoginDone());
                    },
                    bckgroundColor: Colors.red,
                    textColor: Colors.white,
                  );
                },
              ),
              const SizedBox(
                height: 40,
              ),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInPage(),
                        ),
                      );
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
    );
  }
}
