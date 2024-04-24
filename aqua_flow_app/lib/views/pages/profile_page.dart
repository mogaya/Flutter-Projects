import 'dart:convert';

import 'package:aqua_flow_app/configs/constants.dart';
import 'package:aqua_flow_app/controllers/login_controller.dart';
import 'package:aqua_flow_app/controllers/products_controller.dart';
import 'package:aqua_flow_app/controllers/profile_controller.dart';
import 'package:aqua_flow_app/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../models/profile_model.dart';

ProductController productController = Get.put(ProductController());
LoginController loginController = Get.put(LoginController());
ProfileController profileController = Get.put(ProfileController());

class profilePage extends StatelessWidget {
  const profilePage({super.key});

  @override
  Widget build(BuildContext context) {
    //Get Products from database
    Future<void> getProfile() async {
      http.Response response;
      response = await http.get(Uri.parse(
          "https://stveronicasyokimau.com/aqua_drop/profile.php?phone=0704379546"));
      if (response.statusCode == 200) {
        var serverResponse = json.decode(response.body);
        var profileResponse = serverResponse['profile'];
        var profileList = profileResponse
            .map((profile) => ProfileModel.fromJson(profile))
            .toList();
        profileController.updateProfileList(profileList);
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

    getProfile();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: appBlack,
        title: Text(
          "User Profile",
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

          //product list
          SizedBox(
            height: 620,
            child: Obx(
              () => ListView.builder(
                itemCount: profileController.profileList.length,
                padding: const EdgeInsets.all(15),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  //get each individual product from shop
                  // final product = products[index];

                  //return as a product tile UI
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    // margin: const EdgeInsets.all(10),
                    // padding: const EdgeInsets.all(25),
                    // width: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //product image

                        Center(
                          child: CircleAvatar(
                            radius: 80,
                            backgroundImage:
                                AssetImage('assets/profile_image.jpg'),
                          ),
                        ),

                        SizedBox(
                          height: 25,
                        ),

                        //Username
                        Text(
                          'Username:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          '${profileController.profileList[index].username}',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        //Delivery Location
                        Text(
                          'Delivery Location:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          '${profileController.profileList[index].del_location}',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        //Phone Number
                        Text(
                          'Phone:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          '${profileController.profileList[index].phone}',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),

                        SizedBox(
                          height: 30,
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
