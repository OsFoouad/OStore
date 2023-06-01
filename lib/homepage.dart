import 'package:flutter/material.dart';
import 'navigation_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text('O store'),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: Colors.black.withOpacity(.5),
            ),
          ],
        ),
        child: const SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              child: my_nav_bar()),
        ),
      ),
    );
  }
}
