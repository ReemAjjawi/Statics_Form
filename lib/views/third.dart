import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_notification/config/color.dart';
import 'package:my_notification/notifications/noti_service.dart';
import 'package:my_notification/providers/insert_id_user_answer.dart';
import 'package:my_notification/views/question.dart';
import 'package:my_notification/stream_provider.dart';

class third extends ConsumerWidget {
  third(this.questionList, this.id, this.index, this.lengh, {super.key});
  final Map<String, dynamic> questionList;
  int id;
  int index;
  int lengh;
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
                          TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
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
                                return 'Please enter an answer';
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

              Container(
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 90),
                decoration: BoxDecoration(
                  color: Colors.cyan[500],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: TextButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          // final question = ref.watch(questionProvider);
                          ref.read(genderProvider(index).notifier).state = true;
                          final indexinkwll = ref.watch(indexinkwllProvider);

                          ref.read(indexinkwllProvider.notifier).state = [
                            ...indexinkwll,
                            index
                          ];
                          final indexinkwll1 = ref.watch(indexinkwllProvider);

                          final insertDataid =
                              ref.read(insertIdUserWhoAnswerOnQuestion);
                          insertDataid(questionList['id'], id);
                          if (indexinkwll1.length != lengh) {
                            ScaffoldMessenger.of(context).showSnackBar(
                     const         SnackBar(
                                content: Text('شكرا للمشاركة في الاستبيان'),
                                duration: Duration(seconds: 2),
                                backgroundColor: AppColor.primary,
                              ),
                            );
                          }

                          if (indexinkwll1.length == lengh) {
              
                                                          LocalNotificationService.showBasicNotification();


                          }
                          ;
                          Navigator.pop(
                            context,
                          );
                        }

                      },
                      child: Text(
                        "إرسال الأجوبة",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ),

              // ElevatedButton(
              //   style: ButtonStyle(
              //     backgroundColor: MaterialStateProperty.all(AppColor.primary),
              //   ),
              //   onPressed: () {
              //     ref.read(genderProvider(index).notifier).state = true;
              //     final insertDataid = ref.read(insertDataProvideridqushn);
              //     insertDataid(questionList['id'], id);
              //     Navigator.pop(
              //       context,
              //     );
              //   },
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Center(
              //       child: Text(
              //         "ارسال المعلومات ",
              //         style: TextStyle(
              //           fontSize: 15,
              //           color: Colors.black,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}