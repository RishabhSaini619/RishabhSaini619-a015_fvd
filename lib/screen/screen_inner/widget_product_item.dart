import 'package:a015_fvd/global_firebase.dart';
import 'package:a015_fvd/widget/widget_add_to_cart.dart';
import 'package:a015_fvd/widget/widget_add_to_wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItems extends StatefulWidget {
  @override
  State<ProductItems> createState() => _ProductItemsState();

  String ID;

  ProductItems(this.ID);
}

class _ProductItemsState extends State<ProductItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<Map>(
          future: getItemDetails(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      FutureBuilder(
                        future: getImage(context, widget.ID),
                        builder: (context, newSnapshot) {
                          return Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.h)),
                            child: newSnapshot.data,
                          );
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 120.h,
                              child: Text(
                                "${snapshot.data["product_name"]}",
                                style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 15.sp,
                                    letterSpacing: 1.2,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Text(
                              "Rs. ${snapshot.data["product_price"]}.00",
                              style: TextStyle(
                                fontSize: 12.h,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  AddToCart(
                    widget.ID,
                    height: 25,
                    width: 75,
                    fontSize: 12,
                  ),
                  AddToWishList(
                    widget.ID,
                    height: 25,
                    width: 75,
                    fontSize: 12,
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }


}