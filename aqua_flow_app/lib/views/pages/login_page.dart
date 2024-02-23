import 'package:aqua_flow_app/configs/constants.dart';
import 'package:aqua_flow_app/views/components/customText.dart';
import 'package:aqua_flow_app/views/components/customTextField.dart';
import 'package:aqua_flow_app/views/components/custom_button.dart';
import 'package:flutter/material.dart';

class loginPage extends StatelessWidget {
  loginPage({super.key});
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: appBlue,
        automaticallyImplyLeading: true,
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
                      "Welcome Back",
                      style: TextStyle(
                        color: appBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),

                    //SubText
                    Text(
                      "Please fill in your email and password to login to your account",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),

                    SizedBox(
                      height: 40,
                    ),

                    //email and text field
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
                      hintMessage: "Enter Email",
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
                      hintMessage: "Enter Password",
                      icon: Icons.lock,
                      obscureText: true,
                      isPassword: true,
                    ),

                    //Forgot Password
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.rectangle,
                      ),
                      child: MaterialButton(
                        minWidth: 318,
                        height: 60,
                        onPressed: () {
                          Navigator.pushNamed(context, '/shop_page');
                          BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Colors.transparent),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: appBlack,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
                            Navigator.pushNamed(context, '/shop_page');
                            BoxDecoration(color: Colors.transparent);
                          },
                          child: const Text(
                            "LOGIN",
                            style: TextStyle(
                              color: appWhite,
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),

                      //Do not have an account sign up button
                      Padding(
                        padding: const EdgeInsets.only(bottom: 120),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            shape: BoxShape.rectangle,
                          ),
                          child: MaterialButton(
                            minWidth: 318,
                            height: 60,
                            onPressed: () =>
                                Navigator.pushNamed(context, '/shop_page'),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Don’t  have an account?",
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: appBlack,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  const Text(
                                    " Sign UP",
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
                            ),
                          ),
                        ),
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
}
