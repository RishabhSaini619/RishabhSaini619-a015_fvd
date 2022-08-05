// ignore_for_file: must_be_immutable

import 'package:a015_fvd/screen/screen_inner/inner_screen_product_detail_view/inner_screen_product_detail_view_components.dart';
import 'package:flutter/material.dart';


class ProductDetailView extends StatefulWidget {
  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();

}

class _ProductDetailViewState extends State<ProductDetailView> {
  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ProductDetailViewBodyProductImage(),
            ProductDetailViewBody(),
          ],
        ),
      ),
    );
  }
}