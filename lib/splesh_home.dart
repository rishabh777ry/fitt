import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class SplashHomeScreen extends StatefulWidget {
  @override
  _SplashHomeScreenState createState() => _SplashHomeScreenState();
}

class _SplashHomeScreenState extends State<SplashHomeScreen> {
  @override
  void initState() {
    super.initState();
    navigateUser();
  }

  void navigateUser() async {
    // Simulate a delay of 2 seconds
    await Future.delayed(Duration(seconds: 1));

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Replace 'assets/logo.png' with the path to your logo asset
            Image.asset(
              'assets/logo.png',
              width: 250, // Adjust width as needed
              height: 250, // Adjust height as needed
            ),
          ],
        ),
      ),
    );
  }
}

