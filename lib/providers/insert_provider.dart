import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:my_notification/models/question_model.dart';
import 'package:my_notification/models/signup_model.dart';
import 'package:my_notification/views/forms.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabaseProvider = Provider<SupabaseClient>((ref) {
  return GetIt.instance<SupabaseClient>();
});

abstract class Service {
  late SupabaseClient supabase;

  Future<UserModel> insertUser(UserModel userModel);
  Future insertIdUser(int questionId, int userId);
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
}

final userServiceProvider = Provider<UserService>((ref) {
  return UserService(ref);
});

final useridServiceProvider = Provider<UseridService>((ref) {
  return UseridService(ref);
});

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
    print(response);

    List<Forms> data_static =
        response.map((map) => Forms.fromMap(map)).toList();

    print("lkljaslkkkkkkkkkkk");
    print(data_static);
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
}

final staticServiceProvider = Provider<Statication>((ref) {
  return Statication(ref);
});

final staticProvider =
    FutureProvider.family<List<Forms>, String>((ref, type) async {
  final statication = ref.watch(staticServiceProvider);
  return statication.statications(type);
});

class Chekboxprov extends Service {
  Chekboxprov(this.ref) {
    supabase = ref.watch(supabaseProvider);
  }

  final Ref ref;
  late final supabase;

  @override
  Future chek(int questionId, int userId,int index) async {
    final response = await supabase
        .from('questions')
        .select('id_of_users')
        .eq('id', questionId)
        .single();

    final data = response;
    List<int> idOfUsers = List<int>.from(data['id_of_users'] ?? []);
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
}

final chekboxServiceProvider = Provider<Chekboxprov>((ref) {
  return Chekboxprov(ref);
});
