import 'package:flutter/material.dart';

class AlertWidget extends StatelessWidget {

  final String? titleAlert;
  final String? messageAlert;

  const AlertWidget({super.key, required this.titleAlert, required this.messageAlert});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(titleAlert!),
      content: Text(messageAlert!),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context), 
          child: const Text('Aceptar')
        )
      ],
    );
  }
}