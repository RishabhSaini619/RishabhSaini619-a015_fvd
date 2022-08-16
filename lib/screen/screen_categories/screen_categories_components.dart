import 'package:a015_fresh_basket/global/global_firebase.dart';
import 'package:a015_fresh_basket/global/global_variable.dart';
import 'package:a015_fresh_basket/screen/screen_inner/inner_screen_product_detail_view/inner_screen_product_detail_view.dart';
import 'package:a015_fresh_basket/screen/screen_inner/inner_screen_viewall/inner_screen_viewall.dart';
import 'package:a015_fresh_basket/screen/screen_inner/inner_screen_viewall/inner_screen_viewall_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesScreenAppBarImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image(
      fit: BoxFit.fitHeight,
      image: AssetImage('assets/appbar/categories.png'),
    );
  }
}

class CategoriesScreenList extends StatefulWidget {
  @override
  State<CategoriesScreenList> createState() => _CategoriesScreenListState();
}

class _CategoriesScreenListState extends State<CategoriesScreenList> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: allCategories.length,
      itemBuilder: (context, index) {
        return Center(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ViewAlBody(
                    categoryTitle: allCategories[index]["name"],
                    category: allCategories[index]["category"],
                    idList: allCategories[index]["idList"],
                  ),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(left: 5.h, right: 5.h),
              width: 130.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.h),
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey[100],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[300].withOpacity(0.3),
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 20, top: 15, bottom: 15),
                child: Column(
                  children: [
                    Image.asset(
                      allCategories[index]["image"],
                      height: 20.0,
                      width: 20.0,
                      color: themeData.colorScheme.primary.withOpacity(0.6),
                    ),
                    SizedBox(width: 20),
                    Text(
                      "${allCategories[index]["name"]}",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
