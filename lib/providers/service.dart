import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_notification/models/question_model.dart';
import 'package:my_notification/providers/insert_provider.dart';

final userServiceProvider = Provider<UserService>((ref) {
  return UserService(ref);
});

final useridServiceProvider = Provider<UseridService>((ref) {
  return UseridService(ref);
});

final staticProvider =
    FutureProvider.family<List<Forms>, String>((ref, type) async {
  final statication = ref.watch(staticServiceProvider);
  return statication.statications(type);
});

final chekboxServiceProvider = Provider<Chekboxprov>((ref) {
  return Chekboxprov(ref);
});
