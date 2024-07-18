import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_notification/color.dart';
import 'package:my_notification/noti_service.dart';
import 'package:my_notification/question.dart';
import 'package:my_notification/signup_model.dart';
import 'package:my_notification/stream_provider.dart';
import 'package:my_notification/tt.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await LocalNotificationService.init();
  await Supabase.initialize(
    url: 'https://pehikzmkdmfcatmkceyg.supabase.co',
    anonKey:'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBlaGlrem1rZG1mY2F0bWtjZXlnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjA4OTAyNTAsImV4cCI6MjAzNjQ2NjI1MH0.n7UUBLmk3y6jqiiiAky3HO2v2I4yxCvKL1VqyGooX7Y'  );
  
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        home:SignUpSecreen(),
      ),
    );
  }
}




class SignUpSecreen extends ConsumerWidget {
    final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref)  {
        final userModel = ref.watch(insertedRecordIdProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 33, 229, 243),
        elevation: 0,
      ),
      backgroundColor: Color(0xFFffffff),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: Form(
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
                        fontSize: 30,
                  color:AppColor.primary,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'الإسم :',  enabledBorder: OutlineInputBorder(
                     borderSide: BorderSide(
                  color:AppColor.primary
                )
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
color:AppColor.primary                )
              )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "البريد الإلكتروني :",  enabledBorder: OutlineInputBorder(
                     borderSide: BorderSide(
                  color:AppColor.primary
                )
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
color:AppColor.primary                )
              )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(labelText: "كلمة السر :",enabledBorder: OutlineInputBorder(
                             borderSide: BorderSide(
                  color: Color.fromARGB(255, 33, 229, 243)
                )
                      ),focusedBorder: OutlineInputBorder(
                             borderSide: BorderSide(
                  color: Color.fromARGB(255, 33, 229, 243)
                )
                      )),
                      
                    ),
                    SizedBox(
                      height: 20,
                    ),
            
                    SizedBox(
                      height: 20,
                    ),

     TextFormField(
      
              controller: nameController,
              decoration: const InputDecoration(labelText: 'الإسم',
              enabledBorder: OutlineInputBorder(
                     borderSide: BorderSide(
                  color:AppColor.primary
                )
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
color:AppColor.primary                )
              )),
              
            ),
             SizedBox(
                      height: 20,
                    ),

            TextField(
              controller: ageController,
              decoration: InputDecoration(labelText: 'العمر',  enabledBorder: OutlineInputBorder(
                     borderSide: BorderSide(
                  color:AppColor.primary
                )
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
color:AppColor.primary                )
              )),
              keyboardType: TextInputType.number,
            ),


               
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: ElevatedButton(                      style: ButtonStyle(    backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 33, 229, 243)),
),    
                              child: Text(
                              " التالي ",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () {
                          
                            },
                      
                          ),
                        ),
                       
                        //   Icon(Icons.arrow_right_outlined),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),

   ElevatedButton(
    style:   ButtonStyle(
    backgroundColor: MaterialStateProperty.all(AppColor.primary),

                  )     
                  ,         onPressed: () async {
                final name = nameController.text;
                final age = int.tryParse(ageController.text);

                if (name.isNotEmpty && age != null) {
                  try {
                    final insertData = ref.read(insertDataProvider);
                    final user = await insertData(UserModel(name: name, age: age, id: 0));
                  //  ref.read(insertedRecordIdProvider.notifier).state = user;
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> QuestionsPage(id:user.id)));
                  } catch (e) {
                    print(e);
                  }
                }
              },
              child:Text(
                        "تسجيل المعلومات ",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
            ),
            SizedBox(height: 20),
            Text(userModel != null ? 'Inserted record ID: ${userModel.id}' : 'No record inserted yet'),
         
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






































class HomePage extends ConsumerWidget {
  HomePage({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userModel = ref.watch(insertedRecordIdProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Insert Data Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: ageController,
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final name = nameController.text;
                final age = int.tryParse(ageController.text);

                if (name.isNotEmpty && age != null) {
                  try {
                    final insertData = ref.read(insertDataProvider);
                    final user = await insertData(UserModel(name: name, age: age, id: 0));
                  //  ref.read(insertedRecordIdProvider.notifier).state = user;
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> QuestionsPage(id:user.id)));
                  } catch (e) {
                    print(e);
                  }
                }
              },
              child: Text('Insert Data'),
            ),
            SizedBox(height: 20),
            Text(userModel != null ? 'Inserted record ID: ${userModel.id}' : 'No record inserted yet'),
          ],
        ),
      ),
    );
  }
}
