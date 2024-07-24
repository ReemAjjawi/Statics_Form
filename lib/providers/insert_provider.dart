import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:my_notification/models/question_model.dart';
import 'package:my_notification/models/signup_model.dart';
import 'package:my_notification/providers/provider.dart';
import 'package:my_notification/views/forms.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class Service {
  late SupabaseClient supabase;

  Future<UserModel> insertUser(UserModel userModel);
  Future insertIdUser(int questionId, int userId);
  Future chek(int questionId, int userId, int index);
  Future<List<Forms>> statications(String type);
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

  @override
  Future chek(int questionId, int userId, int index) {
    // TODO: implement chek
    throw UnimplementedError();
  }

  @override
  Future<List<Forms>> statications(String type) {
    // TODO: implement statications
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
        .select('id_of_users')
        .eq('id', questionId)
        .single();

    final data = response;
    List<int> idOfUsers = List<int>.from(data['id_of_users'] ?? []);
    if (!idOfUsers.contains(userId)) {
      idOfUsers.add(userId);
    }

    final updateResponse = await supabase
        .from('questions')
        .update({'id_of_users': idOfUsers}).eq('id', questionId);

    return insertIdUser;
  }

  @override
  Future<UserModel> insertUser(UserModel userModel) {
    // TODO: implement insertUser
    throw UnimplementedError();
  }

  @override
  Future chek(int questionId, int userId, int index) {
    // TODO: implement chek
    throw UnimplementedError();
  }

  @override
  Future<List<Forms>> statications(String type) {
    // TODO: implement statications
    throw UnimplementedError();
  }
}

class Statication extends Service {
  Statication(this.ref) {
    supabase = ref.watch(supabaseProvider);
  }

  final Ref ref;

  Future<List<Forms>> statications(String type) async {
    final response = await supabase
        .from('questions')
        .select('questions ,id,id_of_users')
        .eq('type', type);

    List<Forms> data_static =
        response.map((map) => Forms.fromMap(map)).toList();

    return data_static;
  }

  @override
  Future insertIdUser(int questionId, int userId) {
    // TODO: implement insertIdUser
    throw UnimplementedError();
  }

  @override
  Future<UserModel> insertUser(UserModel userModel) {
    // TODO: implement insertUser
    throw UnimplementedError();
  }

  @override
  Future chek(int questionId, int userId, int index) {
    // TODO: implement chek
    throw UnimplementedError();
  }
}

final staticServiceProvider = Provider<Statication>((ref) {
  return Statication(ref);
});

class Chekboxprov extends Service {
  Chekboxprov(this.ref) {
    supabase = ref.watch(supabaseProvider);
  }

  final Ref ref;
  late final supabase;

  @override
  Future chek(int questionId, int userId, int index) async {
    final response = await supabase
        .from('questions')
        .select('id_of_users')
        .eq('id', questionId)
        .single();

    List<int> idOfUsers = List<int>.from(response['id_of_users'] ?? []);

    if (idOfUsers.contains(userId)) {
      ref.read(checkBoxProvider(index).notifier).state = true;
    } else {
      ref.read(checkBoxProvider(index).notifier).state = false;
    }
  }

  @override
  Future<void> insertIdUser(int questionId, int userId) {
    // TODO: implement insertIdUser
    throw UnimplementedError();
  }

  @override
  Future<UserModel> insertUser(UserModel userModel) {
    // TODO: implement insertUser
    throw UnimplementedError();
  }

  @override
  Future<List<Forms>> statications(String type) {
    // TODO: implement statications
    throw UnimplementedError();
  }
}
