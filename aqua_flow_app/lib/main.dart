import 'package:aqua_flow_app/models/shop.dart';
import 'package:aqua_flow_app/views/pages/cart_page.dart';
import 'package:aqua_flow_app/views/pages/login_page.dart';
import 'package:aqua_flow_app/views/pages/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'views/pages/intro_page.dart';

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
      home: IntroPage(),
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/login_page': (context) => loginPage(),
        '/shop_page': (context) => const shopPage(),
        '/cart_page': (context) => const cartPage(),
      },
    );
  }
}
