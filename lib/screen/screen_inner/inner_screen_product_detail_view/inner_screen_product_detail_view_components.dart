// ignore_for_file: must_be_immutable

import 'package:a015_fresh_basket/widget/widget_add_to_cart.dart';
import 'package:a015_fresh_basket/widget/widget_add_to_wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailViewAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ProductDetailViewAppBarImage(),
        ProductDetailViewAppBarTitle(),
      ],
    );
  }
}

class ProductDetailViewAppBarImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image(
      fit: BoxFit.fitHeight,
      image: AssetImage('assets/appbar/yellow.png'),
    );
  }
}

class ProductDetailViewAppBarTitle extends StatefulWidget {
  String name;

  ProductDetailViewAppBarTitle({this.name});

  @override
  State<ProductDetailViewAppBarTitle> createState() =>
      _ProductDetailViewAppBarTitleState();
}

class _ProductDetailViewAppBarTitleState extends State<ProductDetailViewAppBarTitle> {
  void dispose() {
    widget.name = null;
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("${widget.name}"),
    );
  }
}

class ProductDetailViewBody extends StatefulWidget {
  String name;
  final source;
  String ID;
  Map<dynamic, dynamic> data;

  ProductDetailViewBody({this.name, this.source, this.data, this.ID});

  @override
  State<ProductDetailViewBody> createState() => _ProductDetailViewBodyState();
}

class _ProductDetailViewBodyState extends State<ProductDetailViewBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductDetailViewBodyProductImage(),
        ProductDetailViewBodyProductName(),
        ProductDetailViewBodyProductDescription(),
        ProductDetailViewBodyProductPrice(),
        ProductDetailViewBodyProductButtons(),
      ],
    );
  }
}

class ProductDetailViewBodyProductImage extends StatefulWidget {
  final source;

  const ProductDetailViewBodyProductImage({Key key, this.source})
      : super(key: key);
  @override
  State<ProductDetailViewBodyProductImage> createState() =>
      _ProductDetailViewBodyProductImageState();
}

class _ProductDetailViewBodyProductImageState extends State<ProductDetailViewBodyProductImage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.h),
      child: Container(
        height: MediaQuery.of(context).size.height / 3,
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              widget.source,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class ProductDetailViewBodyProductName extends StatefulWidget {
  String name;
  final source;
  String ID;
  Map<dynamic, dynamic> data;

  ProductDetailViewBodyProductName(
      {this.name, this.source, this.data, this.ID});

  @override
  State<ProductDetailViewBodyProductName> createState() =>
      _ProductDetailViewBodyProductNameState();
}

class _ProductDetailViewBodyProductNameState extends State<ProductDetailViewBodyProductName> {
  void dispose() {
    widget.name = null;
    widget.ID = null;
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${widget.name}",
            style: TextStyle(
              fontSize: 20.h,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

class ProductDetailViewBodyProductDescription extends StatefulWidget {
  String name;
  final source;
  String ID;
  Map<dynamic, dynamic> data;

  ProductDetailViewBodyProductDescription(
      {this.name, this.source, this.data, this.ID});

  @override
  State<ProductDetailViewBodyProductDescription> createState() =>
      _ProductDetailViewBodyProductDescriptionState();
}

class _ProductDetailViewBodyProductDescriptionState extends State<ProductDetailViewBodyProductDescription> {
  void dispose() {
    widget.name = null;
    widget.ID = null;
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.h),
      child: Text(
        "${widget.data["description"]}",
        style: TextStyle(
            overflow: TextOverflow.fade,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.1),
      ),
    );
  }
}

class ProductDetailViewBodyProductPrice extends StatefulWidget {
  String name;
  final source;
  String ID;
  Map<dynamic, dynamic> data;

  ProductDetailViewBodyProductPrice(
      {this.name, this.source, this.data, this.ID});

  @override
  State<ProductDetailViewBodyProductPrice> createState() =>
      _ProductDetailViewBodyProductPriceState();
}

class _ProductDetailViewBodyProductPriceState extends State<ProductDetailViewBodyProductPrice> {
  void dispose() {
    widget.name = null;
    widget.ID = null;
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: 10.h, left: 20.h, right: 20.h, bottom: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            "Rs. ${widget.data["product_price"]}",
            style: TextStyle(
              fontSize: 20.h,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class ProductDetailViewBodyProductButtons extends StatefulWidget {
  String name;
  final source;
  String ID;
  Map<dynamic, dynamic> data;

  ProductDetailViewBodyProductButtons(
      {this.name, this.source, this.data, this.ID});

  @override
  State<ProductDetailViewBodyProductButtons> createState() =>
      _ProductDetailViewBodyProductButtonsState();
}

class _ProductDetailViewBodyProductButtonsState extends State<ProductDetailViewBodyProductButtons> {
  void dispose() {
    widget.name = null;
    widget.ID = null;
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: 10.h, left: 20.h, right: 20.h, bottom: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          AddToCart(widget.ID),
          AddToWishList(widget.ID),
        ],
      ),
    );
  }
}
