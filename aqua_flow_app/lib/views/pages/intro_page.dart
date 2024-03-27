import 'package:aqua_flow_app/configs/constants.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBlue,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 08.0),
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
                "Aqua Drop",
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
              const Center(
                child: Text(
                  "Pouring convenience into every drop – welcome to the future of water delivery,",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: appWhite,
                    fontSize: 16,
                  ),
                ),
              ),

              const SizedBox(
                height: 25,
              ),

              //button
              // customButton(
              //     // onTap: () => Get.toNamed("/login_page"),
              //     onTap: () => Navigator.pushNamed(context, '/login_page'),
              //     child: const Icon(Icons.arrow_forward))
              Container(
                decoration: BoxDecoration(
                  color: appWhite,
                ),
                child: MaterialButton(
                  minWidth: 318,
                  height: 60,
                  onPressed: () => Navigator.pushNamed(context, '/login_page'),
                  child: Text(
                    "Let's Start",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: appBlack),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
