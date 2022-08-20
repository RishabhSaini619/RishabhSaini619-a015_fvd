import 'package:a015_fresh_basket/global/global_firebase.dart';
import 'package:a015_fresh_basket/screen/screen_home/screen_home_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationControllerHome;

  @override
  void initState() {
    super.initState();
    _animationControllerHome = AnimationController(
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationControllerHome.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HomeScreenBanner(),
            SizedBox(
              height: 10.h,
              child: Divider(
                thickness: 2,
                color: themeData.colorScheme.primary.withOpacity(
                  0.2,
                ),
              ),
            ),
            // Fruits
            FruitsContainer(),
            SizedBox(
              height: 10.h,
              child: Divider(
                thickness: 2,
                color: themeData.colorScheme.primary.withOpacity(
                  0.2,
                ),
              ),
            ),
            // Vegetable
            VegetablesContainer(),
            SizedBox(
              height: 10.h,
              child: Divider(
                thickness: 2,
                color: themeData.colorScheme.primary.withOpacity(
                  0.2,
                ),
              ),
            ),
            // Daily
            DailyContainer(),
            SizedBox(
              height: 10.h,
              child: Divider(
                thickness: 2,
                color: themeData.colorScheme.primary.withOpacity(
                  0.2,
                ),
              ),
            ),
            // Grains
            GrainsContainer(),
            SizedBox(
              height: 10.h,
              child: Divider(
                thickness: 2,
                color: themeData.colorScheme.primary.withOpacity(
                  0.2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
