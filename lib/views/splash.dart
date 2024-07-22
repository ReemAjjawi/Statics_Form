import 'package:flutter/material.dart';
import 'package:my_notification/config/color.dart';
import 'package:my_notification/views/login.dart';

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
      backgroundColor:AppColor.primary  ,
      body: Center(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [ Container(
          decoration: BoxDecoration(
            color: Colors.white,
        //    borderRadius: BorderRadius.circular(20),
            shape: BoxShape.circle
          ),

          child: Center(child: Icon(Icons.fork_left_rounded,size: 70,color: AppColor.primary ,)),
        ),SizedBox(height: 10,),
             Container(
          decoration: BoxDecoration(
           // color: Colors.white,
        //    borderRadius: BorderRadius.circular(20)
          ),

          child: Center(child: Text("Form Desination App",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
        ),
        
        ],
      )
      ),
    );
  }
}