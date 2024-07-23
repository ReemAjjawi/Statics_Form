import 'package:flutter/material.dart';
import 'package:my_notification/config/color.dart';

class SubmitButton extends StatelessWidget {
  final String submitText;
  final VoidCallback onPressed;

  SubmitButton({
    Key? key,
    required this.submitText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColor.primary), 
          ),
          onPressed: onPressed,
          child: Text(
            submitText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
