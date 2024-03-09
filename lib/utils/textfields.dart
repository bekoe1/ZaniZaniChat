import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    this.controller,
    this.visibleText,
    this.icon,
    this.suffixIcon,
    this.action,
    this.onChanged,
    required this.obscuringPass,
    this.labelText,
    this.errorText,
    this.validationFunc,
    required this.width,
    this.fillColor,
    this.filled,
    this.hoverColor,
    this.maxLines,
    required this.inputType, this.onSaved,
  });


  final String? errorText;
  final String? labelText;
  final String? visibleText;
  final TextEditingController? controller;
  final IconData? icon;
  final IconData? suffixIcon;
  final void Function()? action;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final Color? fillColor;
  final bool obscuringPass;
  final bool? filled;
  final int? maxLines;

  final String? Function(String?)? validationFunc;
  final double width;
  final Color? hoverColor;
  final OutlineInputBorder _typicalBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
    borderSide: const BorderSide(color: Colors.white, width: 3),
  );
  final TextInputType inputType;
  final OutlineInputBorder _typicalErrorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
    borderSide: const BorderSide(color: Colors.red, width: 3),
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        onSaved: onSaved,
        textInputAction: TextInputAction.newline,
        minLines: 1,
        maxLines: maxLines ?? 5,
        onChanged: onChanged,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
        keyboardType: inputType,
        validator: validationFunc,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          fillColor: fillColor,
          errorBorder: _typicalErrorBorder,
          focusedErrorBorder: _typicalErrorBorder,
          errorStyle: const TextStyle(color: Colors.red, fontSize: 13),
          filled: filled ?? false,
          hintText: labelText,
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black45,
            fontSize: 20,
          ),
          enabledBorder: filled == false ? _typicalBorder : null,
          focusedBorder: filled == false ? _typicalBorder : null,
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
