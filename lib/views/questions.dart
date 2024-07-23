// third.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_notification/component.dart/button_submit.dart';
import 'package:my_notification/component.dart/textfield_primary.dart';
import 'package:my_notification/config/color.dart';
import 'package:my_notification/notifications/noti_service.dart';
import 'package:my_notification/providers/insert_provider.dart';
import 'package:my_notification/dirty_things.dart/insert_id_user_answer.dart';
import 'package:my_notification/views/login.dart';
import 'package:my_notification/views/forms.dart';

class Third extends ConsumerWidget {
  Third(this.questionList, this.id, this.index, this.numberOfFormLength, {super.key});
  
  final Map<String, dynamic> questionList;
  final int id;
  final int index;
  final int numberOfFormLength;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: questionList['questions'].length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              questionList['questions'][index],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          CustomTextFormField(
                            hintText: 'أدخل إجابتك',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'الرجاء إدخال إجابة';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SubmitButton(
                submitText: "إرسال الأجوبة",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    // final question = ref.watch(questionProvider);
                    final FormValueTrueList = ref.watch(clickedFormProvider);

                    ref.read(clickedFormProvider.notifier).state = [
                      ...FormValueTrueList,
                      index
                    ];
                    final FormValueTrueListAnother = ref.watch(clickedFormProvider);

                    final useridService = ref.watch(useridServiceProvider);

                    final insertedUser = useridService.insertIdUser(questionList['id'], id);
                                        ref.read(checkBoxProvider(index).notifier).state = true;

                    if (FormValueTrueListAnother.length != numberOfFormLength) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('شكرا للمشاركة في الاستبيان'),
                          duration: Duration(seconds: 2),
                          backgroundColor: AppColor.primary,
                        ),
                      );
                      Navigator.pop(context);
                    }

                    if (FormValueTrueListAnother.length == numberOfFormLength) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SignInSecreen()),
                      );

                      LocalNotificationService.showBasicNotificationWhenAnswer();
                    }
                  }
                },
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
