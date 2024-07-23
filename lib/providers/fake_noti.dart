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
    StreamProvider.family<List<Map<String, dynamic>>, String>(
        (ref, typyuser) async* {
  final supabase = Supabase.instance.client;
  var questions;
  while (true) {
    try {
        var questionResponse = await supabase
            .from('questions')
            .select('questions , id')
            .eq('type', typyuser);

        questions = questionResponse
            .map<List<String>>((item) => List<String>.from(item['questions']))
            .toList();

        ref.read(questionsNotifierProvider.notifier).updateQuestions(questions);
        yield questionResponse;
      
    } catch (error) {
      print('Error fetching data: $error');
      yield [];
    }

    await Future.delayed(Duration(seconds: 5));
  }
});
