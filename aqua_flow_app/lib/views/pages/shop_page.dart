import 'package:aqua_flow_app/configs/constants.dart';
import 'package:aqua_flow_app/models/shop.dart';
import 'package:aqua_flow_app/views/components/custom_drawer.dart';
import 'package:aqua_flow_app/views/components/custom_product_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class shopPage extends StatelessWidget {
  const shopPage({super.key});

  @override
  Widget build(BuildContext context) {
//access products in shop
    final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: appBlack,
        title: Text("Our Products"),
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold, color: appBlack, fontSize: 22),
        actions: [
          //go to cart button
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
                onPressed: () => Navigator.pushNamed(context, "/cart_page"),
                icon: const Icon(Icons.shopping_cart)),
          )
        ],
      ),
      drawer: customDrawer(),
      backgroundColor: appWhite,
      body: ListView(
        children: [
          const SizedBox(
            height: 25,
          ),
          //shop subtitle
          Center(
            child: Text(
              "Pick from Our Selected List of Products",
              style: TextStyle(
                color: appBlack,
              ),
            ),
          ),

          //product list
          SizedBox(
            height: 600,
            child: ListView.builder(
              itemCount: products.length,
              padding: const EdgeInsets.all(15),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                //get each individual product from shop
                final product = products[index];

                //return as a product tile UI
                return customProductTile(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}
