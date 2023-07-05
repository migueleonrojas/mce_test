import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mce_test/database/mce_database.dart';

class PreferencesProvider extends ChangeNotifier {

  
  List<Sportsfield> sportsfieldsList = <Sportsfield>[];

  PreferencesProvider() {
    setTableSportsfields();
  }

  setTableSportsfields() async {

    sportsfieldsList = await mceDatabase.select(mceDatabase.sportsfields).get();
    notifyListeners();
    if(sportsfieldsList.isNotEmpty) return;
 
    await mceDatabase.into(mceDatabase.sportsfields).insert( SportsfieldsCompanion.insert(nameSportsfields: 'A'));
    await mceDatabase.into(mceDatabase.sportsfields).insert( SportsfieldsCompanion.insert(nameSportsfields: 'B'));
    await mceDatabase.into(mceDatabase.sportsfields).insert( SportsfieldsCompanion.insert(nameSportsfields: 'C'));   
    sportsfieldsList = await mceDatabase.select(mceDatabase.sportsfields).get();

    notifyListeners();
  }

}