import 'package:a015_fvd/global_firebase.dart';
import 'package:a015_fvd/screen/fetch.dart';
import 'package:a015_fvd/screen/screen_home/screen_home.dart';
import 'package:a015_fvd/screen/screen_nav.dart';
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

  var prefs = await SharedPreferences.getInstance();

  try {
    currentUser = prefs.getString("userID").toString();
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
