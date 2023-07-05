import 'package:flutter/material.dart';
import 'package:mce_test/database/mce_database.dart';
import 'package:mce_test/providers/sports_field_provider.dart';
import 'package:mce_test/providers/schedules_provider.dart';
import 'package:mce_test/screens/schedule_sports_field_screen.dart';
import 'package:mce_test/widget/date_widget.dart';
import 'package:mce_test/widget/empty_widget.dart';
import 'package:mce_test/widget/loading_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final scheduleProvider = Provider.of<ScheduleProvider>(context);

    /* scheduleProvider.getSchedules(); */

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Listado de agenda de canchas'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 5,),
            TextButton(   
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                padding: MaterialStateProperty.all(const EdgeInsets.all(15))
              ),             
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ScheduleSportsFieldScreen())),
              child: const Text(
                'Agendar cancha',
                style: TextStyle(
                  color: Colors.white
                ),
              )
            ),
            const SizedBox(height: 10,),
            SizedBox(
              
              child: Column(
                children: [
                  const Text(
                    'Canchas Agendadas',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.75,
                    child: SingleChildScrollView(
                      child: StreamBuilder(
                        stream: scheduleProvider.suggestionStream,
                        builder: (_, AsyncSnapshot<List<Schedule>> snapshot) {
                         
                          if( !snapshot.hasData ) {
                            return const LoadingWidget();
                          }
                    
                          if(snapshot.data!.isEmpty){
                            return const EmptyWidget();
                          }
                    
                          else{
                            final List<Schedule> schedules = snapshot.data!;
                                
                            return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              
                              scrollDirection: Axis.vertical,
                              itemCount: schedules.length,
                              itemBuilder: (_, int index) {
                                return Container(
                                  margin: const EdgeInsets.symmetric(vertical: 10),
                                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                  color: Colors.amber,
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('Nombre de la cancha:'),
                                          Text(schedules[index].nameSportsfields)
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('Fecha agendada:'),
                                          DateWidget(
                                            day: schedules[index].schedulingDate.day,
                                            month: schedules[index].schedulingDate.month,
                                            year: schedules[index].schedulingDate.year,
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('Nombre de la persona que agendo:'),
                                          Text(schedules[index].schedulerPerson)
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('Porcentaje de lluvia:'),
                                          Text(schedules[index].percentageRain)
                                        ],
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          scheduleProvider.deleteSchedules(schedules[index], context);
                                        },
                                        child: const Text('Eliminar agenda')
                                      ),
                    
                    
                                    ],
                                  ),
                                );
                              }
                            );
                          }
                          
                          
                          
                        }
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      /* body: StreamBuilder(
        stream: scheduleProvider.suggestionStream,
        builder: (_, AsyncSnapshot<List<Schedule>> snapshot) {
           if( !snapshot.hasData ) return const EmptyWidget();

           final List<Schedule> schedules = snapshot.data!;

           return ListView.builder(
            itemCount: schedules.length,
            itemBuilder: (_, int index) {
              return ListTile(
                title: Text(schedules[index].nameSportsfields),
              );
            }
           );
        }
      ), */
    );
  }
}