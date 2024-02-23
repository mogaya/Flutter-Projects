import 'package:aqua_flow_app/configs/constants.dart';
import 'package:aqua_flow_app/views/components/custom_list_tile.dart';
import 'package:flutter/material.dart';

class customDrawer extends StatelessWidget {
  const customDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: appWhite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //drawer header: logo
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.water_drop,
                    size: 72,
                    color: appBlue,
                  ),
                ),
              ),

              const SizedBox(
                height: 25,
              ),

              // shop tile
              customListTile(
                text: "Shop",
                icon: Icons.home,
                onTap: () => Navigator.pop(context),
              ),

              // cart tile
              customListTile(
                text: "Cart",
                icon: Icons.shopping_cart,
                onTap: () {
                  //pop drawer first
                  Navigator.pop(context);

                  //go to cart page
                  Navigator.pushNamed(context, '/cart_page');
                },
              ),
            ],
          ),

          //exit shop tile
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: customListTile(
              text: "Exit",
              icon: Icons.logout,
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/intro_page', (route) => false),
            ),
          ),
        ],
      ),
    );
  }
}
