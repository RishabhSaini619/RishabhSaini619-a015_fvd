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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              // Fruits
              FruitsContainer(),
              SizedBox(
                height: 10.h,
              ),
              // Vegetable
              VegetablesContainer(),
              SizedBox(
                height: 10.h,
              ),
              // Daily
              DailyContainer(),
              SizedBox(
                height: 10.h,
              ),
              // Grains
              GrainsContainer(),
              SizedBox(
                height: 10.h,
              ),
              // other Categories
              SizedBox(
                height: 20.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.h,
                  ),
                  child: Divider(
                    thickness: 1.h,
                    color: themeData.colorScheme.primary.withOpacity(
                      0.2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
