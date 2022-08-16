import 'package:a015_fresh_basket/global/global_firebase.dart';
import 'package:a015_fresh_basket/global/global_theme.dart';
import 'package:a015_fresh_basket/screen/screen_loading/screen_loading.dart';
import 'package:a015_fresh_basket/screen/screen_navigatin_bar/screen_nav.dart';
import 'package:a015_fresh_basket/screen/screen_splash/screen_splash.dart';
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
          designSize: Size(
            1080,
            2400,
          ),
          builder: (context, child) {
            return MaterialApp(
              theme: ThemeData(
                colorScheme: ColorScheme.light(),
                appBarTheme: AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: ColorScheme.light().primary,
                    systemNavigationBarColor: ColorScheme.light().background,
                  ),
                ),
              ),
              darkTheme: ThemeData(
                colorScheme: ColorScheme.dark(),
                appBarTheme: AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: ColorScheme.dark().primary,
                    systemNavigationBarColor: ColorScheme.dark().background,
                  ),
                ),
              ),
              themeMode: theme,
              debugShowCheckedModeBanner: false,
              home: isFirebaseLoading ? LoadingScreen() : NavigationBarScreen(),
            );
          },
        );
      },
      valueListenable: currentTheme,
    );
  }

  Future<void> fetchItems() async {
    setState(() {
      isFirebaseLoading = true;
    });
    loadingStatus = 0.1;
    setState(() {});
    await docIdList("Fruits");

    loadingStatus = 0.2;
    setState(() {});
    await docIdList("Vegetables");

    loadingStatus = 0.3;
    setState(() {});
    await docIdList("Herbs");

    loadingStatus = 0.4;
    setState(() {});
    await docIdList("Nuts");

    loadingStatus = 0.5;
    setState(() {});
    await docIdList("Spices");

    loadingStatus = 0.6;
    setState(() {});
    await docIdList("Grains");

    loadingStatus = 0.7;
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


}
