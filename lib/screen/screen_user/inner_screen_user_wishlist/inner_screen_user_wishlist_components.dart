import 'package:a015_fresh_basket/global/global_firebase.dart';
import 'package:a015_fresh_basket/global/global_variable.dart';
import 'package:a015_fresh_basket/screen/screen_inner/inner_screen_product_detail_view/inner_screen_product_detail_view.dart';
import 'package:a015_fresh_basket/screen/screen_inner/inner_screen_product_detail_view/inner_screen_product_detail_view_components.dart';
import 'package:a015_fresh_basket/screen/screen_inner/widget_product_item.dart';
import 'package:flutter/material.dart';

class WishListScreenAppBarImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image(
      fit: BoxFit.fitHeight,
      image: AssetImage('assets/appbar/wishlist.png'),
    );
  }
}

class WishListScreenProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return wishListItems.length < 1
        ? Text("Nothing in WishList")
        : Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(),
              itemCount: wishListItems.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () async {
                    Map data = await getItemDetailsID(
                        wishListItems.elementAt(index).toString());

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailViewBody(
                          source: data["product_url"],
                          ID: wishListItems.elementAt(index).toString(),
                          data: data,
                          name: data["product_name"],
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
          );
  }
}
