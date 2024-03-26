import 'package:flutter/material.dart';

class customButton extends StatelessWidget {
  final TextEditingController Controller;
  final String label;
  final VoidCallback action;
  const customButton({
    super.key,
    required this.Controller,
    required this.label,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: action, child: Text(label));
  }
}
