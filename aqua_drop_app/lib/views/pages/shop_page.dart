import 'dart:convert';

import 'package:aqua_flow_app/configs/constants.dart';
import 'package:aqua_flow_app/controllers/login_controller.dart';
import 'package:aqua_flow_app/controllers/products_controller.dart';
import 'package:aqua_flow_app/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

ProductController productController = Get.put(ProductController());
LoginController loginController = Get.put(LoginController());

class shopPage extends StatelessWidget {
  const shopPage({super.key});

  @override
  Widget build(BuildContext context) {
    //Get Products from database
    Future<void> getProducts() async {
      http.Response response;
      response = await http.get(Uri.parse(
          "https://stveronicasyokimau.com/aqua_drop/get_products.php"));
      if (response.statusCode == 200) {
        var serverResponse = json.decode(response.body);
        var productResponse = serverResponse['products'];
        var productList = productResponse
            .map((product) => ProductModel.fromJson(product))
            .toList();
        productController.updateProductList(productList);
      } else {
        print("Error Ocurred");
      }
    }

    //Order Logic - create order function
    Future<void> createOrder(productID, price) async {
      http.Response response;
      var body = {
        'productID': productID,
        'amount': price,
        'phone': '${loginController.phoneNumber.value}',
      };

      response = await http.post(
          Uri.parse(
              "https://stveronicasyokimau.com/aqua_drop/create_order.php"),
          body: body);

      if (response.statusCode == 200) {
        var serverResponse = json.decode(response.body);
        int signedUp = serverResponse['success'];
        if (signedUp == 1) {
          print('Order Created');
        } else {
          print('Could not Create Order');
        }
      }
    }

    getProducts();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: appBlack,
        title: Text(
          "Our Products",
          style: TextStyle(fontSize: 30),
        ),
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold, color: appBlack, fontSize: 22),
        actions: [
          //Exit Button
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () => Get.offAndToNamed("/intro_page"),
              child: Icon(
                Icons.exit_to_app_rounded,
                size: 32,
                color: appGrey,
              ),
            ),
          )
        ],
      ),
      // drawer: customDrawer(),

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
            height: 620,
            child: Obx(
              () => ListView.builder(
                itemCount: productController.productList.length,
                padding: const EdgeInsets.all(15),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  //get each individual product from shop
                  // final product = products[index];

                  //return as a product tile UI
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
                                padding: const EdgeInsets.all(5),
                                child: Image.network(
                                    "https://stveronicasyokimau.com/aqua_drop/p_images/${productController.productList[index].p_image}"),
                              ),
                            ),

                            SizedBox(
                              height: 25,
                            ),

                            //product name
                            Text(productController.productList[index].p_name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                )),

                            SizedBox(
                              height: 10,
                            ),

                            //product description
                            Text(
                              productController
                                  .productList[index].p_description,
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
                              // 'Ksh ' + product.price.toStringAsFixed(2),
                              'Ksh ' +
                                  productController.productList[index].price,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),

                            //button
                            MaterialButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    content:
                                        Text("Do You Want to Place This Order"),
                                    actions: [
                                      //cancel Button
                                      MaterialButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text("Cancel"),
                                      ),

                                      //Yes Nutton
                                      MaterialButton(
                                        onPressed: () {
                                          createOrder(
                                              productController
                                                  .productList[index].id,
                                              productController
                                                  .productList[index].price);
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Yes"),
                                      ),
                                    ],
                                  ),
                                );
                                // createOrder(
                                //     productController.productList[index].id,
                                //     productController.productList[index].price);
                              },
                              child: Text(
                                "Place Order",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                              color: appWhite,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                            // Container(
                            //   decoration: BoxDecoration(
                            //       color: appWhite,
                            //       borderRadius: BorderRadius.circular(12)),
                            //   child: IconButton(
                            //     onPressed: () => {},
                            //     // onPressed: () => addToCart(context),
                            //     icon: Icon(Icons.add),
                            //   ),
                            // ),
                          ],
                        ),
                      ],
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
