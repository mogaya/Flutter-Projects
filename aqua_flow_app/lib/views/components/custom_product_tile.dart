import 'package:aqua_flow_app/configs/constants.dart';
import 'package:aqua_flow_app/models/product.dart';
import 'package:aqua_flow_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class customProductTile extends StatelessWidget {
  final Product product;
  customProductTile({
    super.key,
    required this.product,
  });

  // get context => null;

  //Add to cart button pressed
  void addToCart(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Add this Item to your Cart"),
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
              context.read<Shop>().addToCart(product);
            },
            child: const Text("Yes"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: appBlue,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //product image
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: appWhite,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: double.infinity,
                  padding: const EdgeInsets.all(25),
                  child: Image.asset(product.imagePath),
                ),
              ),

              SizedBox(
                height: 25,
              ),

              //product name
              Text(product.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),

              SizedBox(
                height: 10,
              ),

              //product description
              Text(
                product.description,
                style: TextStyle(color: appBlack),
              ),
            ],
          ),

          //product price + add to cart button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //product price
              Text(
                'Ksh ' + product.price.toStringAsFixed(2),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),

              //button
              Container(
                decoration: BoxDecoration(
                    color: appWhite, borderRadius: BorderRadius.circular(12)),
                child: IconButton(
                  onPressed: () => addToCart(context),
                  icon: Icon(Icons.add),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
