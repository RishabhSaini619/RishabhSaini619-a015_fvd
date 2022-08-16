import 'package:a015_fresh_basket/global/global_variable.dart';
import 'package:a015_fresh_basket/screen/screen_auth/screen_user_update/screen_user_update_components.dart';
import 'package:flutter/material.dart';

class UserUpdateScreen extends StatefulWidget {

  @override
  State<UserUpdateScreen> createState() => _UserUpdateScreenState();
}

class _UserUpdateScreenState extends State<UserUpdateScreen> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
    animationControllerUserUpdate = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    animationControllerUserUpdate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              UserUpdateScreenImage(),
              UserUpdateScreenMessage(),
              UserUpdateScreenFields(),
            ],
          ),
        ],
      ),
    );
  }
}
