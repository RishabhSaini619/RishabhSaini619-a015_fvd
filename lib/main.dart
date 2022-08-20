import 'package:a015_fresh_basket/global/global_firebase.dart';
import 'package:a015_fresh_basket/global/global_variable.dart';
import 'package:a015_fresh_basket/widget/widget_fetch.dart';
import 'package:a015_fresh_basket/screen/screen_home/screen_home.dart';
import 'package:a015_fresh_basket/screen/screen_navigatin_bar/screen_nav.dart';
import 'package:a015_fresh_basket/screen/screen_splash/screen_splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: 'AIzaSyC_61VH6q-rQB5emiF1Sqot7vNW4MWUEpU',
        appId: '1:531872287724:web:53e6376aba11e0bbd08ec9',
        messagingSenderId: '531872287724',
        projectId: 'a015-fvd',
        storageBucket: 'a015-fvd.appspot.com',
      ),
    );
  } catch (e) {
    print("Unable to load web");
    print(e);
  }

  await ScreenUtil.ensureScreenSize();
  userPreferences = await SharedPreferences.getInstance();

  try {
    currentUser = userPreferences.getString("userID").toString();
    print("Successfully fetched currentUser from local storage");
    print("currentUser is $currentUser");
  } catch (e) {
    print("Unable to load current user");
    print(e);
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fresh Basket',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}
