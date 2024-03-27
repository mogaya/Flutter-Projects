import 'package:flutter/material.dart';

import 'product.dart';

class Shop extends ChangeNotifier {
  //Products for sale
  final List<Product> _shop = [
    // product 1
    Product(
      name: "20 Liters:",
      price: 250,
      description:
          "Quench the thirst of a crowd or keep your hydration game strong with our 20-liter water option. Perfect for gatherings, events, or just ensuring you have a lasting supply at home or in the office. Stay refreshed, stay hydrated!",
      imagePath: 'assets/images/20L.jpg',
    ),

    // product 2
    Product(
      name: "10 Liters:",
      price: 200,
      description:
          "Mid-sized and mighty! Our 10-liter water delivery option strikes the right balance between convenience and sufficiency. Ideal for smaller events, workspaces, or as an ample supply for a few days. Hydrate effortlessly with our 10-liter solution.",
      imagePath: 'assets/images/20L.jpg',
    ),

    // product 3
    Product(
      name: "5 Liters:",
      price: 100,
      description:
          "Compact, convenient, and ready for hydration anytime, anywhere. Our 5-liter water delivery is perfect for those on the go, small households, or as an addition to your pantry. Stay agile and stay hydrated with this easily manageable option.",
      imagePath: 'assets/images/20L.jpg',
    ),

    // product 4
    Product(
      name: "Dozen of Half-Liters:",
      price: 50,
      description:
          "Introducing the perfect portion for personal hydration a dozen of half-liter bottles! Grab and go with these convenient, perfectly sized bottles. Ideal for individuals, workouts, or simply for those who prefer their hydration in smaller sips. Hydrate smart with our dozen of half-liters option.",
      imagePath: 'assets/images/20L.jpg',
    )
  ];

//user cart
  List<Product> _cart = [];

//get product list
  List<Product> get shop => _shop;

// get user cart
  List<Product> get cart => _cart;

  get length => null;

//add item to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

//remove item from cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
