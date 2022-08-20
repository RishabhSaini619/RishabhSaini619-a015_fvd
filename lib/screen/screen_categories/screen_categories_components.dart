import 'package:a015_fresh_basket/global/global_firebase.dart';
import 'package:a015_fresh_basket/global/global_variable.dart';
import 'package:a015_fresh_basket/screen/screen_inner/inner_screen_product_detail_view/inner_screen_product_detail_view.dart';
import 'package:a015_fresh_basket/screen/screen_inner/inner_screen_viewall/inner_screen_viewall.dart';
import 'package:a015_fresh_basket/screen/screen_inner/inner_screen_viewall/inner_screen_viewall_components.dart';
import 'package:a015_fresh_basket/widget/widget_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesScreenAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CategoriesScreenImage(),
        CategoriesScreenMessage(),
      ],
    );
  }
}

class CategoriesScreenImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.fill,
      image: AssetImage('assets/appbar/categories.png'),
    );
  }
}

class CategoriesScreenMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Center(
        child: TextWidget(
          tText: 'Categories',
          tCenter: true,
          tSize: 30,
          tTitle: true,
          tColor: Colors.white,
        ),
      ),
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

    return Flexible(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        // shrinkWrap: true,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: allCategories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
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
              margin: EdgeInsets.fromLTRB(10, 10, 10,10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    allCategories[index]["image"],
                    height: 100,
                    width: 100,
                    color: themeData.colorScheme.primary),
                  SizedBox(width: 20),
                  TextWidget(
                    tText: "${allCategories[index]["name"]}",
                    tColor: themeData.colorScheme.primary,
                    tSize: 20,
                    tCenter: true,
                    tTitle: true,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
