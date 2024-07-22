
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_notification/providers/general_provider.dart';

final insertIdUserWhoAnswerOnQuestion = Provider((ref) {
  final supabase = ref.watch(supabaseProvider);

  Future insertIdUser(int questionId, int userId) async {
    final response = await supabase
        .from('questions')
        .select('id_of_users')
        .eq('id', questionId)
        .single();

    final data = response;
    List<int> idOfUsers = List<int>.from(data['id_of_users'] ?? []);
    if (!idOfUsers.contains(userId)) {
      idOfUsers.add(userId);
    }

    // final updateResponse = await supabase
    //     .from('questions')
    //     .update({'id_of_users': idOfUsers}).eq('id', questionId);
  }

  return insertIdUser;
});
