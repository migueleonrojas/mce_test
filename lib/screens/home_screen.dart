import 'package:flutter/material.dart';
import 'package:mce_test/database/mce_database.dart';
import 'package:mce_test/providers/sports_field_provider.dart';
import 'package:mce_test/providers/schedules_provider.dart';
import 'package:mce_test/screens/schedule_sports_field_screen.dart';
import 'package:mce_test/widget/empty_widget.dart';
import 'package:mce_test/widget/loading_widget.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final scheduleProvider = Provider.of<ScheduleProvider>(context);

    

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
                                  
                                  decoration: BoxDecoration(

                                    border: Border.all(color: Colors.blueAccent,width: 3),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(5.0)
                                    ),
                                  ),
                                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                  
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Nombre de la cancha:',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            schedules[index].nameSportsfields,
                                            style :const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Fecha agendada:',
                                            style : TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(DateFormat('dd/MM/yyyy hh:mm a').format(schedules[index].schedulingDate))
                                          
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Nombre de la persona que agendo:',
                                            style : TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                           Flexible(
                                             child: Text(
                                              schedules[index].schedulerPerson,
                                              textAlign: TextAlign.right,
                                              
                                              style : const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                                                                     ),
                                           )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Porcentaje de lluvia:',
                                            style : TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Flexible(
                                            child: Text(
                                              schedules[index].percentageRain,
                                              textAlign: TextAlign.right,
                                              style : const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      ElevatedButton(
                                        
                                        onPressed: () {
                                          scheduleProvider.deleteSchedules(schedules[index], context);
                                        },
                                        child: const Text('Eliminar agendación de cancha')
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