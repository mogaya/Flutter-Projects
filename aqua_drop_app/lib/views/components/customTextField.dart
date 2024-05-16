import 'package:aqua_flow_app/configs/constants.dart';
import 'package:aqua_flow_app/views/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class customTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintMessage;
  final bool obscureText;
  final IconData? icon;
  final bool isPassword;
  final Color backgroundColor;

  // final TextEditingController? controller;
  // final String? hint;
  // final IconData? icon;
  final IconData? prefIcon;
  // final bool isPassword;
  final Function()? onTap;
  final InputDecoration? decoration;

  const customTextField({
    super.key,
    this.controller,
    this.hintMessage,
    this.icon,
    this.obscureText = false,
    this.isPassword = false,
    this.backgroundColor = appWhite,

    // Key? key,
    // this.hint,
    // this.icon,
    this.prefIcon,
    // this.isPassword = false,
    // this.controller,
    this.onTap,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isHidden = loginController.isHidden.value;
      return TextField(
        onTap: onTap,
        cursorColor: appBlue,
        obscureText: isPassword && isHidden,
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
              ? GestureDetector(
                  child: Icon(
                      isHidden ? Icons.visibility_off_sharp : Icons.visibility),
                  onTap: () => loginController.toggleHide(),
                )
              : null,
          // suffixIcon: isPassword
          //     ? Icon(Icons.visibility)
          //     : Container(
          //         height: 10,
          //         width: 10,
          //       ),
        ),
      );
    });
  }
}
