import 'package:flutter/material.dart';
import 'package:my_notification/config/color.dart';
import 'package:my_notification/main.dart';
import 'package:my_notification/views/sign_up.dart';

class SignInSecreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
       
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
        
              },
              icon: Icon(Icons.list))
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height,
                  maxWidth: MediaQuery.of(context).size.width),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 33, 229, 243),
                    Color.fromARGB(255, 33, 229, 243),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30.0, horizontal: 24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      
                        
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                          "أهلاً بكم في مركز الإحصاء والتخطيط",
                                style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.0,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 5,
                      child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(90),
                                  topRight: Radius.circular(90))),
                          child: Column(
                            children: [
                              Container(),
                              SizedBox(height: 40),
                              buildPrimaryTextField(hint:"البريد الإلكتروني"),
                              SizedBox(height: 40),
                                                       buildPrimaryTextField(hint:"كلمة السر :"),

                              SizedBox(height: 80),
                              Container(
                                height: 50,
                                margin: EdgeInsets.symmetric(horizontal: 90),
                                decoration: BoxDecoration(
                                  color: Colors.cyan[500],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(



  child:  ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(AppColor.primary),
                ),
                onPressed: () {
               
                },
                child: SubmitButton(submitText: "تسجيل الدخول"),
              ),













                                ),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 50,
                                          margin:
                                          EdgeInsets.symmetric(horizontal: 35),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          child: Text(
                                            " ليس لديك حساب ؟",
                                            style: TextStyle(
                                                color: Colors.cyan[500],
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        ElevatedButton(
                                          child: Icon(
                                            Icons.arrow_circle_left_rounded,color: Color.fromARGB(255, 33, 229, 243) ,
                                          ),
                                          onPressed: () {
                                              Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignUpSecreen()),
      );
                                        
                                          },
                                
                                        ),
                                      ])
                                ],
                              )
                            ],
                          )))
                ],
              ),
            )),
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
   SubmitButton({
    super.key,
    required this.submitText,
  });
String submitText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(
                            submitText,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.bold),
                          )
      ),
    );
  }
}

class buildPrimaryTextField extends StatelessWidget {
   buildPrimaryTextField({
   required this.hint,
    super.key,
  });
String hint;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          
            border: Border(
                bottom: BorderSide(color: Colors.grey))),
        child: TextField(
          decoration: InputDecoration(
                                          hintStyle: TextStyle(color: AppColor.primary),

              hintText: "$hint :",
              border: InputBorder.none),
        ));
  }
}
