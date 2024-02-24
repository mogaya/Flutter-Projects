import 'package:aqua_flow_app/configs/constants.dart';
import 'package:aqua_flow_app/views/components/customText.dart';
import 'package:aqua_flow_app/views/components/customTextField.dart';
import 'package:flutter/material.dart';

class signUpPage extends StatelessWidget {
  signUpPage({super.key});
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

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

                    //Email and text field
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
                    Container(
                      width: 300,
                      height: 20,
                      alignment: Alignment.topLeft,
                      child: customText(
                        label: "Confirm Password",
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    customTextField(
                      controller: confirmPasswordController,
                      hintMessage: "Enter password again",
                      icon: Icons.lock_outline_rounded,
                      obscureText: true,
                      isPassword: true,
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
                            "CREATE AN ACCOUNT",
                            style: TextStyle(
                              color: appWhite,
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),

                      //Already have an account Login in button
                      MaterialButton(
                        minWidth: 318,
                        height: 60,
                        onPressed: () =>
                            Navigator.pushNamed(context, '/login_page'),
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
