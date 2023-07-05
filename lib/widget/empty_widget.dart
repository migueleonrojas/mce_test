import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   Center(
      child: Column(
        children: const [
          Text('No se han agendado canchas'),
          Icon(Icons.schedule, color: Colors.black38, size: 130,),
        ],
      ),
      /* child: Icon(Icons.schedule, color: Colors.black38, size: 130,), */
    );
  }
}