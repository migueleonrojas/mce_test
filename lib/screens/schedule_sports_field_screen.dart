import 'package:flutter/material.dart';
import 'package:mce_test/database/mce_database.dart';
import 'package:mce_test/providers/schedules_provider.dart';
import 'package:mce_test/providers/sports_field_provider.dart';
import 'package:mce_test/providers/schedules_provider.dart';
import 'package:mce_test/widget/date_widget.dart';
import 'package:provider/provider.dart';

class ScheduleSportsFieldScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final sportsfieldProvider = Provider.of<SportsfieldProvider>(context);
    final scheduleProvider = Provider.of<ScheduleProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Agende su cancha'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              
              SizedBox(

                width: MediaQuery.of(context).size.width * 0.80,
                child: DropdownButtonFormField(

                  decoration: const InputDecoration(
                    labelText: 'Nombre de la cancha a agendar',
                    prefixIcon: Icon(Icons.sports)
                  ),
                  value: sportsfieldProvider.sportsfieldSelected ?? sportsfieldProvider.sportsfieldsList.first,
                  items: sportsfieldProvider.sportsfieldsList.map<DropdownMenuItem<Sportsfield>>((Sportsfield value) {
                    return DropdownMenuItem<Sportsfield>(
                      value: value,
                      child: Text(value.nameSportsfields),
                    );
                  }).toList(),     
                  onChanged: (Sportsfield? value) {
                    sportsfieldProvider.setSportFieldSelected(value!);
                  },
                  
                ),
              ),
              Column(
                children: [
                  DateWidget( 
                    day: scheduleProvider.schedulingDate.day,
                    month: scheduleProvider.schedulingDate.month,
                    year: scheduleProvider.schedulingDate.year,
                  ),
                  const SizedBox(height: 10,),
                  ElevatedButton(
                    child: const Text('Seleccione la fecha agendamiento de la cancha'),
                    onPressed: () {
                      scheduleProvider.checkSchedulingDate(context);
                    }, 
                  )

                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.80,
                child: TextFormField(
                  controller: scheduleProvider.schedulerPerson,
                  decoration: const InputDecoration(
                    hintText: 'Nombre de la persona que agenda',
                    labelText:'Nombre de la persona que agenda'
                  ),
                ),
              ),
              ElevatedButton(
                child: const Text('Agendar cancha'),
                onPressed: () {
                  scheduleProvider.scheduleSportsField(
                    nameSportField:  sportsfieldProvider.sportsfieldSelected == null 
                      ? sportsfieldProvider.sportsfieldsList.first.nameSportsfields
                      :sportsfieldProvider.sportsfieldSelected!.nameSportsfields,
                    context: context
                  );
        

                },
              )
              
            ],
          ),
        ),
      ),
    );
  }

}