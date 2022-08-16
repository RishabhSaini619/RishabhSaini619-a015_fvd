// ignore_for_file: must_be_immutable

import 'package:a015_fresh_basket/screen/screen_inner/inner_screen_viewall/inner_screen_viewall_components.dart';
import 'package:flutter/material.dart';

class ViewAllScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ViewAllAppBar(),
            ViewAlBody(),
          ],
        ),
      ),
    );
  }
}
