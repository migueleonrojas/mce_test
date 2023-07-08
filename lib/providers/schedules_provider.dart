import 'dart:async';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:mce_test/constants.dart';
import 'package:mce_test/database/mce_database.dart';
import 'package:mce_test/models/precipitation_response_model.dart';
import 'package:mce_test/widget/alert_widget.dart';
import 'package:mce_test/widget/confirm_widget.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';


class ScheduleProvider extends ChangeNotifier {

  
  ScheduleProvider(){
    getSchedules();
  }

  

  final StreamController<List<Schedule>> _suggestionStreamControler = StreamController.broadcast();

  Stream<List<Schedule>> get suggestionStream => _suggestionStreamControler.stream;

  DateTime schedulingDate = DateTime.now();

  String percentageRain = "";

  bool isDateSelected = false;



  final schedulerPerson = TextEditingController();

  Future<String> getResponseApi(String endpoint, DateTime date) async {
    
    
    final url = Uri.https(Constants.base_url, endpoint,{
      'lat': '10.4686871',
      'lng': '-67.0551851',
      'params':'precipitation',
      'start': date.toIso8601String(),
      'end': date.toIso8601String()
    });

    final response = await http.get(url, headers: {
      "Authorization": Constants.api_key
    });
    
    return response.body;
  }
  
  
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

  
  checkSchedulingDate(BuildContext context, String nameSportField) async {
    List<Schedule> listSchedules = [];

    DateTime? dateSelected = await showDatePicker(context: context, 
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDate: schedulingDate, 
      firstDate: DateTime(1900), 
      lastDate: DateTime(2100),
    );

    if(dateSelected == null) return;
    
    TimeOfDay? hourAndMinute = await showTimePicker(
      context: context, 
      initialTime: TimeOfDay(hour:  DateTime.now().hour, minute: DateTime.now().minute),
    );
    
    if(hourAndMinute == null) return;
    
    if(dateSelected.add(Duration(hours: hourAndMinute.hour, minutes: hourAndMinute.minute)).isBefore(DateTime.now())){
      if (context.mounted) {
        await showDialog(context:context, builder: (BuildContext context) => const AlertWidget(
          titleAlert: 'Fecha menor o igual a la actual',
          messageAlert: 'No puede agendar en una fecha menor o igual a la actual',
        ));
        isDateSelected = false;
        schedulingDate = DateTime.now();
        return;
      }

      return;

    }

    try{
      listSchedules = await (mceDatabase.select(mceDatabase.schedules)
        ..where((tbl) => tbl.schedulingDate.date.equals(DateFormat('yyyy-MM-dd').format(dateSelected))  )
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
        isDateSelected = false;
        schedulingDate = DateTime.now();
        return;
      }
        
      return;
    }
    
    schedulingDate = dateSelected.add(Duration(hours: hourAndMinute.hour, minutes: hourAndMinute.minute));
    
    notifyListeners();
    final jsonData = await getResponseApi("/v2/weather/point", dateSelected.add(Duration(hours: hourAndMinute.hour, minutes: hourAndMinute.minute)));
    
    try{
      
      final precipitationResponse = Precipitationresponse.fromJson(jsonData);
      percentageRain = '${((precipitationResponse.hours[0].precipitation.noaa * 100)/30).toStringAsFixed(2)}%';
      isDateSelected = true;
      notifyListeners();

    }
    catch(error){
    
      percentageRain = 'Información no disponible';
      isDateSelected = true;
      notifyListeners();
      debugPrint(error.toString());
    }
   

    
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

    FocusScope.of(context).requestFocus(FocusNode());
    List<Schedule> listSchedules = [];

    if(!isDateSelected){
      await showDialog(context:context, builder: (BuildContext context) => const AlertWidget(
        titleAlert: 'Debe seleccionar la fecha',
        messageAlert: 'Debe seleccionar una fecha',
      ));
      
      return;
    }
    
    if(schedulerPerson.text.isEmpty){
      await showDialog(context:context, builder: (BuildContext context) => const AlertWidget(
        titleAlert: 'Campo vacio',
        messageAlert: 'Debe indicar un nombre de la persona que agenda la cancha',
      ));
      
      return;
    }

    if(schedulerPerson.text.length > 20){
      await showDialog(context:context, builder: (BuildContext context) => const AlertWidget(
        titleAlert: 'Campo nombre',
        messageAlert: 'Debe indicar el nombre de la persona que agenda con máximo de 20 letras',
      ));
      
      return;
    }

    if(schedulingDate.isBefore(DateTime.now())){

      await showDialog(context:context, builder: (BuildContext context) => const AlertWidget(
        titleAlert: 'Fecha menor o igual a la actual',
        messageAlert: 'No puede agendar en una fecha menor o igual a la actual',
      ));

      return;

    }

    
    try{
      listSchedules = await (mceDatabase.select(mceDatabase.schedules)
        ..where((tbl) => tbl.schedulingDate.date.equals(DateFormat('yyyy-MM-dd').format(schedulingDate))   )
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
        percentageRain: percentageRain
        )
      );
      
      if (context.mounted) {
         await showDialog(context:context, builder: (BuildContext context) => const AlertWidget(
          titleAlert: 'Cancha agendada',
          messageAlert: 'La cancha se agendo con exito',
        ));
        getSchedules();
        resetValues();
      }
      

    }
    catch(error){
      debugPrint(error.toString());
    }
    



  }

  resetValues() {
    schedulingDate = DateTime.now();
    percentageRain = "";
    schedulerPerson.clear();
    isDateSelected = false;
  }
  
  
}