import 'package:flutter/material.dart';

class third extends StatelessWidget {
   third(this.question, {super.key});
String question;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Text(question),
    );
  }
}