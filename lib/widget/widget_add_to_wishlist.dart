import 'package:a015_fresh_basket/global/global_firebase.dart';
import 'package:a015_fresh_basket/global/global_variable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddToWishList extends StatefulWidget {
  @override
  State<AddToWishList> createState() => _AddToWishListState();

  int height;
  int width;
  int fontSize;
  String ID;

  AddToWishList(
    this.ID, {
    this.height,
    this.width,
    this.fontSize,
  });
}

class _AddToWishListState extends State<AddToWishList> {
  bool addedToWishList = false;
  bool addToWishListLoading = false;

  initState() {
    addedToWishList = validateWishList(widget.ID);
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
    return addToWishListLoading
        ? Center(
            child: SizedBox(
              height: 30.h,
              width: 30.h,
              child: CircularProgressIndicator(),
            ),
          )
        : GestureDetector(
            onTapDown: (details) {
              isWishListPressed = true;
              setState(() {});
            },
            onTapCancel: () {
              isWishListPressed = false;
              setState(() {});
            },
            onTapUp: (details) {
              isWishListPressed = false;
              setState(() {});
            },
            onTap: () async {
              if (addedToWishList) {
                setState(() {
                  wishListItems.remove(widget.ID);
                  addedToWishList = false;
                });
              } else {
                setState(() {
                  wishListItems.add(widget.ID);
                  addedToWishList = true;
                });
              }
              wishListItemCount.value = wishListItems.length;
              await updateWishListItems();
            },
            child: Container(
              alignment: Alignment.center,
              height: isWishListPressed
                  ? (widget.height == null)
                      ? 27.h
                      : (widget.height.h - 2)
                  : (widget.height == null)
                      ? 30.h
                      : widget.height.h,
              width: isWishListPressed
                  ? (widget.width == null)
                      ? 97.h
                      : (widget.width.h - 2)
                  : (widget.width == null)
                      ? 100.h
                      : widget.width.h,
              decoration: BoxDecoration(
                color: addedToWishList
                    ? Colors.grey
                    : themeData.colorScheme.secondary,
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
                    Icons.favorite,
                    color: Colors.white,
                    size:
                        (widget.fontSize == null) ? 18.sp : widget.fontSize.sp,
                  ),
                  Text(
                    addedToWishList ? "Remove" : "Add to WishList",
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

  bool validateWishList(String ID) {
    if (wishListItems.contains(ID)) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> updateWishListItems() async {
    setState(() {
      addToWishListLoading = true;
    });
    Map<String, dynamic> data = {
      "WishList": wishListItems.toList(),
    };

    if (currentUser != null) {
      DocumentSnapshot documentSnapshot =
          await userCollection.doc(currentUser).get();
      try {
        userCollection.doc(currentUser).update(data);
        print("Successfully updated Wishlist items to Firebase");
        print(wishListItems);
      } catch (e) {
        print("Failed update WishList items to Firebase");
        print(e);
      }
    }
    setState(
      () {
        addToWishListLoading = false;
      },
    );
  }
}
