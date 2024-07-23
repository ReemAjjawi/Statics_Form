



import 'package:flutter/material.dart';
import 'package:my_notification/config/color.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String labelText;
  final String hintText;
  final FormFieldValidator<String>? validator;
  final bool obscureText;

  const CustomTextFormField({
    Key? key,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.labelText = '',
    this.hintText = '',
    this.validator,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.end,
      controller: controller,
      cursorColor: AppColor.primary,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Color.fromARGB(214, 165, 168, 168)),
        hintText: hintText,
        hintStyle: TextStyle(color: Color.fromARGB(214, 165, 168, 168)),
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.primary),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(214, 165, 168, 168)),
        ),
      ),
      validator: validator,
    );
  }
}




