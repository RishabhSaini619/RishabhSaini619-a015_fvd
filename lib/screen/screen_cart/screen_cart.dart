import 'package:a015_fresh_basket/global/global_firebase.dart';
import 'package:a015_fresh_basket/global/global_variable.dart';
import 'package:a015_fresh_basket/screen/screen_cart/screen_cart_components.dart';
import 'package:a015_fresh_basket/screen/screen_inner/inner_screen_product_detail_view/inner_screen_product_detail_view.dart';
import 'package:a015_fresh_basket/screen/screen_inner/widget_product_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    setState(() {});
    super.initState();
    animationControllerCart = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    animationControllerCart.dispose();
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
              CartScreenAppBar(),
              CartScreenProduct(),
              CartScreenProductPrice(),
              CartScreenProductBuyNow(),
            ],
          ),
        ),
      ),
    );
  }
}
