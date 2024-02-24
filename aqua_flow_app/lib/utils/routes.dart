import 'package:aqua_flow_app/views/pages/cart_page.dart';
import 'package:aqua_flow_app/views/pages/intro_page.dart';
import 'package:aqua_flow_app/views/pages/login_page.dart';
import 'package:aqua_flow_app/views/pages/shop_page.dart';
import 'package:aqua_flow_app/views/pages/signup_page.dart';
import 'package:get/get.dart';

class Routes {
  static var routes = [
    GetPage(name: "/", page: () => IntroPage()),
    GetPage(name: "/login_page", page: () => loginPage()),
    GetPage(name: "/signup_page", page: () => signUpPage()),
    GetPage(name: "/shop_page", page: () => shopPage()),
    GetPage(name: "/cart_page", page: () => cartPage()),
  ];
}
