import 'package:a015_fvd/global_firebase.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';




// CartStatus
bool isCartPressed = false;
Set<dynamic> cartItems = {};
ValueNotifier<int> cartItemCount = ValueNotifier(cartItems.length);
ValueNotifier<int> billValue = ValueNotifier(0);

// WishListStatus
bool isWishListPressed = false;
Set<dynamic> wishListItems = {};
ValueNotifier<int> wishListItemCount = ValueNotifier(wishListItems.length);

//
int findIDUsingIndexWhere(String name) {
  final index = allDocumentsData.indexWhere((element) =>
  (element["product_name"].toLowerCase()) == name.toLowerCase());
  return index;
}

Future<String> loadImage(BuildContext context, String ID) async {
  return await FirebaseStorage.instance
      .ref()
      .child("$ID.jpg")
      .getDownloadURL();
}
