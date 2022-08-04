import 'package:a015_fvd/widget/widget_add_to_cart.dart';
import 'package:a015_fvd/widget/widget_add_to_wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProductDetailView extends StatefulWidget {
  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();

  String name;
  final source;
  String ID;
  Map<dynamic, dynamic> data;

  ProductDetailView({this.name, this.source, this.data, this.ID});
}

class _ProductDetailViewState extends State<ProductDetailView> {
  @override
  void dispose() {
    widget.name = null;
    widget.ID = null;
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.name}"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Divider(height: 10.h),
            Padding(
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
            ),
            Padding(
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
            ),

            Padding(
              padding: EdgeInsets.all(8.h),
              child: Text(
                "${widget.data["description"]}",
                style: TextStyle(
                    overflow: TextOverflow.fade,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.1),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h, left: 20.h, right: 20.h, bottom: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "Rs. ${widget.data["vegetable_price"]}",
                    style: TextStyle(
                      fontSize: 20.h,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AddToCart(widget.ID),
                  AddToWishList(widget.ID),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}