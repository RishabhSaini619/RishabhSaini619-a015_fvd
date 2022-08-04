import 'package:a015_fvd/global/global_firebase.dart';
import 'package:a015_fvd/global/global_variable.dart';
import 'package:a015_fvd/screen/screen_inner/screen_inner_product_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController _searchTextController = TextEditingController();
  List searchResults = [];

  @override
  void initState() {
    super.initState();
    animationControllerSearch = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    animationControllerSearch.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        // The search area here
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              5,
            ),
          ),
          child: Center(
            child: TextField(
              controller: _searchTextController,
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
                    _searchTextController.text = "";

                    setState(() {});
                  },
                ),
                hintText: 'Search...',
                hintStyle: TextStyle(
                  color: themeData.colorScheme.primary,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            ListView.builder(
              physics: ScrollPhysics(),
              itemCount: searchResults.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                int imageIndex = findIDUsingIndexWhere(
                  searchResults[index]["product_name"],
                );
                return InkWell(
                  onTap: () async {
                    String url =
                        await loadImage(context, allDocumentIDs[imageIndex]);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailView(
                          ID: allDocumentIDs[imageIndex],
                          name: searchResults[index]["product_name"],
                          data: searchResults[index],
                          source: url,
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
            ),
          ],
        ),
      ),
    );
  }
}
