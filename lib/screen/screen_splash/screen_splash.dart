import 'dart:async';
import 'package:a015_fvd/global/global_theme.dart';
import 'package:a015_fvd/screen/screen_auth/screen_user_login/screen_user_login.dart';
import 'package:a015_fvd/widget/widget_fetch.dart';
import 'package:a015_fvd/screen/screen_navigatin_bar/screen_nav.dart';
import 'package:a015_fvd/widget/widget_text_widget.dart';
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
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: Stack(

        children: [

          Container(
          decoration: BoxDecoration(
            color: themeData.colorScheme.background,
          ),
            child: Stack(
              children: [
                Image.asset(darkMode ?'assets/logo/logo_black.png':'assets/logo/logo_white.png'),
                TextWidget(
                  tText: "Fresh Basket",
                  tColor: themeData.colorScheme.onPrimary,
                  tSize: 20,
                )
              ],
            ),
        ),]
      ),
    );
  }

  Future<Object> Splash() async {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserLoginScreen(),
        // LoginScreen(),
      ),
    );
  }
}
