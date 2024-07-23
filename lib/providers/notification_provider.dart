import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_notification/models/signup_model.dart';
import 'package:my_notification/notifications/noti_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final insertedRecordIdProvider = StateProvider<UserModel?>((ref) => null);
class QuestionsNotifier extends StateNotifier<List<List<String>>> {
  QuestionsNotifier() : super([]);

  void updateQuestions(List<List<String>> newQuestions) {
    if (state.isNotEmpty && state.length != newQuestions.length) {
      onLengthChanged();
    }
    state = newQuestions;
  }

  void onLengthChanged() {
    print('Questions length has changed');
    LocalNotificationService.showBasicNotificationWhenAddForm();
  }
}


final questionsNotifierProvider = StateNotifierProvider<QuestionsNotifier, List<List<String>>>((ref) {
  return QuestionsNotifier();
});

final fetchQuestionsProvider = StreamProvider.family<List<Map<String, dynamic>>, String>((ref, typeUser) async* {
  final supabase = Supabase.instance.client;
  List<List<String>> questions;

  while (true) {
    try {
      final questionResponse = await supabase
          .from('questions')
          .select('form, id')
          .eq('type', typeUser);

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
