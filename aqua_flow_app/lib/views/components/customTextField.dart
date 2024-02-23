import 'package:aqua_flow_app/configs/constants.dart';
import 'package:flutter/material.dart';

class customTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintMessage;
  final bool obscureText;
  final IconData? icon;
  final bool isPassword;
  final Color backgroundColor;

  const customTextField({
    super.key,
    this.controller,
    this.hintMessage,
    this.icon,
    this.obscureText = false,
    this.isPassword = false,
    this.backgroundColor = appWhite,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: appBlue,
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: appGrey)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: appBlue,
            width: 2,
          ),
        ),
        contentPadding: EdgeInsets.fromLTRB(15, 16, 15, 16),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(0),
          ),
        ),
        hintText: hintMessage,
        hintStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
        prefixIcon: Icon(icon),
        suffixIcon: isPassword
            ? Icon(Icons.visibility)
            : Container(
                height: 10,
                width: 10,
              ),
      ),
    );
  }
}
