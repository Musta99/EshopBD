import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:gajetbd/Screens/manupage.dart';

import 'package:gajetbd/Screens/productscreen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final iconList = <IconData>[
    Icons.home,
    Icons.menu,
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar.builder(
      itemCount: iconList.length,
      tabBuilder: (int index, bool isActive) {
        return Icon(
          iconList[index],
          size: 24,
          color: Colors.white70,
        );
      },
      backgroundColor: Colors.black,
      activeIndex: currentIndex,
      gapLocation: GapLocation.center,
      onTap: (index) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => index == 0 ? ProductScreen() : MenuPage(),
          ),
        );
        setState(() {
          currentIndex = index;
        });
      },
    );
  }
}
