// ignore_for_file: must_be_immutable

import 'package:a015_fresh_basket/widget/widget_add_to_cart.dart';
import 'package:a015_fresh_basket/widget/widget_add_to_wishlist.dart';
import 'package:a015_fresh_basket/widget/widget_inner_product_thumbnail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewAllAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ViewAllAppBarImage(),
        ViewAllAppBarTitle(),
      ],
    );
  }
}

class ViewAllAppBarImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image(
      fit: BoxFit.fitHeight,
      image: AssetImage('assets/appbar/yellow.png'),
    );
  }
}

class ViewAllAppBarTitle extends StatefulWidget {
  final String categoryTitle;

  ViewAllAppBarTitle({this.categoryTitle});

  @override
  State<ViewAllAppBarTitle> createState() => _ViewAllAppBarTitleState();
}

class _ViewAllAppBarTitleState extends State<ViewAllAppBarTitle> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("${widget.categoryTitle}"),
    );
  }
}

class ViewAlBody extends StatefulWidget {
  final String categoryTitle;
  final List<Map> category;
  final List<String> idList;
  ViewAlBody({this.categoryTitle, this.category, this.idList});
  List<String> imageURL = [];

  @override
  State<ViewAlBody> createState() => _ViewAlBodyState();
}

class _ViewAlBodyState extends State<ViewAlBody> {
  void initState() {
    viewAlBodyGetImageList();
    print("${widget.imageURL}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - 24) / 3.5;
    final double itemWidth = size.width / 2;
    return GridView.count(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: (itemWidth / itemHeight),
      scrollDirection: Axis.vertical,
      children: viewAlBodyGetList(),
    );
  }

  List<Widget> viewAlBodyGetList() {
    List<Widget> displayItems = [];
    for (int i = 0; i < widget.category.length; i++) {
      String ID = widget.idList[i];
      displayItems.add(
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProductThumbnail(
              name: widget.category[i]["product_name"],
              ID: ID,
              data: widget.category[i],
            ),
            Padding(
              padding: EdgeInsets.all(8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Rs. ${widget.category[i]["product_price"]}",
                    style: TextStyle(
                      fontSize: 12.h,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AddToCart(
                        ID,
                        width: 80,
                        height: 25,
                        fontSize: 12,
                      ),
                      AddToWishList(
                        ID,
                        width: 80,
                        height: 25,
                        fontSize: 12,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
    return displayItems;
  }

  Future<void> viewAlBodyGetImageList() async {
    for (int i = 0; i < widget.category.length; i++) {
      String ID = widget.idList[i];
      final url = "${widget.category[i]["product_url"]}";
    }
  }
}
