
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_notification/noti_service.dart';
import 'package:my_notification/signup_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabaseProvider=Provider((ref) => Supabase.instance.client);
final chatStreamProvider=StreamProvider.autoDispose((ref) {final supabase=ref.watch(supabaseProvider);

return supabase.from('questions').stream(primaryKey: ['*']);
});
final insertedRecordIdProvider = StateProvider<UserModel?>((ref) => null);

final insertDataProvider = Provider((ref) {
 final supabase = ref.watch(supabaseProvider);


  Future<UserModel> insertData(UserModel userModel) async {
    final response = await supabase
        .from('users')
        .insert({'name': userModel.name, 'age': userModel.age})
        .select()
        .single();

    if (response!= null) {
      print("Insertion failed or no data returned");
    
    }

    final insertedRecord = response as Map<String, dynamic>;
    final id = insertedRecord['id'];
    print("Inserted record ID: $id");

    return UserModel(name: userModel.name, age: userModel.age, id: id);
  }

  return insertData;
});

// final fetchQuestionsProvider = StreamProvider.family<List<List<String>>, int>((ref, userId) async* {
//  final supabase = ref.watch(supabaseProvider);
//   var questions;
//   while (true) {
//     try {
//       var userResponse = await supabase
//           .from('users')
//           .select('age')
//           .eq('id', userId)
//           .single();

//       var userAge = userResponse != null ? userResponse['age'] : null;

//       if (userAge != null) {
//         var questionResponse = await supabase
//             .from('questions')
//             .select('questions')
//             .eq('age', userAge);
            

        
//           questions = questionResponse.map<List<String>>((item) => List<String>.from(item['questions'])).toList();
//           yield questions;
        
//       } else {
//         yield [];
//       }
//     } catch (error) {
//       print('Error fetching data: $error');
//       yield [];
//     }

//     await Future.delayed(Duration(seconds: 5)); 
//   }
// });

class QuestionsNotifier extends StateNotifier<List<List<String>>> {
  QuestionsNotifier() : super([]);

  void updateQuestions(List<List<String>> newQuestions) {
    if (state.length !=0 && state.length != newQuestions.length) {
      onLengthChanged();
    }
    state = newQuestions;
  }

  void onLengthChanged() {
    
    print('Questions length has changed!');
              LocalNotificationService.showBasicNotification();

  }
}

final questionsNotifierProvider = StateNotifierProvider<QuestionsNotifier, List<List<String>>>((ref) {
  return QuestionsNotifier();
});

final fetchQuestionsProvider = StreamProvider.family<List<List<String>>, int>((ref, userId) async* {
  final supabase = Supabase.instance.client;
  var questions;
  while (true) {
    try {
      var userResponse = await supabase
          .from('users')
          .select('age')
          .eq('id', userId)
          .single();

      var userAge = userResponse != null ? userResponse['age'] : null;

      if (userAge != null) {
        var questionResponse = await supabase
            .from('questions')
            .select('questions')
            .eq('age', userAge);

        questions = questionResponse.map<List<String>>((item) => List<String>.from(item['questions'])).toList();
        ref.read(questionsNotifierProvider.notifier).updateQuestions(questions);
        yield questions;
      } else {
        yield [];
      }
    } catch (error) {
      print('Error fetching data: $error');
      yield [];
    }

    await Future.delayed(Duration(seconds: 5));
  }
});
