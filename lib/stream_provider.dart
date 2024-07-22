import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_notification/notifications/noti_service.dart';
import 'package:my_notification/models/signup_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


final insertedRecordIdProvider = StateProvider<UserModel?>((ref) => null);

