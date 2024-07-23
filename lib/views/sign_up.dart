
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_notification/component.dart/button_submit.dart';
import 'package:my_notification/component.dart/textfield_primary.dart';
import 'package:my_notification/config/algrithm.dart';
import 'package:my_notification/config/color.dart';
import 'package:my_notification/models/signup_model.dart';
import 'package:my_notification/providers/insert_provider.dart';
import 'package:my_notification/providers/fetch_question_provider.dart';
import 'package:my_notification/views/forms.dart';

class SignUpSecreen extends ConsumerWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  final genderProvider = StateProvider<bool>((ref) => false);
  final readProvider = StateProvider<bool>((ref) => false);

  final formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> clicked = ValueNotifier(false);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final userModel = ref.watch(insertedRecordIdProvider);
    final gender = ref.watch(genderProvider);
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
            CustomTextFormField(
                    labelText: 'البريد الالكتروني:',
                    keyboardType: TextInputType.emailAddress,
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
                CustomTextFormField(
                    labelText: 'كلمة السر:',
                       obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الرجاء إدخال كلمة السر';
                      } else if (value.length < 5) {
                        return 'الرجاء إدخال كلمة سر اكثر من 5 أحرف';
                      }
                      return null;
                      
                    },
                  ),
            
                SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                    controller: nameController,
                    labelText: 'الإسم:',
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
              CustomTextFormField(
                labelText: 'العمر :',
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الرجاء إدخال العمر';
                      }
                      final int? age = int.tryParse(value);
                      if (age == null || age < 18 || age > 90) {
                        return 'الرجاء إدخال عمر صحيح بين 18 و 90';
                      }
                      return null;
                    },
                  ),
                SizedBox(
                  height: 30,
                ),
            
          
CheckboxListTile(
                  title: Text('هل انت  تملك دراسة جامعية ؟  '),
                  value: gender,
                  onChanged: (bool? value) {
                    ref.read(genderProvider.notifier).state = value ?? false;
                  },
                  activeColor: AppColor.primary,
                ),
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

   ValueListenableBuilder<bool>(
  
                    valueListenable: clicked,
                    builder: (context, clicked, _) {
                      
                      return clicked
                          ? Center(child: CircularProgressIndicator())
                          : SubmitButton(
                              submitText: "تسجيل الدخول",
                              onPressed: () async {
                                clicked=true;
                                if (formKey.currentState!.validate()) {
                                         final name = nameController.text;
                      final age = int.tryParse(ageController.text);

                      if (name.isNotEmpty && age != null) {
                        try {

final userService = ref.watch(userServiceProvider);

  final insertedUser = await userService.insertUser(  UserModel(name: name, age: age, id: 0));
  print('Inserted User: ${insertedUser.name}, ID: ${insertedUser.id}');

String typeUser =
                                    typeUserFunction(age, gender, read);
                      
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      QuestionsPage(id: insertedUser.id,typeUser:typeUser)));
                        } catch (e) {
                          print(e);
                        }
                        finally {
                          clicked=false;
                                    }
                      }
                    }
                  },
          );
                    })
,
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


