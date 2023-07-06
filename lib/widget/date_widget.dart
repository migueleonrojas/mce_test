import 'package:flutter/material.dart';


class DateWidget extends StatelessWidget {

  final int day;
  final int month;
  final int year;
  final Color color;


  const DateWidget({super.key, required this.day, required this.month, required this.year, required this.color});

  @override
  Widget build(BuildContext context) {
    String dayConvert = day.toString().length == 2 ? day.toString(): '0$day';
    String monthConvert = month.toString().length == 2 ? month.toString(): '0$month';
    String yearConvert = year.toString();
    return Text(
      '$dayConvert/$monthConvert/$yearConvert',
      style : TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }

}