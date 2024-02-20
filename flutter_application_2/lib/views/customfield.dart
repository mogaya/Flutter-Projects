import 'package:flutter/material.dart';
import 'package:flutter_application_2/configs/constants.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintMessage;
  final bool obscureText;
  final IconData? icon;
  final bool isPassword;
  const CustomTextField({
    super.key,
    required this.controller,
    this.hintMessage,
    this.icon,
    this.obscureText = false,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(color: primaryColor, width: 10),
        ),
        hintText: hintMessage,
        prefixIcon: Icon(icon),
        suffixIcon: isPassword
            ? const Icon(Icons.visibility)
            : Container(
                height: 10,
                width: 10,
              ),
      ),
    );
  }
}
