import 'package:flutter/material.dart';

import 'product.dart';

class Shop extends ChangeNotifier {
  //Products for sale
  final List<Product> _shop = [
    // product 1
    Product(
      name: "Product 1",
      price: 250,
      description: "Item",
      imagePath: 'assets/images/20L.jpg',
    ),

    // product 2
    Product(
      name: "Product 2",
      price: 200,
      description: "Item",
      imagePath: 'assets/images/20L.jpg',
    ),

    // product 3
    Product(
      name: "Product 3",
      price: 100,
      description: "Item",
      imagePath: 'assets/images/20L.jpg',
    ),

    // product 4
    Product(
      name: "Product 4",
      price: 50,
      description: "Item",
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
