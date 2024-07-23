
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:my_notification/providers/general_provider.dart';
// import 'package:my_notification/models/signup_model.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';


// final insertUserProvider = Provider((ref) {
//   final supabase = ref.watch(supabaseProvider);

//   Future<UserModel> insertUser(UserModel userModel) async {
//     final response = await supabase
//         .from('users')
//         .insert({'name': userModel.name, 'age': userModel.age})
//         .select()
//         .single();

  
//     final insertedRecord = response ;
//     final id = insertedRecord['id'];
//     print("Inserted record ID: $id");

//     return UserModel(name: userModel.name, age: userModel.age, id: id);
//   }

//   return insertUser;
// });
