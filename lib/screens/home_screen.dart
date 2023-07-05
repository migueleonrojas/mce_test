import 'package:flutter/material.dart';
import 'package:mce_test/database/mce_database.dart';
import 'package:mce_test/providers/preferences_provider.dart';
import 'package:mce_test/providers/schedules_provider.dart';
import 'package:mce_test/widget/empty_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final scheduleProvider = Provider.of<ScheduleProvider>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: StreamBuilder(
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
        )
      ),
    );
  }
}