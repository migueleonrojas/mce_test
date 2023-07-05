import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mce_test/database/mce_database.dart';

class ScheduleProvider extends ChangeNotifier {

  final StreamController<List<Schedule>> _suggestionStreamControler = StreamController.broadcast();

  Stream<List<Schedule>> get suggestionStream => _suggestionStreamControler.stream;
  
  getSchedules() async {

    List<Schedule> sportsfieldList = await mceDatabase.select(mceDatabase.schedules).get();
    _suggestionStreamControler.add(sportsfieldList);
  }
  
}