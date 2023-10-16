import 'package:flutter/material.dart';
import 'package:gajetbd/Screens/productscreen.dart';
import 'package:gajetbd/constant/logo.dart';
import 'package:gajetbd/provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductScreen(),
            ),
          );
        },
        child: Icon(
          Icons.arrow_right,
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CompanyLogo(),
            SizedBox(
              height: 120,
            ),
            Text(
              "Welcome to the world of Gadgets",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Get a special descount on your first order",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
