import 'dart:async';
import 'package:a015_fvd/widget/widget_fetch.dart';
import 'package:a015_fvd/screen/screen_navigatin_bar/screen_nav.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(
        seconds: 2,
      ),
      Splash,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage(
        //       'assets/images/splash/background.png',
        //     ),
        //   ),
        // ),
        child: Column(
          children: [
            CircularProgressIndicator(
              value: loadingStatus,
              strokeWidth: 5,
            ),
            Container(
              child: Text("Loading"),
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     image: AssetImage(
              //       'assets/images/splash/logo.gif',
              //     ),
              //   ),
              // ),
            ),
          ],
        ),
      ),
    );
  }

  Future<Object> Splash() async {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Fetch(),
        // LoginScreen(),
      ),
    );
  }
}
