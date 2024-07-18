import 'package:flutter/material.dart';
import 'package:my_notification/login.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
   @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignInSecreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromARGB(255, 33, 229, 243)  ,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
          ),
        child: Container(
          width: MediaQuery.of(context).size.width/2,
                    height: MediaQuery.of(context).size.height/3,

          child: Center(child: Text("Form Desination App",)),
        ),
        ),
      ),
    );
  }
}