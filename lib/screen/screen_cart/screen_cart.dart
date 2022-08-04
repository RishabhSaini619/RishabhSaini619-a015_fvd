import 'package:a015_fvd/global_firebase.dart';
import 'package:a015_fvd/global_variable.dart';
import 'package:a015_fvd/screen/screen_inner/screen_inner_product_detail_view.dart';
import 'package:a015_fvd/screen/screen_inner/widget_product_item.dart';
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
  AnimationController _animationControllerCart;
  bool buyNow = false;

  @override
  void initState() {
    setState(() {});
    super.initState();
    _animationControllerCart = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _animationControllerCart.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    NumberFormat formatter = NumberFormat("##,##,000");

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              cartItems.length < 1
                  ? Text("Nothing in cart")
                  : Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () async {
                              String url = await loadImage(context,
                                  cartItems.elementAt(index).toString());
                              Map data = await _getItemDetails(
                                  cartItems.elementAt(index).toString());

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailView(
                                    source: url,
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
                    ),
              cartItems.length > 1
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                          future: _getItemValue(cartItems),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.done) {
                                              total = total + snapshot.data;
                                              print(snapshot.data);
                                            }
                                            return Text(
                                              "Rs. ${formatter.format(total)}",
                                              style: TextStyle(
                                                color: themeData
                                                    .colorScheme.primary,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                  : Container(),
              buyNow
                  ? Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.pink[100],
                      child: Text(
                        "Sorry! Currently we are not serving due to covid pandemic",
                        textAlign: TextAlign.center,
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Future<int> _getItemValue(Set<dynamic> ID) async {
    int total = 0;
    for (int i = 0; i < ID.length; i++) {
      DocumentSnapshot doc =
          await productsCollection.doc(ID.elementAt(i)).get();
      Map map = doc.data();
      total += map["product_price"];
    }
    return total;
  }

  Future<Map> _getItemDetails(String ID) async {
    DocumentSnapshot doc = await productsCollection.doc(ID).get();
    return doc.data();
  }

  Future<String> loadImage(BuildContext context, String ID) async {
    return await FirebaseStorage.instance
        .ref()
        .child("$ID.jpg")
        .getDownloadURL();
  }
}
