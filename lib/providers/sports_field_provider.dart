import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mce_test/database/mce_database.dart';

class SportsfieldProvider extends ChangeNotifier {

  
  List<Sportsfield> sportsfieldsList = <Sportsfield>[];

  Sportsfield? sportsfieldSelected;

  SportsfieldProvider() {
    setTableSportsfields();
  }

  setTableSportsfields() async {
    try{
      sportsfieldsList = await mceDatabase.select(mceDatabase.sportsfields).get();
      
      notifyListeners();

      if(sportsfieldsList.isNotEmpty) return;
    
      await mceDatabase.into(mceDatabase.sportsfields).insert( SportsfieldsCompanion.insert(nameSportsfields: 'A'));
      await mceDatabase.into(mceDatabase.sportsfields).insert( SportsfieldsCompanion.insert(nameSportsfields: 'B'));
      await mceDatabase.into(mceDatabase.sportsfields).insert( SportsfieldsCompanion.insert(nameSportsfields: 'C'));
    }
    catch(error){
      debugPrint(error.toString());
    }
       


    sportsfieldsList = await mceDatabase.select(mceDatabase.sportsfields).get();

    notifyListeners();
  }

  setSportFieldSelected(Sportsfield sportsfield){
    sportsfieldSelected = sportsfield;
    notifyListeners();
  }

}