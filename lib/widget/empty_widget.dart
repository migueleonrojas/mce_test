import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: MediaQuery.of(context).size.height * 0.20,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'No se han agendado canchas',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
            ),
            Icon(Icons.schedule, color: Colors.black38, size: 130,),
          ],
        ),
      ),
    );
  }
}