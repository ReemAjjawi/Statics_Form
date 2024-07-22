import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class Service {
 late Supabase supabase;

  getData();
}


class A extends Service {
  @override
  getData() {
    // TODO: implement getData
    throw UnimplementedError();
  }

 final temp = Provider<A>((ref) {
  return A();
});
}






                // core.get<SharedPreferences>().getStringList('peoples') ??
