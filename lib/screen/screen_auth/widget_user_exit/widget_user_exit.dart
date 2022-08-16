import 'package:a015_fresh_basket/global/global_firebase.dart';
import 'package:a015_fresh_basket/screen/screen_auth/screen_user_login/screen_user_login.dart';
import 'package:flutter/material.dart';

class UserExit extends StatefulWidget {
  @override
  State<UserExit> createState() => _UserExitState();
}

class _UserExitState extends State<UserExit>
    {
  @override
  void initState() {
    super.initState();
    userCredential = null;
    currentUser = null;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => UserLoginScreen(),
          ),
          (route) => false);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
