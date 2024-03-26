import 'package:flutter/material.dart';
import 'package:flutter_application_2/views/custombutton.dart';
import 'package:flutter_application_2/views/customfield.dart';
import 'package:flutter_application_2/views/customtext.dart';
import 'package:get/get.dart';

import '../configs/constants.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DU App"),
        backgroundColor: primaryColor,
        foregroundColor: appWhiteColor,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/dulogo.png",
                      height: 120,
                      width: 120,
                    ),
                  ],
                ),
                // Padding: EdgeInsets.Rect.fromLTRB(left, top, right, bottom)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomText(
                      label: "Login Screen",
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomText(label: "Username"),
                // TextField(),
                CustomTextField(
                  controller: usernameController,
                  hintMessage: "Enter email or phone number",
                  icon: Icons.person,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomText(label: "Password"),
                // TextField(),
                CustomTextField(
                  controller: passwordController,
                  hintMessage: "Enter password",
                  icon: Icons.lock,
                  obscureText: true,
                  isPassword: true,
                ),
                const SizedBox(
                  height: 30,
                ),
                customButton(
                  Controller: usernameController,
                  label: 'Calculator',
                  action: navigateToCalc,
                ),
                // MaterialButton(
                //   onPressed: () => Get.toNamed("/calculator"),
                //   child: Text(
                //     "Calculator",
                //     style: TextStyle(
                //       color: appWhiteColor,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                //   height: 50,
                //   minWidth: 200,
                //   color: primaryColor,
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(30),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void navigateToCalc() {
    Get.toNamed("/calculator");
  }

  // TextField CustomTextField() => TextField();
}
