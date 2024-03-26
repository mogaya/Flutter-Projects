import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/controllers/homeController.dart';
import 'package:flutter_application_2/views/calculator.dart';
import 'package:flutter_application_2/views/studentlist.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

HomeController homeController = Get.put(HomeController());
var screens = [
  Calculator(),
  const Students(),
  Calculator(),
];

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Du App"),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: [
          Icon(
            Icons.home,
          ),
          Icon(
            Icons.person,
          ),
          Icon(
            Icons.settings,
          )
        ],
        onTap: (index) {
          homeController.updateSelectedPage(index);
        },
      ),
      body: Obx(
        () => Center(
          child: screens[homeController.selectedPage.value],
        ),
      ),
    );
  }
}
