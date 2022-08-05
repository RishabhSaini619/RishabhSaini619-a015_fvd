import 'package:a015_fvd/global/global_firebase.dart';
import 'package:a015_fvd/global/global_variable.dart';
import 'package:a015_fvd/screen/screen_inner/inner_screen_product_detail_view/inner_screen_product_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SearchScreenAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SearchScreenAppBarImage(),
        SearchScreenAppBarSearchField(),
      ],

    );
  }
}

class SearchScreenAppBarImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image(
      fit: BoxFit.fitHeight,
      image: AssetImage('assets/appbar/search.png'),
    );
  }
}

class SearchScreenAppBarSearchField extends StatefulWidget {

  @override
  State<SearchScreenAppBarSearchField> createState() => _SearchScreenAppBarSearchFieldState();
}

class _SearchScreenAppBarSearchFieldState extends State<SearchScreenAppBarSearchField> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return TextField(
      controller: searchController,
      cursorColor: themeData.colorScheme.primary,
      onChanged: (value) {
        searchResults = allDocumentsData
            .where((element) => (element["product_name"].toLowerCase())
            .contains(value.toLowerCase()))
            .toSet()
            .toList();

        setState(() {});
      },
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          color: themeData.colorScheme.primary,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            Icons.clear,
          ),
          color: themeData.colorScheme.primary,
          onPressed: () {
            searchController.text = "";

            setState(() {});
          },
        ),
        hintText: 'Search...',
        hintStyle: TextStyle(
          color: themeData.colorScheme.primary,
        ),
        border: InputBorder.none,
      ),
    );
  }
}

class SearchScreenResult extends StatefulWidget {
  @override
  State<SearchScreenResult> createState() => _SearchScreenResultState();
}

class _SearchScreenResultState extends State<SearchScreenResult> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return ListView.builder(
      physics: ScrollPhysics(),
      itemCount: searchResults.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        int imageIndex = findIDUsingIndexWhere(
          searchResults[index]["product_name"],
        );
        return InkWell(
          onTap: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailView(
                  ID: allDocumentIDs[imageIndex],
                  name: searchResults[index]["product_name"],
                  data: searchResults[index],
                  source: searchResults[index]["product_url"],
                ),
              ),
            );
          },
          child: Container(
            height: 50.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300],
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(
              vertical: 8.h,
              horizontal: 20.h,
            ),
            margin: EdgeInsets.symmetric(
              vertical: 2.h,
              horizontal: 20.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${searchResults[index]["product_name"]}",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.h,
                    color: themeData.colorScheme.primary,
                  ),
                ),
                Text(
                  "Rs. ${searchResults[index]["product_price"]}",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.h,
                    color: themeData.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

