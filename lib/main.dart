import 'package:a015_fvd/global/global_firebase.dart';
import 'package:a015_fvd/widget/widget_fetch.dart';
import 'package:a015_fvd/screen/screen_home/screen_home.dart';
import 'package:a015_fvd/screen/screen_navigatin_bar/screen_nav.dart';
import 'package:a015_fvd/screen/screen_splash/screen_splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  //await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SharedPreferences userPreferences;
  userPreferences = await SharedPreferences.getInstance();

  try {
    currentUser = userPreferences.getString("userID").toString();
    print("Successfully fetched currentUser from local storage");
    print("currentUser is $currentUser");
  } catch (e) {
    print("Unable to load current user");
    print(e);
  }

  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FVD',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
