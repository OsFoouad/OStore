// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class my_nav_bar extends StatefulWidget {
  const my_nav_bar({super.key});

  @override
  State<my_nav_bar> createState() => _my_nav_barState();
}

class _my_nav_barState extends State<my_nav_bar> {
  @override
  Widget build(BuildContext context) {
    return const GNav(
        rippleColor: Colors.grey,
        hoverColor: Color.fromARGB(255, 99, 85, 85),
        activeColor: Colors.blue,
        iconSize: 20,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        duration: Duration(milliseconds: 100),
        tabBackgroundColor: Color.fromARGB(255, 238, 240, 224),
        backgroundColor: Colors.black,
        color: Colors.white,
        tabs: [
          GButton(
            gap: 20,
            icon: Icons.home,
            text: "Home",
          ),
          GButton(
            gap: 20,
            icon: Icons.search,
            text: "Search",
          ),
          GButton(
            gap: 20,
            icon: Icons.shopping_bag_rounded,
            text: "like",
          ),
          GButton(
            gap: 20,
            icon: Icons.settings,
            text: "Settings",
          ),
        ]);
  }
}
