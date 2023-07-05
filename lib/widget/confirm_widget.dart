import 'package:flutter/material.dart';

class ConfirmWidget extends StatelessWidget {

  final String? titleAlert;
  final String? messageAlert;

  const ConfirmWidget({super.key, required this.titleAlert, required this.messageAlert});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(titleAlert!),
      content: Text(messageAlert!),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context, true), 
          child: const Text('Aceptar')
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context, false), 
          child: const Text('Cancelar')
        ),
      ],
    );
  }
}