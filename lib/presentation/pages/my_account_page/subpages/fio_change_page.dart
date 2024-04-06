import 'package:bloc_test_app/utils/textfields.dart';
import 'package:flutter/material.dart';

class FioChangePage extends StatelessWidget {
   FioChangePage({super.key});
  final nameController = TextEditingController();
  final surnameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
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
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.check))],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
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
              controller: nameController,
              obscuringPass: false,
              width: double.infinity,
              inputType: TextInputType.text,
              cursorColor: Colors.white,
              hintText: "Введите Имя",
              hintTextStyle:
                  const TextStyle(color: Colors.white30, fontSize: 18),
              filled: true,
              fillColor: Colors.white12,
            ),
            const SizedBox(height: 30),
            CustomTextFormField(
              controller: surnameController,
              obscuringPass: false,
              width: double.infinity,
              inputType: TextInputType.text,
              cursorColor: Colors.white,
              hintText: "Введите Фамилию",
              hintTextStyle:
                  const TextStyle(color: Colors.white30, fontSize: 18),
              filled: true,
              fillColor: Colors.white12,
            ),
          ],
        ),
      ),
    );
  }
}
