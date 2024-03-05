import 'package:bloc_test_app/presentation/pages/sign_in_page/Bloc/sign_in_bloc.dart';
import 'package:bloc_test_app/utils/form_submission_status.dart';
import 'package:bloc_test_app/utils/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/buttons.dart';
import '../../../utils/textfields.dart';
import '../../../utils/validation.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscuringPassword = true;
  IconData obscuringIcon = Icons.visibility_off;
  final snackBar = const CustomSnackBar(
      text: "Возникла ошибка",
      backgroundColor: Colors.grey,
      mainColor: Colors.white);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInBloc(),
      child: BlocBuilder<SignInBloc, SignInState>(
        builder: (context, state) => Scaffold(
          backgroundColor: Colors.white10,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50, left: 20),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 190,
                  child: Placeholder(
                    color: Colors.transparent,
                  ),
                ),
                Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: formKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
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
                        onChanged: (name) {
                          context
                              .read<SignInBloc>()
                              .add(SignInUsernameChanged(name: name));
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        width: 350,
                        validationFunc: (value) {
                          if (Validation.ValidatePass(value!) != null) {
                            return Validation.ValidatePass(value);
                          }
                          return null;
                        },
                        labelText: "Введите пароль",
                        controller: passwordController,
                        icon: Icons.https,
                        obscuringPass: obscuringPassword,
                        suffixIcon: obscuringIcon,
                        action: () {
                          setState(
                            () {
                              obscuringPassword = !obscuringPassword;
                              obscuringPassword
                                  ? obscuringIcon = Icons.visibility_off
                                  : obscuringIcon = Icons.visibility;
                            },
                          );
                        },
                        onChanged: (pas) {
                          context
                              .read<SignInBloc>()
                              .add(SignInPasswordChanged(password: pas));
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        validationFunc: (value) {
                          if (Validation.ValidateEmail(value!) != null) {
                            return Validation.ValidateEmail(value);
                          }
                          return null;
                        },
                        width: 350,
                        labelText: "Введите email",
                        icon: Icons.email,
                        obscuringPass: false,
                        controller: emailController,
                        onChanged: (email) {
                          context
                              .read<SignInBloc>()
                              .add(SignInEmailChanged(email: email));
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                CustomElevatedButton(
                    fontSize: 20,
                    text: "Зарегистрироваться",
                    func: () async {
                      if (formKey.currentState!.validate()) {
                        (context).read<SignInBloc>().add(SignInDone());
                        if (context.read<SignInBloc>().state.status ==
                            SubmissionSuccess) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Ссылка для подтверждения отправлена на ${emailController.text}",
                                style: const TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.grey,
                              duration: const Duration(seconds: 2),
                            ),
                          );
                          Future.delayed(const Duration(seconds: 2), () {
                            Navigator.pushNamed(context, "/log_in");
                          });
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Возникла ошибка",
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.grey,
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                    bckgroundColor: Colors.red,
                    textColor: Colors.white)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
