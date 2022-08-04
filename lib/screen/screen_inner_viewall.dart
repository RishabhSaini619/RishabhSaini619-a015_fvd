import 'package:a015_fvd/screen/screen_inner_product_thumbnail.dart';
import 'package:a015_fvd/widget_add_to_cart.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewAllScreen extends StatefulWidget {
  @override
  State<ViewAllScreen> createState() => _ViewAllScreenState();

  final String categoryTitle;
  final List<Map> category;
  final List<String> idList;
  List<String> imageURL = [];

  ViewAllScreen({this.categoryTitle, this.category, this.idList});
}

bool isImageLoading = false;

class _ViewAllScreenState extends State<ViewAllScreen> {
  @override
  void initState() {
    getImageList();
    print("${widget.imageURL}");
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - 24) / 3.5;
    final double itemWidth = size.width / 2;

    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.categoryTitle}"),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0.h),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.count(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              childAspectRatio: (itemWidth / itemHeight),
              scrollDirection: Axis.vertical,
              children: getList(),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getImageList() async {
    for (int i = 0; i < widget.category.length; i++) {
      String ID = widget.idList[i];
      final url = await FirebaseStorage.instance
          .ref()
          .child("$ID.jpg")
          .getDownloadURL();

      widget.imageURL.add("$url");
    }
  }

  List<Widget> getList() {
    List<Widget> displayItems = [];
    for (int i = 0; i < widget.category.length; i++) {
      String ID = widget.idList[i];
      displayItems.add(
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProductThumbnail(
              name: widget.category[i]["vegetable_name"],
              ID: ID,
              data: widget.category[i],
            ),
            Padding(
              padding: EdgeInsets.all(8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Rs. ${widget.category[i]["vegetable_price"]}",
                    style: TextStyle(
                      fontSize: 12.h,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AddToCart(
                    ID,
                    width: 80,
                    height: 25,
                    fontSize: 12,
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
}