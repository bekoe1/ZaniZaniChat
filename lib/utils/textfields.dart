import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final Color? hintText;

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
    required this.inputType,
    this.onSaved,
    this.textColor,
    this.height,
    this.cursorHeight,
    this.cursorColor,
    this.iconColor,
    this.inputAction,
    this.hintText,
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
  final Color? textColor;
  final Color? iconColor;
  final String? Function(String?)? validationFunc;
  final double width;
  final Color? hoverColor;
  final double? cursorHeight;
  final TextInputAction? inputAction;
  final OutlineInputBorder _typicalBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
    borderSide: const BorderSide(color: Colors.transparent, width: 3),
  );
  final TextInputType inputType;
  final double? height;
  final Color? cursorColor;
  final OutlineInputBorder _typicalErrorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
    borderSide: const BorderSide(color: Colors.red, width: 3),
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        cursorHeight: cursorHeight,
        onSaved: onSaved,
        textInputAction: inputAction ?? TextInputAction.newline,
        minLines: 1,
        maxLines: maxLines ?? 1,
        onChanged: onChanged,
        style: TextStyle(
          color: textColor ?? Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
        keyboardType: inputType,
        validator: validationFunc,
        cursorColor: cursorColor ?? Colors.black,
        decoration: InputDecoration(
          fillColor: fillColor,
          errorBorder: _typicalErrorBorder,
          focusedErrorBorder: _typicalErrorBorder,
          errorStyle: const TextStyle(color: Colors.red, fontSize: 13),
          filled: filled ?? false,
          hintText: labelText,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: hintText,
            fontSize: 14,
          ),
          enabledBorder: _typicalBorder,
          focusedBorder: _typicalBorder,
          contentPadding: const EdgeInsets.all(10),
          prefixIcon: Icon(
            icon,
            color: iconColor,
          ),
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
