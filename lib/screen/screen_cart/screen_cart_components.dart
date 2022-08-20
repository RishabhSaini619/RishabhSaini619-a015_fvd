import 'package:a015_fresh_basket/global/global_firebase.dart';
import 'package:a015_fresh_basket/global/global_variable.dart';
import 'package:a015_fresh_basket/screen/screen_inner/inner_screen_product_detail_view/inner_screen_product_detail_view_components.dart';
import 'package:a015_fresh_basket/screen/screen_inner/widget_product_item.dart';
import 'package:a015_fresh_basket/widget/widget_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CartScreenAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CartScreenImage(),
        CartScreenMessage(),
      ],
    );
  }
}

class CartScreenImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.fill,
      image: AssetImage('assets/appbar/cart.png'),
    );
  }
}

class CartScreenMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Center(
        child: TextWidget(
          tText: 'Cart',
          tCenter: true,
          tSize: 30,
          tTitle: true,
          tColor: Colors.white,
        ),
      ),
    );
  }
}

class CartScreenProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return cartItems.length < 1
        ? TextWidget(
            tText: "Nothing in cart",
            tTitle: true,
            tSize: 20,
            tCenter: true,
            tColor: themeData.colorScheme.primary,
          )
        : Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () async {
                    Map data = await getItemDetailsID(
                        cartItems.elementAt(index).toString());

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailViewBody(
                          source: data["product_url"],
                          ID: cartItems.elementAt(index).toString(),
                          data: data,
                          name: data["product_name"],
                        ),
                      ),
                    );
                  },
                  child: ProductItems(
                    cartItems.elementAt(index).toString(),
                  ),
                );
              },
            ),
          );
  }
}

class CartScreenProductPrice extends StatefulWidget {
  @override
  State<CartScreenProductPrice> createState() => _CartScreenProductPriceState();
}

class _CartScreenProductPriceState extends State<CartScreenProductPrice> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    NumberFormat formatter = NumberFormat("##,##,000");
    return cartItems.length > 1
        ? DecoratedBox(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300],
                  blurRadius: 1,
                )
              ],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                      ),
                    ),
                    alignment: Alignment.center,
                    height: 60.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: themeData.colorScheme.primary),
                        ),
                        ValueListenableBuilder(
                          valueListenable: billValue,
                          builder: (context, billValue, child) {
                            return child;
                          },
                          child: Builder(
                            builder: (context) {
                              int total = 0;
                              return FutureBuilder<int>(
                                future: getItemPrice(cartItems),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    total = total + snapshot.data;
                                    print(snapshot.data);
                                  }
                                  return Text(
                                    "Rs. ${formatter.format(total)}",
                                    style: TextStyle(
                                      color: themeData.colorScheme.primary,
                                      fontSize: 20.sp,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      if (!buyNow) {
                        buyNow = true;
                        setState(() {});
                      }
                    },
                    onTapUp: (value) {
                      Future.delayed(Duration(seconds: 4), () {
                        buyNow = false;
                        setState(() {});
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: themeData.colorScheme.primary,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            bottomRight: Radius.circular(50)),
                      ),
                      alignment: Alignment.center,
                      height: 60.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Buy",
                            style: TextStyle(
                              fontSize: 20.sp,
                              color: themeData.colorScheme.background,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        : Container();
  }
}

class CartScreenProductBuyNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buyNow
        ? Container(
            padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            color: Colors.pink[100],
            child: Text(
              "Sorry! Currently we are not serving due to covid pandemic",
              textAlign: TextAlign.center,
            ),
          )
        : Container();
  }
}
