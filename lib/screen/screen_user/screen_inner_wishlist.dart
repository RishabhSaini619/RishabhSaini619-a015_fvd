import 'package:a015_fvd/global_firebase.dart';
import 'package:a015_fvd/global_variable.dart';
import 'package:a015_fvd/screen/screen_inner/screen_inner_product_detail_view.dart';
import 'package:a015_fvd/screen/screen_inner/widget_product_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WishListScreen extends StatefulWidget {
  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationControllerWishList;
  bool buyNow = false;

  @override
  void initState() {
    setState(() {});
    super.initState();
    _animationControllerWishList = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _animationControllerWishList.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: wishListItems.length < 1
              ? Text("Nothing in WishList")
              : Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: wishListItems.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () async {
                          String url = await loadImage(context,
                              wishListItems.elementAt(index).toString());
                          Map data = await _getItemDetails(
                              wishListItems.elementAt(index).toString());

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailView(
                                source: url,
                                ID: wishListItems.elementAt(index).toString(),
                                data: data,
                                name: data["Product_name"],
                              ),
                            ),
                          );
                        },
                        child: ProductItems(
                          wishListItems.elementAt(index).toString(),
                        ),
                      );
                    },
                  ),
                ),
        ),
      ),
    );
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
