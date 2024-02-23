import 'package:aqua_flow_app/configs/constants.dart';
import 'package:aqua_flow_app/models/product.dart';
import 'package:aqua_flow_app/models/shop.dart';
import 'package:aqua_flow_app/views/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class cartPage extends StatelessWidget {
  const cartPage({super.key});

  removeItemFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Remove this Item to your Cart"),
        actions: [
          //cancel Button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),

          //Yes Nutton
          MaterialButton(
            onPressed: () {
              //pop dialogue box
              Navigator.pop(context);

              //add to cart
              context.read<Shop>().removeFromCart(product);
            },
            child: const Text("Yes"),
          ),
        ],
      ),
    );
  }

  //user pressed pay button
  void payButtonPressed(context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("User wants to pay connect to Backend"),
      ),
    );
  }

  void noProducts(context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("You do not have any products in your cart"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //get access to cart
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: appBlack,
        title: Text("Cart Page"),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: appBlack,
          fontSize: 22,
        ),
      ),
      backgroundColor: appWhite,
      body: Column(children: [
        //cart list
        Expanded(
          child: cart.isEmpty
              ? Center(child: Text("Your Cart is Empty"))
              : ListView.builder(
                  itemCount: cart.length,
                  itemBuilder: (context, index) {
                    //get individual item in cart
                    final item = cart[index];

                    //return as cart title UI
                    return ListTile(
                      title: Text(item.name),
                      subtitle: Text(item.price.toStringAsFixed(2)),
                      trailing: IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () => removeItemFromCart(context, item),
                      ),
                    );
                  },
                ),
        ),

        //pay button
        Padding(
          padding: EdgeInsets.all(50),
          child: customButton(
            // onTap: () => payButtonPressed(context),
            onTap: () {
              cart.isEmpty ? noProducts(context) : payButtonPressed(context);
            },
            child: Text("PAY NOW"),
          ),
        ),
      ]),
    );
  }
}
