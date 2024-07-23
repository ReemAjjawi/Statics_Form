import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:my_notification/models/signup_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


final supabaseProvider = Provider<SupabaseClient>((ref) {
  return GetIt.instance<SupabaseClient>();
});



abstract class Service {
  late SupabaseClient supabase;

  Future<UserModel> insertUser(UserModel userModel);
   Future insertIdUser( int questionId, int userId);

}

class UserService extends Service {
  UserService(this.ref) {
    supabase = ref.watch(supabaseProvider);
  }

  final Ref ref;

  @override
  Future<UserModel> insertUser(UserModel userModel) async {
    final response = await supabase
        .from('users')
        .insert({'name': userModel.name, 'age': userModel.age})
        .select()
        .single();

    final insertedRecord = response;
    final id = insertedRecord['id'];
    print("Inserted record ID: $id");

    return UserModel(name: userModel.name, age: userModel.age, id: id);
  }
  
  @override
  Future<UserModel> insertIdUser(int questionId, int userId) {
    // TODO: implement insertIdUser
    throw UnimplementedError();
  }
}

class UseridService extends Service {
  UseridService(this.ref) {
    supabase = ref.watch(supabaseProvider);
  }

  final Ref ref;

   @override
  Future insertIdUser(int questionId, int userId) async {
    final response = await supabase
        .from('questions')
        .select('idOfUsers')
        .eq('id', questionId)
        .single();

    final data = response;
    List<int> idOfUsers = List<int>.from(data['idOfUsers'] ?? []);
    if (!idOfUsers.contains(userId)) {
      idOfUsers.add(userId);
    }

    final updateResponse = await supabase
        .from('questions')
        .update({'idOfUsers': idOfUsers}).eq('id', questionId);
        
          return insertIdUser;
  }
  
  @override
  Future<UserModel> insertUser(UserModel userModel) {
    // TODO: implement insertUser
    throw UnimplementedError();
  }
  
}

final userServiceProvider = Provider<UserService>((ref) {
  return UserService(ref);
});


final useridServiceProvider = Provider<UseridService>((ref) {
  return UseridService(ref);
});




  
