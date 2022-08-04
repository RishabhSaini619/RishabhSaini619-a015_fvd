import 'package:a015_fvd/global/global_firebase.dart';
import 'package:a015_fvd/global/global_variable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddToCart extends StatefulWidget {
  @override
  State<AddToCart> createState() => _AddToCartState();

  int height;
  int width;
  int fontSize;
  String ID;

  AddToCart(
    this.ID, {
    this.height,
    this.width,
    this.fontSize,
  });
}

class _AddToCartState extends State<AddToCart> {
  bool addedToCart = false;
  bool addToCartLoading = false;

  initState() {
    addedToCart = validateCart(widget.ID);
    super.initState();
  }

  @override
  void dispose() {
    widget.height = null;
    widget.width = null;
    widget.fontSize = null;
    widget.ID = null;
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return addToCartLoading
        ? Center(
            child: SizedBox(
              height: 30.h,
              width: 30.h,
              child: CircularProgressIndicator(),
            ),
          )
        : GestureDetector(
            onTapDown: (details) {
              isCartPressed = true;
              setState(() {});
            },
            onTapCancel: () {
              isCartPressed = false;
              setState(() {});
            },
            onTapUp: (details) {
              isCartPressed = false;
              setState(() {});
            },
            onTap: () async {
              if (addedToCart) {
                setState(() {
                  cartItems.remove(widget.ID);
                  addedToCart = false;
                });
              } else {
                setState(() {
                  cartItems.add(widget.ID);
                  addedToCart = true;
                });
              }
              cartItemCount.value = cartItems.length;
              await updateCartItems();
            },
            child: Container(
              alignment: Alignment.center,
              height: isCartPressed
                  ? (widget.height == null)
                      ? 27.h
                      : (widget.height.h - 2)
                  : (widget.height == null)
                      ? 30.h
                      : widget.height.h,
              width: isCartPressed
                  ? (widget.width == null)
                      ? 97.h
                      : (widget.width.h - 2)
                  : (widget.width == null)
                      ? 100.h
                      : widget.width.h,
              decoration: BoxDecoration(
                color:
                    addedToCart ? Colors.grey : themeData.colorScheme.secondary,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[300],
                    spreadRadius: 1,
                    blurRadius: 10,
                  )
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                    size:
                        (widget.fontSize == null) ? 18.sp : widget.fontSize.sp,
                  ),
                  Text(
                    addedToCart ? "Remove" : "Add to Cart",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: (widget.fontSize == null)
                            ? 16.sp
                            : widget.fontSize.sp),
                  ),
                ],
              ),
            ),
          );
  }

  bool validateCart(String ID) {
    if (cartItems.contains(ID)) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> updateCartItems() async {
    setState(() {
      addToCartLoading = true;
    });
    Map<String, dynamic> data = {
      "cart": cartItems.toList(),
    };

    if (currentUser != null) {
      DocumentSnapshot documentSnapshot =
          await userCollection.doc(currentUser).get();
      try {
        userCollection.doc(currentUser).update(data);
        print("Successfully updated cart items to Firebase");
        print(cartItems);
      } catch (e) {
        print("Failed update cart items to Firebase");
        print(e);
      }
    }
    setState(() {
      addToCartLoading = false;
    });
  }
}
