import 'dart:convert';

import 'package:aqua_flow_app/configs/constants.dart';
import 'package:aqua_flow_app/views/components/customText.dart';
import 'package:aqua_flow_app/views/components/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class signUpPage extends StatelessWidget {
  signUpPage({super.key});
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0, 129, 7, 250),
        elevation: 0,
        foregroundColor: appBlue,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 35, 25, 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Welcome Message
                Column(
                  children: [
                    Text(
                      "Create your Account",
                      style: TextStyle(
                        color: appBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),

                    //SubText
                    Text(
                      "Please fill in your details to create your account",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),

                    SizedBox(
                      height: 40,
                    ),

                    //Name and text field
                    Container(
                      width: 300,
                      height: 20,
                      alignment: Alignment.topLeft,
                      child: customText(
                        label: "Name",
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),

                    customTextField(
                      controller: nameController,
                      hintMessage: "Enter your name",
                      icon: Icons.person_outline_outlined,
                    ),

                    SizedBox(
                      height: 25,
                    ),

                    //phone and text field
                    Container(
                      width: 300,
                      height: 20,
                      alignment: Alignment.topLeft,
                      child: customText(
                        label: "Phone",
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),

                    customTextField(
                      controller: phoneController,
                      hintMessage: "Enter your phone",
                      icon: Icons.phone_outlined,
                    ),

                    SizedBox(
                      height: 25,
                    ),

                    //Email Text Field
                    Container(
                      width: 300,
                      height: 20,
                      alignment: Alignment.topLeft,
                      child: customText(
                        label: "Email",
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),

                    customTextField(
                      controller: emailController,
                      hintMessage: "Enter your email",
                      icon: Icons.email_outlined,
                    ),

                    SizedBox(
                      height: 25,
                    ),

                    //password and text field
                    Container(
                      width: 300,
                      height: 20,
                      alignment: Alignment.topLeft,
                      child: customText(
                        label: "Password",
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    customTextField(
                      controller: passwordController,
                      hintMessage: "Enter password",
                      icon: Icons.lock_outline_rounded,
                      obscureText: true,
                      isPassword: true,
                    ),

                    SizedBox(
                      height: 25,
                    ),

                    //Confirm Password and text field
                    // Container(
                    //   width: 300,
                    //   height: 20,
                    //   alignment: Alignment.topLeft,
                    //   child: customText(
                    //     label: "Confirm Password",
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: 14,
                    //   ),
                    // ),
                    // customTextField(
                    //   controller: confirmPasswordController,
                    //   hintMessage: "Enter password again",
                    //   icon: Icons.lock_outline_rounded,
                    //   obscureText: true,
                    //   isPassword: true,
                    // ),
                  ],
                ),

                //Login button
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: appBlue,
                          shape: BoxShape.rectangle,
                        ),
                        child: MaterialButton(
                          minWidth: 318,
                          height: 60,
                          onPressed: () {
                            serverSignup();
                            BoxDecoration(color: Colors.transparent);
                          },
                          child: const Text(
                            "CREATE AN ACCOUNT",
                            style: TextStyle(
                              color: appWhite,
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 25,
                      ),

                      //Already have an account Login in button
                      GestureDetector(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: appBlack,
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              " SignIn",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: appBlue,
                                color: appBlue,
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                        onTap: () => Get.toNamed("/login_page"),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> serverSignup() async {
    http.Response response;
    var body = {
      'username': nameController.text.trim(),
      'phone': phoneController.text.trim(),
      'email': emailController.text.trim(),
      'password': passwordController.text.trim()
    };

    response = await http.post(
        Uri.parse("https://stveronicasyokimau.com/aqua_drop/signup.php"),
        body: body);

    if (response.statusCode == 200) {
      var serverResponse = json.decode(response.body);
      int signedUp = serverResponse['success'];
      if (signedUp == 1) {
        Get.offAndToNamed("/login_page");
      }
    }
  }
}
