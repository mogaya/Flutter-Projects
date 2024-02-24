import 'package:aqua_flow_app/configs/constants.dart';
import 'package:aqua_flow_app/views/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            const Icon(
              Icons.water_drop_sharp,
              size: 100,
              color: appWhite,
            ),

            const SizedBox(
              height: 25,
            ),

            //title
            const Text(
              "Aqua Flow",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: appWhite,
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            // subtitle
            const Text(
              "Lorem ipsum dolor sit amet,",
              style: TextStyle(
                color: appWhite,
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            //button
            customButton(
                // onTap: () => Get.toNamed("/login_page"),
                onTap: () => Navigator.pushNamed(context, '/login_page'),
                child: const Icon(Icons.arrow_forward))
          ],
        ),
      ),
    );
  }
}
