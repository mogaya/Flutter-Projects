import 'package:flutter_application_2/views/calculator.dart';
import 'package:flutter_application_2/views/home.dart';
import 'package:flutter_application_2/views/login.dart';
import 'package:get/get.dart';
// Transition myTra

class Routes {
  static var routes = [
    GetPage(name: "/", page: () => Login()),
    GetPage(name: "/calculator", page: () => Calculator()),
    GetPage(name: "/home", page: () => Home())
  ];
}
