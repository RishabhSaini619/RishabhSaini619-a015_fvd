import 'package:a015_fvd/global_firebase.dart';
import 'package:a015_fvd/global_theme.dart';
import 'package:a015_fvd/screen/screen_nav.dart';
import 'package:a015_fvd/screen/screen_splash/screen_splash.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

bool isFirebaseLoading = false;
double loadingStatus = 0.04;

class Fetch extends StatefulWidget {

  @override
  State<Fetch> createState() => _FetchState();
}

class _FetchState extends State<Fetch> {
  @override
  void initState() {
    fetchItems();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, theme, child) {
        // statusBarColor(context);
        return ScreenUtilInit(
            designSize: const Size(360, 690),
            builder: (context, child) {
              return MaterialApp(
                theme: ThemeData(
                  colorScheme: ColorScheme.light(),
                  appBarTheme: AppBarTheme(
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: ColorScheme.light().primary),
                  ),
                ),
                darkTheme: ThemeData(
                  colorScheme: ColorScheme.dark(),
                  appBarTheme: AppBarTheme(
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: ColorScheme.dark().background),
                  ),
                ),
                themeMode: theme,
                debugShowCheckedModeBanner: false,
                home: isFirebaseLoading ? SplashScreen() : NavBarScreen(),
              );
            });
      },
      valueListenable: currentTheme,
    );
  }
  Future<void> fetchItems() async {
    setState(() {
      isFirebaseLoading = true;
    });
    loadingStatus = 0.158;
    setState(() {});
    await docIdList("Spicy");

    loadingStatus = 0.316;
    setState(() {});
    await docIdList("Leaf");

    loadingStatus = 0.475;
    setState(() {});
    await docIdList("Daily");

    loadingStatus = 0.633;
    setState(() {});
    await docIdList("Seeds");

    loadingStatus = 0.791;
    setState(() {});
    await docIdList("Fruits");

    loadingStatus = 0.98;
    setState(() {});
    await docIdList("Dairy");

    Set tempData = allDocumentsData.toSet();
    Set tempID = allDocumentIDs.toSet();

    allDocumentsData = tempData.toList();
    allDocumentIDs = tempID.toList();

    setState(() {
      loadingStatus = 1;
      isFirebaseLoading = false;
    });
  }

  Future<List> docIdList(String category) async {
    QuerySnapshot querySnapshot = await productsCollection
        .where("Products_Categories", arrayContainsAny: [category]).get();
    Map map;
    for (var element in querySnapshot.docs) {
      allDocumentIDs.add(element.id);
      DocumentSnapshot<Map> doc =
      await productsCollection.doc(element.id).get();
      map = doc.data();
      allDocumentsData.add(map);

      if (category == "Fruits") {
        fruits.add(map);
        fruitsID.add(element.id);
        allProducts.add(map);
        allProductsID.add(element.id);
      } else if (category == "Vegetables") {
        vegetables.add(map);
        allProducts.add(map);
        allProductsID.add(element.id);
        vegetablesID.add(element.id);
      } else if (category == "Herbs") {
        herbs.add(map);
        allProducts.add(map);
        allProductsID.add(element.id);
        herbsID.add(element.id);
      } else if (category == "Nuts") {
        nuts.add(map);
        allProducts.add(map);
        allProductsID.add(element.id);
        nutsID.add(element.id);
      } else if (category == "Spices") {
        spices.add(map);
        allProducts.add(map);
        allProductsID.add(element.id);
        spicesID.add(element.id);
      } else if (category == "Grains") {
        grains.add(map);
        allProducts.add(map);
        allProductsID.add(element.id);
        grainsID.add(element.id);
      } else if (category == "Daily") {
        daily.add(map);
        allProducts.add(map);
        allProductsID.add(element.id);
        dailyID.add(element.id);
      }

      print("${map["Product_Name"]}");
    }

    print("\n\n $category \n\n $map \n\n");
  }
}
