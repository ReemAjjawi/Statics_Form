
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

GetIt core = GetIt.instance;



setup()async{
  core.registerSingleton<SupabaseClient>(Supabase.instance.client);
}
