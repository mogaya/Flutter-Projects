import 'package:aqua_flow_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'views/pages/cart_page.dart';
import 'views/pages/intro_page.dart';
import 'views/pages/login_page.dart';
import 'views/pages/shop_page.dart';
import 'views/pages/signup_page.dart';

// void main() {
//   runApp(
//     GetMaterialApp(
//       initialRoute: "/",
//       getPages: Routes.routes,
//       debugShowCheckedModeBanner: false,
//     ),
//   );
// }

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   scaffoldBackgroundColor:
      //       Colors.blue, // Change this color to your desired background color
      // ),
      home: IntroPage(),
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/login_page': (context) => loginPage(),
        '/signup_page': (context) => signUpPage(),
        '/shop_page': (context) => const shopPage(),
        '/cart_page': (context) => const cartPage(),
      },
    );
  }
}
