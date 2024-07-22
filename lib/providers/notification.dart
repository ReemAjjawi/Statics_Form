import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_notification/models/signup_model.dart';
import 'package:my_notification/notifications/noti_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final insertedRecordIdProvider = StateProvider<UserModel?>((ref) => null);

class QuestionsNotifier extends StateNotifier<List<List<String>>> {
  QuestionsNotifier() : super([]);

  void updateQuestions(List<List<String>> newQuestions) {
    if (state.length != 0 && state.length != newQuestions.length) {
      onLengthChanged();
    }
    state = newQuestions;
  }

  void onLengthChanged() {
    print('Questions length has changed!');
    LocalNotificationService.showBasicNotification();
  }
}

final questionsNotifierProvider =
    StateNotifierProvider<QuestionsNotifier, List<List<String>>>((ref) {
  return QuestionsNotifier();
});

final fetchQuestionsProvider =
    StreamProvider.family<List<Map<String, dynamic>>, int>(
        (ref, userId) async* {
  final supabase = Supabase.instance.client;
  var questions;

  while (true) {
    try {
      var userResponse =
          await supabase.from('users').select('age').eq('id', userId).single();

      var userAge = userResponse != null ? userResponse['age'] : null;

      if (userAge != null) {
        var questionResponse = await supabase
            .from('questions')
            .select('questions , id')
            .eq('age', userAge);

        questions = questionResponse
            .map<List<String>>((item) => List<String>.from(item['questions']))
            .toList();

        ref.read(questionsNotifierProvider.notifier).updateQuestions(questions);
        yield questionResponse;
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
