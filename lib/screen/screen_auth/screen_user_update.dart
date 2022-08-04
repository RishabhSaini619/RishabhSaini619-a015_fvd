import 'package:a015_fvd/global/global_variable.dart';
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
    return Scaffold();
  }
}
