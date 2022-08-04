import 'package:a015_fvd/global/global_variable.dart';
import 'package:a015_fvd/screen/screen_auth/screen_user_login/screen_user_login_components.dart';
import 'package:flutter/material.dart';

class UserLoginScreen extends StatefulWidget {
  @override
  State<UserLoginScreen> createState() => _UserLoginScreenState();
}

class _UserLoginScreenState extends State<UserLoginScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    animationControllerUserLogin = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    animationControllerUserLogin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              UserLoginScreenImage(),
              UserLoginScreenMessage(),
              UserLoginScreenFields(),
            ],
          ),
        ],
      ),
    );
  }
}
