import 'package:a015_fvd/global_firebase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FruitsContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Column(
      children: [

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(8.h),
            child: Text(
              "Fruits",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15.sp,
                  letterSpacing: 0.5),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.h),
            child: ElevatedButton(
              onPressed: () {
                return Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SeeAllScreen(
                        categoryTitle: "Fruits",
                        category: fruits,
                        idList: fruitsID),
                  ),
                );
              },
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(
                    themeData.colorScheme.primary.withOpacity(0.1)),
              ),
              child: Text(
                "See all".toUpperCase(),
                style: TextStyle(color: themeData.colorScheme.primary),
              ),
            ),
          )
        ],
      ),
      SizedBox(
        height: 150.h,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: fruits.length > 3 ? 3 : fruits.length,
          itemBuilder: (context, index) {
            String productName = fruits[index]["product_name"];
            return DisplayProductThumbnail(
              name: productName,
              ID: fruitsID[index],
              data: fruits[index],
            );
          },
        ),
      ),
  ],
    );
  }
}

class VegetablesContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Column(
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(8.h),
              child: Text(
                "Vegetable",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15.sp,
                    letterSpacing: 0.5),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.h),
              child: ElevatedButton(
                onPressed: () {
                  return Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SeeAllScreen(
                          categoryTitle: "Vegetable",
                          category: vegetables,
                          idList: vegetablesID),
                    ),
                  );
                },
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                      themeData.colorScheme.primary.withOpacity(0.1)),
                ),
                child: Text(
                  "See all".toUpperCase(),
                  style: TextStyle(color: themeData.colorScheme.primary),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 150.h,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: vegetables.length > 3 ? 3 : vegetables.length,
            itemBuilder: (context, index) {
              String productName = vegetables[index]["product_name"];
              return DisplayProductThumbnail(
                  name: productName,
                  ID: vegetablesID[index],
                  data: vegetables[index]);
            },
          ),
        ),
      ],
    );
  }
}

class DailyContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Column(
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(8.h),
              child: Text(
                "Daily",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15.sp,
                    letterSpacing: 0.5),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.h),
              child: ElevatedButton(
                onPressed: () {
                  return Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SeeAllScreen(
                          categoryTitle: "Daily",
                          category: daily,
                          idList: dailyID),
                    ),
                  );
                },
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                      themeData.colorScheme.primary.withOpacity(0.1)),
                ),
                child: Text(
                  "See all".toUpperCase(),
                  style: TextStyle(color: themeData.colorScheme.primary),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 150.h,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: daily.length > 3 ? 3 : daily.length,
            itemBuilder: (context, index) {
              String productName = daily[index]["product_name"];
              return DisplayProductThumbnail(
                  name: productName,
                  ID: dailyID[index],
                  data: daily[index]);
            },
          ),
        ),
      ],
    );
  }
}
class GrainsContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Column(
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(8.h),
              child: Text(
                "Grains",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15.sp,
                    letterSpacing: 0.5),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.h),
              child: ElevatedButton(
                onPressed: () {
                  return Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SeeAllScreen(
                          categoryTitle: "Grains",
                          category: grains,
                          idList: grainsID),
                    ),
                  );
                },
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                      themeData.colorScheme.primary.withOpacity(0.1)),
                ),
                child: Text(
                  "See all".toUpperCase(),
                  style: TextStyle(color: themeData.colorScheme.primary),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 150.h,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: grains.length > 3 ? 3 : grains.length,
            itemBuilder: (context, index) {
              String productName = grains[index]["product_name"];
              return DisplayProductThumbnail(
                name: productName,
                ID: grainsID[index],
                data: grains[index],
              );
            },
          ),
        ),
      ],
    );
  }
}

class OtherCategories extends StatelessWidget {
  List<Map> otherCategories;

  OtherCategories(this.otherCategories);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    bool isHovered = false;

    return SizedBox(
      height: 80.h,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: otherCategories.length,
        itemBuilder: (context, index) {
          return Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SeeAllScreen(
                        categoryTitle: otherCategories[index]["name"],
                        category: otherCategories[index]["category"],
                        idList: otherCategories[index]["idList"],
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
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        otherCategories[index]["image"],
                        height: 20.0,
                        width: 20.0,
                        allowDrawingOutsideViewBox: true,
                        color: themeData.colorScheme.primary.withOpacity(0.6),
                      ),
                      SizedBox(width: 20),
                      Text(
                        "${otherCategories[index]["name"]}",
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
    );
  }
}


