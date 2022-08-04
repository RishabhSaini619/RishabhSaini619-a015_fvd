import 'package:a015_fvd/global_variable.dart';
import 'package:a015_fvd/widget/widget_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchScreen extends StatefulWidget {

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextWidget(
        tText: " Search Screen ",
      ),
    );
  }
}
