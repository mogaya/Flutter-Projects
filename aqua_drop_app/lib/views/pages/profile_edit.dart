import 'dart:convert';

import 'package:aqua_flow_app/configs/constants.dart';
import 'package:aqua_flow_app/views/components/customText.dart';
import 'package:aqua_flow_app/views/components/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../controllers/login_controller.dart';

LoginController loginController = Get.put(LoginController());

class profileEdit extends StatelessWidget {
  profileEdit({super.key});
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController del_locationController = TextEditingController();
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
            padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Welcome Message
                Column(
                  children: [
                    Text(
                      "Profile Edit",
                      style: TextStyle(
                        color: appBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),

                    //SubText
                    Text(
                      "Please fill in your details to edit profile",
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
                        label: "UserName",
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),

                    customTextField(
                      controller: nameController,
                      hintMessage: "Enter New Username",
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
                        label: "Delivery Location",
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),

                    customTextField(
                      controller: del_locationController,
                      hintMessage: "Enter New Delivery Location",
                      icon: Icons.location_on_outlined,
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
                      hintMessage: "Enter New Email",
                      icon: Icons.email_outlined,
                    ),

                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),

                //Login button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                        editProfile();
                      },
                      child: Text(
                        "Save",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                      color: appWhite,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                      color: appWhite,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> editProfile() async {
    http.Response response;
    var body = {
      'username': nameController.text.trim(),
      'del_location': del_locationController.text.trim(),
      'email': emailController.text.trim(),
      'phone': loginController.phoneNumber.value,
    };

    response = await http.post(
        Uri.parse("https://stveronicasyokimau.com/aqua_drop/profile_edit.php"),
        body: body);

    if (response.statusCode == 200) {}
  }
}
