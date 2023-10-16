import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gajetbd/Screens/cartscreen.dart';
import 'package:gajetbd/Screens/productdetails.dart';
import 'package:gajetbd/bottombar.dart';
import 'package:gajetbd/constant/logo.dart';
import 'package:gajetbd/provider.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ProviderState>(context, listen: false).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    var value = Provider.of<ProviderState>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartScreen(),
            ),
          );
        },
        child: Icon(Icons.shopping_bag_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(20),
        child: Expanded(
          child: Column(
            children: [
              CompanyLogo(),
              Container(
                child: Row(
                  children: [
                    CircleAvatar(),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: AnimSearchBar(
                        searchIconColor: Colors.white,
                        color: Colors.black,
                        width: 400,
                        textController: textController,
                        onSuffixTap: () {},
                        onSubmitted: (value) {},
                        rtl: true,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 420,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 5),
                        itemCount: value.getProductItems.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              value.productDetails(index);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetails(),
                                ),
                              );
                            },
                            child: ListTile(
                              title: Image.network(
                                value.getProductItems[index].image!,
                                height: 80,
                                width: 80,
                              ),
                              subtitle: Column(
                                children: [
                                  Text(value.getProductItems[index].title!,
                                      overflow: TextOverflow.ellipsis),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        value.getProductItems[index].price
                                            .toString(),
                                      ),
                                      CupertinoButton(
                                        onPressed: () {
                                          value.addtoCart(
                                              value.getProductItems[index]);
                                        },
                                        child: Image.asset(
                                          "Images/shopping-cart.png",
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List categoryList = [
  {"name": "Laptop", "image": "Images/laptop1.png"},
  {"name": "Desktop", "image": "Images/desktop.png"},
  {"name": "Gadget", "image": "Images/gadgets.png"},
  {"name": "Phone", "image": "Images/smartphone.png"}
];

List productList = [
  //Laptop

  {
    "name": "Lenovo IdeaPad 1",
    "image": "Images/products/lenovo ideapad.png",
    "brand": "Lenovo",
    "Price": "60,500৳",
  },
  {
    "name": "MSI Cyborg 15",
    "image": "Images/products/cyborg.png",
    "brand": "MSI",
    "Price": "103,000৳",
  },
  {
    "name": "Asus ExpertBook B1",
    "image": "Images/products/expertbook.png",
    "brand": "Asus",
    "Price": "58,000৳",
  },
  {
    "name": "Acer Aspire 7",
    "image": "Images/products/acer.png",
    "brand": "Acer",
    "Price": "86,000৳",
  },
  {
    "name": "Walton Prelude N40",
    "image": "Images/products/walton.png",
    "brand": "Walton",
    "Price": "39,750৳",
  },

  //Desktop
  {
    "name": "AMD Ryzen 7 5700G",
    "image": "Images/products/ryzend.png",
    "brand": "Ryzen",
    "Price": "47,999৳",
  },
  {
    "name": "Intel Core i5-10400f",
    "image": "Images/products/inteli5.png",
    "brand": "Intel i5",
    "Price": "52,100৳",
  },
  {
    "name": "ASUS VIVO AiO ",
    "image": "Images/products/asus.png",
    "brand": "Asus",
    "Price": "53,000৳",
  },
  {
    "name": "HP Pro 240 G9 Core i3",
    "image": "Images/products/Hp.png",
    "brand": "HP",
    "Price": "78,000৳",
  },
];
