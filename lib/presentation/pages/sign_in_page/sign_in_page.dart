import 'package:bloc_test_app/data/repo/auth_repo/auth_repo.dart';
import 'package:bloc_test_app/presentation/pages/login_page/login_page.dart';
import 'package:bloc_test_app/utils/network/test_network.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    },
                    labelText: "Введите имя пользователя",
                    controller: usernameController,
                    icon: Icons.person,
                    obscuringPass: false,
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
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    validationFunc: (value) {
                      if (Validation.ValidateEmail(value!) != null) {
                        return Validation.ValidateEmail(value!);
                      }
                    },
                    width: 350,
                    labelText: "Введите email",
                    icon: Icons.email,
                    obscuringPass: false,
                    controller: emailController,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            CustomElevatedButton(
                fontSize: 20,
                text: "Зарегистрироваться",
                func: () async{
                  if (formKey.currentState!.validate()) {
                    if (await AuthRepository.SignInData(usernameController.text, emailController.text, passwordController.text)) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AuthWidget(),
                        ),
                      );
                    } else {
                      //todo
                    }
                  }
                },
                bckgroundColor: Colors.red,
                textColor: Colors.white)
          ],
        ),
      ),
    );
  }
}
