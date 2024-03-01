import 'package:flutter/material.dart';


class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    this.controller,
    this.visibleText,
    required this.icon,
    this.suffixIcon,
    this.action,
    this.onChanged,
    required this.obscuringPass,
    this.labelText,
    this.errorText, this.validationFunc, required this.width,
  });
  final String? errorText;
  final String? labelText;
  final String? visibleText;
  final TextEditingController? controller;
  final IconData icon;
  final IconData? suffixIcon;
  final void Function()? action;
  final void Function(String)? onChanged;

  final bool obscuringPass;
  final String? Function(String?)? validationFunc;
  final double width;
  final OutlineInputBorder _typicalBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
    borderSide: const BorderSide(color: Colors.white54, width: 3),
  );

  final OutlineInputBorder _typicalErrorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
    borderSide: const BorderSide(color: Colors.red, width: 3),
  );
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        onChanged: onChanged,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
        keyboardType: TextInputType.emailAddress,
        validator: validationFunc,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          errorBorder: _typicalErrorBorder,
          focusedErrorBorder: _typicalErrorBorder,
          errorStyle: const TextStyle(color: Colors.red,
              fontSize: 13
          ),
          filled: true,
          hintText: labelText,
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black45,
            fontSize: 20,
          ),
          enabledBorder: _typicalBorder,
          focusedBorder: _typicalBorder,
          contentPadding: const EdgeInsets.all(10),
          prefixIcon: Icon(icon),
          suffixIcon: IconButton(
            icon: Icon(suffixIcon),
            onPressed: action,
          ),
        ),
        controller: controller,
        obscureText: obscuringPass,
      ),
    );
  }
}