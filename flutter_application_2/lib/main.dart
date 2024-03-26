import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/routes.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: "/home",
    getPages: Routes.routes,
    debugShowCheckedModeBanner: false,
  ));
}
