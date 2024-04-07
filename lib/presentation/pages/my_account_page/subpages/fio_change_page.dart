import 'package:bloc_test_app/presentation/pages/my_account_page/my_account_page.dart';
import 'package:bloc_test_app/utils/textfields.dart';
import 'package:bloc_test_app/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/my_account_bloc.dart';

class FioChangePage extends StatelessWidget {
  FioChangePage({super.key});

  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyAccountBloc(),
      child: BlocBuilder<MyAccountBloc, MyAccountState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Scaffold(
              backgroundColor: Colors.white12,
              appBar: AppBar(
                leading: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      context
                          .read<MyAccountBloc>()
                          .add(FetchAccountInfoEvent());
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyAccountPage()));
                    }),
                title: const Text(
                  "Имя и Фамилия",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                backgroundColor: Colors.transparent,
                iconTheme: const IconThemeData(
                  color: Colors.white,
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        (context)
                            .read<MyAccountBloc>()
                            .add(AttemptToChangeNameAndSurname(
                              name: nameController.text,
                              surname: surnameController.text,
                            ));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Данные отправлены"),
                            backgroundColor: Colors.white54,
                          ),
                        );
                        FocusScope.of(context).unfocus();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Введите корректные данные"),
                            backgroundColor: Colors.white54,
                          ),
                        );
                        FocusScope.of(context).unfocus();
                      }
                    },
                    icon: const Icon(Icons.check),
                  ),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "Задать Имя и Фамилию",
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      CustomTextFormField(
                        textColor: Colors.white,
                        controller: nameController,
                        inputAction: TextInputAction.done,
                        obscuringPass: false,
                        width: double.infinity,
                        inputType: TextInputType.text,
                        cursorColor: Colors.white,
                        hintText: "Введите Имя",
                        hintTextStyle: const TextStyle(
                            color: Colors.white30, fontSize: 18),
                        filled: true,
                        fillColor: Colors.white12,
                        validationFunc: (value) {
                          if (Validation.ValidateUsername(value!) != null) {
                            return Validation.ValidateUsername(value);
                          }
                        },
                      ),
                      const SizedBox(height: 30),
                      CustomTextFormField(
                        textColor: Colors.white,
                        inputAction: TextInputAction.done,
                        controller: surnameController,
                        obscuringPass: false,
                        width: double.infinity,
                        inputType: TextInputType.text,
                        cursorColor: Colors.white,
                        hintText: "Введите Фамилию",
                        hintTextStyle: const TextStyle(
                            color: Colors.white30, fontSize: 18),
                        filled: true,
                        fillColor: Colors.white12,
                        validationFunc: (value) {
                          if (Validation.ValidateUsername(value!) != null) {
                            return Validation.ValidateUsername(value);
                          }
                        },
                      ),
                      const SizedBox(height: 100),
                      Text(
                        state is ErrorInFetchingMyAccData ? state.exc : "",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 29,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
