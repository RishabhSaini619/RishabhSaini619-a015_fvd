import 'package:a015_fvd/global/global_variable.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
    return Scaffold();
  }
}
