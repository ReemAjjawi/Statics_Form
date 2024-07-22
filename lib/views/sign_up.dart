
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_notification/config/color.dart';
import 'package:my_notification/models/signup_model.dart';
import 'package:my_notification/providers/insert_user.dart';
import 'package:my_notification/stream_provider.dart';
import 'package:my_notification/views/question.dart';

class SignUpSecreen extends ConsumerWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  final genderProvider = StateProvider<bool>((ref) => false);
  final sportProvider = StateProvider<bool>((ref) => false);
  final readProvider = StateProvider<bool>((ref) => false);

  final formKey = GlobalKey<FormState>();
  ValueNotifier<bool> clicked = ValueNotifier(false);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final userModel = ref.watch(insertedRecordIdProvider);
    final gender = ref
    .watch(genderProvider);
    final sport = ref.watch(sportProvider);
    final read = ref.watch(readProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        elevation: 0,
      ),
      backgroundColor: Color(0xFFffffff),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
              Text(
                       " أهلا بكم! ",
                     style: TextStyle(
                          fontSize: 30, color:AppColor.primary),
                     ),
                   Text(
                   "يرجى إدخال المعلومات لإنشاء حساب",
                     style: TextStyle(
                        fontSize: 20,                   color:AppColor.primary,
                       ),
                     ),
                     SizedBox(
                       height: 20,
                   ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                                              cursorColor: AppColor.primary,

                  decoration: InputDecoration(
                                                  hintStyle: TextStyle(color: AppColor.primary),

                    labelText: 'البريد الالكتروني:',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.primary),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.primary),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء إدخال البريد الالكتروني';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                                              cursorColor: AppColor.primary,

                  obscureText: true,
                  decoration: InputDecoration(
                                                  hintStyle: TextStyle(color: AppColor.primary),

                    labelText: 'كلمة السر:',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.primary),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.primary),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء إدخال كلمة السر';
                    }
                       else if (value.length<5) {
                      return 'الرجاء إدخال كلمة سر اكثر من 5 احرف ';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                                              cursorColor: AppColor.primary,
                                              

                  controller: nameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                                                  hintStyle: TextStyle(color: AppColor.primary),

                    labelText: 'الإسم:',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.primary),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.primary),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء إدخال الإسم';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                                              cursorColor: AppColor.primary,
                                              

                  controller: ageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                                                  hintStyle: TextStyle(color: AppColor.primary),

                    labelText: 'العمر:',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.primary),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.primary),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء إدخال العمر';
                    }
                    final int? age = int.tryParse(value);
                    if (age == null || age < 1 || age > 90) {
                      return 'الرجاء إدخال عمر صحيح بين 1 و 90';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
            
                CheckboxListTile(
                  title: Text('هل تحب لعب الرياضة؟'),
                  value: sport,
                  onChanged: (bool? value) {
                    ref.read(sportProvider.notifier).state = value ?? false;
                  },
 activeColor: AppColor.primary,                ),

                CheckboxListTile(
                  title: Text('هل تحب القراءة او المطالعة؟'),
                  value: read,
                  onChanged: (bool? value) {
                    ref.read(readProvider.notifier).state = value ?? false;
                  },
 activeColor: AppColor.primary,                ),
                SizedBox(
                  height: 30,
                ),



  //  Container(
  //                               height: 50,
  //                             //  width:50,
  //                               margin: EdgeInsets.symmetric(horizontal: 90),
  //                               decoration: BoxDecoration(
  //                                 color: Colors.cyan[500],
  //                                 borderRadius: BorderRadius.circular(20),
  //                               ),
  //                               child: Center(
  //                                 child: TextButton(
  //                                       onPressed: () async {
  //                   if (formKey.currentState!.validate()) {
  //                     final name = nameController.text;
  //                     final age = int.tryParse(ageController.text);

  //                     if (name.isNotEmpty && age != null) {
  //                       try {
  //                      final insertUser = ref.read(insertUserProvider);
  //                         final user = await insertUser(
  //                             UserModel(name: name, age: age, id: 0));
  //                         //  ref.read(insertedRecordIdProvider.notifier).state = user;
  //                         Navigator.pushReplacement(
  //                             context,
  //                             MaterialPageRoute(
  //                                 builder: (context) =>
  //                                     QuestionsPage(id: user.id)));
  //                       } catch (e) {
  //                         print(e);
  //                       }
  //                     }
  //                   }
  //                 },
  //                                     child: Text('تسجيل المعلومات',
  //                                       style: TextStyle(
  //                                           color: Colors.white,
  //                                           fontSize: 16,
  //                                           fontWeight: FontWeight.bold),
  //                                     )),
  //                               ),
  //                             ),










             ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(AppColor.primary),
                  ),
                onPressed: () async {
                  clicked.value=true;
                    if (formKey.currentState!.validate()) {
                      final name = nameController.text;
                      final age = int.tryParse(ageController.text);

                      if (name.isNotEmpty && age != null) {
                        try {
                       final insertUser = ref.read(insertUserProvider);
                          final user = await insertUser(
                              UserModel(name: name, age: age, id: 0));
                          //  ref.read(insertedRecordIdProvider.notifier).state = user;
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      QuestionsPage(id: user.id)));
                        } catch (e) {
                          print(e);
                        }
                      }
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                       child: Text('تسجيل المعلومات',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      )
                    ),
                  ),
                ),
                
     ValueListenableBuilder(
              valueListenable: clicked,
              builder: (context, hisValue, _) {
                return Visibility(visible: hisValue,
                  child: CircularProgressIndicator());
              },
            ),

                // SizedBox(height: 20),
                // Text(userModel != null
                //     ? 'Inserted record ID: ${userModel.id}'
                //     : 'No record inserted yet'),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}


