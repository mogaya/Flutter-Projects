import 'package:flutter/material.dart';

class customButton extends StatelessWidget {
  final TextEditingController Controller;
  final String label;
  const customButton({
    super.key,
    required this.Controller,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          print("Button Clicked ${Controller.text}");
        },
        child: Text(label));
  }
}
