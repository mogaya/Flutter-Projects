import 'package:aqua_flow_app/configs/constants.dart';
import 'package:aqua_flow_app/controllers/home_controller.dart';
import 'package:aqua_flow_app/views/pages/cart_page.dart';
import 'package:aqua_flow_app/views/pages/profile_page.dart';
import 'package:aqua_flow_app/views/pages/shop_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

HomeController homeController = Get.put(HomeController());

var screenList = [
  shopPage(),
  profilePage(),
  cartPage(),
];

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        color: appBlue,
        backgroundColor: appWhite,
        buttonBackgroundColor: appBlue,
        items: [
          Icon(
            Icons.home_rounded,
            size: 25,
            color: appWhite,
          ),
          Icon(
            Icons.person,
            size: 27,
            color: appWhite,
          ),
          Icon(
            Icons.shopping_cart_rounded,
            size: 25,
            color: appWhite,
          ),
        ],
        onTap: (index) {
          homeController.setSelectedPage(index);
        },
      ),
      body: Obx(
        () => Container(
          child: screenList[homeController.selectedPage.value],
        ),
      ),
    );
  }
}
