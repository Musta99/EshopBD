import 'package:flutter/material.dart';
import 'package:gajetbd/Screens/productscreen.dart';
import 'package:gajetbd/bottombar.dart';
import 'package:gajetbd/constant/logo.dart';
import 'package:gajetbd/provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var value = Provider.of<ProviderState>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {},
        child: Icon(Icons.shopping_bag_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(),
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: CompanyLogo(),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: value.getCartItems.length,
                  itemBuilder: (context, ind) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.network(
                            value.getCartItems[ind].image!,
                            height: 80,
                            width: 80,
                          ),
                          Expanded(
                            child: Container(
                              height: 70,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    value.getCartItems[ind].title!,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    value.getCartItems[ind].price.toString(),
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              value.removeFromCart(
                                value.getCartItems[ind],
                              );
                            },
                            icon: Icon(Icons.delete_outline),
                          ),
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
