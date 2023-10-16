import 'package:flutter/material.dart';
import 'package:gajetbd/bottombar.dart';
import 'package:gajetbd/constant/menuItems.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Container(
        padding: const EdgeInsets.fromLTRB(25, 70, 25, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 26.0,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Text(
                          "Name of User",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("Active Status")
                      ],
                    ),
                  ],
                ),
                Image.asset(
                  "Images/right-arrow.png",
                  height: 20,
                  width: 20,
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            MenuItems(title: "Home", icon: Icons.home),
            MenuItems(
                title: "Cart", icon: Icons.shopping_cart_checkout_rounded),
            MenuItems(title: "Favourites", icon: Icons.favorite_outlined),
            MenuItems(title: "Message", icon: Icons.message_sharp),
            MenuItems(title: "Account", icon: Icons.person_2_outlined),
            MenuItems(title: "Settings", icon: Icons.settings),
            Container(
              margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
              child: Text("Version: 4.8"),
            )
          ],
        ),
      ),
    );
  }
}
