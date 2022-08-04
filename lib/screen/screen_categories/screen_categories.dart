import 'package:a015_fvd/global/global_firebase.dart';
import 'package:a015_fvd/screen/screen_home/screen_home_components.dart';
import 'package:a015_fvd/screen/screen_inner/screen_inner_viewall.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationControllerCategories;

  @override
  void initState() {
    super.initState();
    _animationControllerCategories = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _animationControllerCategories.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return Scaffold(
      body: SizedBox(
        height: 80.h,
        child: ListView.builder(
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
                        builder: (context) => ViewAllScreen(
                          categoryTitle: allCategories[index]["name"],
                          category: allCategories[index]["category"],
                          idList: allCategories[index]["idList"],
                        ),
                      ));
                },
                child: Container(
                  margin: EdgeInsets.only(left: 5.h, right: 5.h),
                  width: 130.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.h),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey[100]),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[300].withOpacity(0.3),
                          blurRadius: 5,
                          offset: Offset(0, 2))
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
        ),
      ),
    );
  }
}

//
