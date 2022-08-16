import 'package:a015_fresh_basket/screen/screen_categories/screen_categories_components.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationControllerCategories;

  @override
  void initState() {
    super.initState();
    _animationControllerCategories = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _animationControllerCategories.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          CategoriesScreenAppBarImage(),
          CategoriesScreenList(),
        ],
      ),
    );
  }
}

//
