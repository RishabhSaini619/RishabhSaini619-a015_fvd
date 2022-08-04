import 'package:a015_fvd/global/global_variable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
    return Scaffold();
  }
}
