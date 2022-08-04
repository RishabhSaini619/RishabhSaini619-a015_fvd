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

