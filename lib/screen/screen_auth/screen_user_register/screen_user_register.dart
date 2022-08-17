import 'package:a015_fresh_basket/global/global_variable.dart';
import 'package:a015_fresh_basket/screen/screen_auth/screen_user_register/screen_user_register_components.dart';
import 'package:flutter/material.dart';

class UserRegisterScreen extends StatefulWidget {
  @override
  State<UserRegisterScreen> createState() => _UserRegisterScreenState();
}

class _UserRegisterScreenState extends State<UserRegisterScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    animationControllerUserRegister = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    animationControllerUserRegister.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          UserRegisterScreenAppBar(),
          UserRegisterScreenFields(),
        ],
      ),
    );
  }
}
