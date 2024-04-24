import 'package:aqua_flow_app/configs/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class profilePage extends StatelessWidget {
  const profilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: appBlack,
        title: Text(
          "User Profile",
          style: TextStyle(fontSize: 30),
        ),
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold, color: appBlack, fontSize: 22),
        actions: [
          //Exit Button
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () => Get.offAndToNamed("/intro_page"),
              child: Icon(
                Icons.exit_to_app_rounded,
                size: 32,
                color: appGrey,
              ),
            ),
          )
        ],
      ),
      backgroundColor: appWhite,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/profile_image.jpg'),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            //Username
            Text(
              'Username:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              'JohnDoe',
              style: TextStyle(
                fontSize: 16,
              ),
            ),

            SizedBox(
              height: 10,
            ),

            //Delivery Location
            Text(
              'Delivery Location:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              '123 Delivery Street, City',
              style: TextStyle(
                fontSize: 16,
              ),
            ),

            SizedBox(
              height: 10,
            ),

            //Phone Number
            Text(
              'Phone:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              '+1234567890',
              style: TextStyle(
                fontSize: 16,
              ),
            ),

            SizedBox(
              height: 30,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Add functionality to edit profile information
                  },
                ),
                Text(
                  'Edit',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
