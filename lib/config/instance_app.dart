
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


final GetIt core = GetIt.instance;

Future<void> setup() async {
  core.registerSingleton<SupabaseClient>(Supabase.instance.client);
}
