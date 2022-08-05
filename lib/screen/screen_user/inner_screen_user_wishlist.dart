import 'package:a015_fvd/screen/screen_user/inner_screen_user_wishlist_components.dart';
import 'package:a015_fvd/global/global_variable.dart';
import 'package:flutter/material.dart';

class WishListScreen extends StatefulWidget {
  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen>
    with SingleTickerProviderStateMixin {
  bool buyNow = false;

  @override
  void initState() {
    setState(() {});
    super.initState();
    animationControllerWishList = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    animationControllerWishList.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WishListScreenAppBarImage(),
              WishListScreenProduct(),
            ],
          ),
        ),
      ),
    );
  }
}
