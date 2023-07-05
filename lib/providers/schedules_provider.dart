import 'dart:async';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:mce_test/database/mce_database.dart';
import 'package:mce_test/widget/alert_widget.dart';
import 'package:mce_test/widget/confirm_widget.dart';


class ScheduleProvider extends ChangeNotifier {

  
  ScheduleProvider(){
    getSchedules();
  }

  

  final StreamController<List<Schedule>> _suggestionStreamControler = StreamController.broadcast();

  Stream<List<Schedule>> get suggestionStream => _suggestionStreamControler.stream;

  DateTime schedulingDate = DateTime.now();

  final schedulerPerson = TextEditingController();
  
  
  getSchedules() async {

    List<Schedule>? scheduleList;
    try{

      scheduleList = await (
        mceDatabase.select(mceDatabase.schedules)
        ..orderBy([(u) => OrderingTerm(expression: u.schedulingDate, mode: OrderingMode.asc),])
      ).get();
      if(scheduleList.isEmpty) {
        _suggestionStreamControler.add(scheduleList);
        return;
      };
    
      _suggestionStreamControler.add(scheduleList);
    }
    catch(error) {
      debugPrint(error.toString());
    }

  }

  
  checkSchedulingDate(BuildContext context) async {
    DateTime? dateSelected = await showDatePicker(context: context, 
      initialDate: schedulingDate, 
      firstDate: DateTime(1900), 
      lastDate: DateTime(2100)
    );

    if(dateSelected == null) return;

    schedulingDate = dateSelected;
    notifyListeners();
  }

  deleteSchedules(Schedule schedule, BuildContext context) async {

    bool result = await showDialog(context:context, builder: (BuildContext context) => const ConfirmWidget(
        titleAlert: 'Elimnar',
        messageAlert: '¿Estás seguro de eliminar esta agenda de cancha?',
      )) ?? false;

    if(!result) return;

    try{
      await mceDatabase.schedules.deleteWhere((tbl) => tbl.id.equals(schedule.id));
      getSchedules();
    }
    catch(error){
      debugPrint(error.toString());
    }


  }

  scheduleSportsField({
    required String nameSportField,
    required BuildContext context
  }) async {

    List<Schedule> listSchedules = [];
    
    if(schedulerPerson.text.isEmpty){
      await showDialog(context:context, builder: (BuildContext context) => const AlertWidget(
        titleAlert: 'Campo vacio',
        messageAlert: 'Debe indicar un nombre de la persona que agenda la cancha',
      ));
      
      return;
    }

    if(schedulingDate.isBefore(DateTime.now())){

      await showDialog(context:context, builder: (BuildContext context) => const AlertWidget(
        titleAlert: 'Fecha menor a la actual',
        messageAlert: 'No puede agendar en una fecha menor a la actual',
      ));

      return;

    }

    
    /* print({
      nameSportField,
      schedulingDate,
      schedulerPerson.text
    }); */

    try{
      listSchedules = await (mceDatabase.select(mceDatabase.schedules)
        ..where((tbl) => tbl.schedulingDate.equals(schedulingDate))
        ..where((tbl) => tbl.nameSportsfields.equals(nameSportField))
      )
      .get();
      
      
      
      
    }
    catch(error){
      debugPrint(error.toString());

    }
    
    if(listSchedules.length > 2){
      if (context.mounted) {
        await showDialog(context:context, builder: (BuildContext context) => const AlertWidget(
          titleAlert: 'Agenda agotada',
          messageAlert: 'Solo se puede agendar en un día 3 veces como máximo',
        ));
        return;
      }
        
      return;
    }
    
    try{
      

      await mceDatabase.into(mceDatabase.schedules).insert( SchedulesCompanion.insert(
        nameSportsfields: nameSportField, 
        schedulingDate: schedulingDate, 
        schedulerPerson: schedulerPerson.text, 
        percentageRain: 'percentageRain')
      );
      
      if (context.mounted) {
         await showDialog(context:context, builder: (BuildContext context) => const AlertWidget(
          titleAlert: 'Cancha agendada',
          messageAlert: 'La cancha se agendo con exito',
        ));
        getSchedules();
        schedulerPerson.clear();

      }
      

    }
    catch(error){
      debugPrint(error.toString());
    }
    



  }


  
  
}