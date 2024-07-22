import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_notification/config/instance_app.dart';
import 'package:my_notification/notifications/noti_service.dart';

import 'package:my_notification/views/splash.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //setup();

  await LocalNotificationService.init();
  await Supabase.initialize(
      url: 'https://pehikzmkdmfcatmkceyg.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBlaGlrem1rZG1mY2F0bWtjZXlnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjA4OTAyNTAsImV4cCI6MjAzNjQ2NjI1MH0.n7UUBLmk3y6jqiiiAky3HO2v2I4yxCvKL1VqyGooX7Y');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: splashScreen(),
      ),
    );
  }
}
