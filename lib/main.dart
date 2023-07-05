import 'package:flutter/material.dart';
import 'package:mce_test/providers/schedules_provider.dart';
import 'package:mce_test/screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'providers/preferences_provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
       
        ChangeNotifierProvider(create: (_) => PreferencesProvider(), lazy: false,),
        ChangeNotifierProvider(create: (_) => ScheduleProvider(), lazy: false,)
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MCE TEST',
      home: HomeScreen()
    );
  }
}



