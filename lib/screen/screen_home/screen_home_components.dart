import 'package:a015_fresh_basket/global/global_firebase.dart';
import 'package:a015_fresh_basket/global/global_variable.dart';
import 'package:a015_fresh_basket/screen/screen_inner/inner_screen_viewall/inner_screen_viewall_components.dart';
import 'package:a015_fresh_basket/widget/widget_inner_product_thumbnail.dart';
import 'package:a015_fresh_basket/screen/screen_inner/inner_screen_viewall/inner_screen_viewall.dart';
import 'package:a015_fresh_basket/widget/widget_text_widget.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreenBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.20.h,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.asset(
            Offers.offerImages[index],
            fit: BoxFit.fill,
          );
        },
        autoplay: true,
        itemCount: Offers.offerImages.length,
        pagination: SwiperPagination(
          alignment: Alignment.bottomCenter,
          builder: DotSwiperPaginationBuilder(
            color: Colors.white,
            activeColor: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}

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
              child: TextWidget(
                tText: "Fruits",
                tSize: 20,
                tTitle: true,
                tColor: themeData.colorScheme.primary,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.h),
              child: ElevatedButton(
                onPressed: () {
                  return Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewAlBody(
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
                child: TextWidget(
                  tText: "View all".toUpperCase(),
                  tSize: 15,
                  tColor: themeData.colorScheme.primary,
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
              return ProductThumbnail(
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
              child: TextWidget(
                tText: "Vegetable",
                tSize: 20,
                tTitle: true,
                tColor: themeData.colorScheme.primary,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.h),
              child: ElevatedButton(
                onPressed: () {
                  return Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewAlBody(
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
                child: TextWidget(
                  tText: "View all".toUpperCase(),
                  tSize: 15,
                  tColor: themeData.colorScheme.primary,
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
              return ProductThumbnail(
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
              child: TextWidget(
                tText: "Daily",
                tSize: 20,
                tTitle: true,
                tColor: themeData.colorScheme.primary,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.h),
              child: ElevatedButton(
                onPressed: () {
                  return Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewAlBody(
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
                child: TextWidget(
                  tText: "View all".toUpperCase(),
                  tSize: 15,
                  tColor: themeData.colorScheme.primary,
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
              return ProductThumbnail(
                  name: productName, ID: dailyID[index], data: daily[index]);
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
              child: TextWidget(
                tText: "Grains",
                tSize: 20,
                tTitle: true,
                tColor: themeData.colorScheme.primary,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.h),
              child: ElevatedButton(
                onPressed: () {
                  return Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewAlBody(
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
                child: TextWidget(
                  tText: "View all".toUpperCase(),
                  tSize: 15,
                  tColor: themeData.colorScheme.primary,
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
              return ProductThumbnail(
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
