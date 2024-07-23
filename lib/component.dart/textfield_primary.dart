



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
      controller: controller,
      cursorColor: AppColor.primary,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        hintStyle: TextStyle(color: AppColor.primary),
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.primary),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.primary),
        ),
      ),
      validator: validator,
    );
  }
}




