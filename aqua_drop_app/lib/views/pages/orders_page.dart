import 'dart:convert';

import 'package:aqua_flow_app/configs/constants.dart';
import 'package:aqua_flow_app/controllers/orders_controller.dart';
import 'package:aqua_flow_app/models/orders_model.dart';
import 'package:aqua_flow_app/models/product.dart';
import 'package:aqua_flow_app/views/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

OrderController orderController = Get.put(OrderController());

class ordersPage extends StatelessWidget {
  const ordersPage({super.key});

  removeItemFromOrders(BuildContext context, Product product) {
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
              // context.read<Shop>().removeFromCart(product);
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
    //Get Orders from database
    Future<void> getOrdes() async {
      http.Response response;
      response = await http.get(
          Uri.parse("https://stveronicasyokimau.com/aqua_drop/get_orders.php"));
      if (response.statusCode == 200) {
        var serverResponse = json.decode(response.body);
        var productResponse = serverResponse['orders'];
        var orderList = productResponse
            .map((orders) => OrderModel.fromJson(orders))
            .toList();
        orderController.updateOrderList(orderList);
      } else {
        print("Error Ocurred");
      }
    }

    Future<void> deleteOrder(orderID) async {
      http.Response response;
      response = await http.get(Uri.parse(
          "https://stveronicasyokimau.com/aqua_drop/delete_order.php?orderID=$orderID"));
      if (response.statusCode == 200) {
        getOrdes();
      } else {
        print("Error Ocurred");
      }
    }

    getOrdes();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: appBlack,
        title: Text(
          "Order History",
          style: TextStyle(fontSize: 30),
        ),
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold, color: appBlack, fontSize: 22),
        // actions: [
        //   //Exit Button
        //   Padding(
        //     padding: const EdgeInsets.all(10.0),
        //     child: GestureDetector(
        //       onTap: () => Get.offAndToNamed("/shop_page"),
        //       child: Icon(
        //         Icons.shopping_bag_outlined,
        //         size: 32,
        //         color: appGrey,
        //       ),
        //     ),
        //   )
        // ],
      ),
      backgroundColor: appWhite,
      body: Column(
        children: [
          //cart list
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: orderController.orderList.length,
                itemBuilder: (context, index) {
                  //get individual item in cart
                  // final item = cart[index];

                  //return as cart title UI
                  return ListTile(
                    title: Text(
                      "${orderController.orderList[index].productName}   ID:${orderController.orderList[index].orderID}",
                    ),
                    subtitle: Text(orderController.orderList[index].amount),

                    // Delete Button
                    trailing: MaterialButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: Text("Do You Want to Delete This Order?"),
                            actions: [
                              //cancel Button
                              MaterialButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text("Cancel"),
                              ),

                              //Yes Nutton
                              MaterialButton(
                                onPressed: () {
                                  deleteOrder(
                                    orderController.orderList[index].orderID,
                                  );
                                  Navigator.pop(context);
                                },
                                child: const Text("Yes"),
                              ),
                            ],
                          ),
                        );
                        // deleteOrder(
                        //   orderController.orderList[index].orderID,
                        // );
                      },
                      child: Text(
                        "Delete",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                      color: appWhite,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
