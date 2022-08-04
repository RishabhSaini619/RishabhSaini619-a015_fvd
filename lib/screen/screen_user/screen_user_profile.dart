import 'package:a015_fvd/widget/widget_text_widget.dart';
import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextWidget(
        tText: " User Screen ",
      ),
    );
  }
}
