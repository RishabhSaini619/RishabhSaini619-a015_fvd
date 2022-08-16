import 'package:a015_fresh_basket/global/global_theme.dart';
import 'package:a015_fresh_basket/global/global_variable.dart';
import 'package:a015_fresh_basket/screen/screen_cart/screen_cart.dart';
import 'package:a015_fresh_basket/screen/screen_categories/screen_categories.dart';
import 'package:a015_fresh_basket/screen/screen_home/screen_home.dart';
import 'package:a015_fresh_basket/screen/screen_search/screen_search.dart';
import 'package:a015_fresh_basket/screen/screen_user/screen_user_profile.dart';
import 'package:a015_fresh_basket/widget/widget_text_widget.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class NavigationBarScreen extends StatefulWidget {
  @override
  State<NavigationBarScreen> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBarScreen>
    with SingleTickerProviderStateMixin {
  int selectedScreenIndex = 0;
  final List<Map<String, dynamic>> NavigationScreen = [
    {'screen': SearchScreen(), 'title': 'Search'},
    {'screen': CategoriesScreen(), 'title': 'Categories'},
    {'screen': HomeScreen(), 'title': 'Home'},
    {'screen': CartScreen(), 'title': 'Cart'},
    {'screen': UserProfileScreen(), 'title': 'Profile'},
  ];
  void selectedScreen(int index) {
    setState(() {
      selectedScreenIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    animationControllerNavigationBar = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    animationControllerNavigationBar.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NavigationScreen[selectedScreenIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.shifting,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        currentIndex: selectedScreenIndex,
        unselectedItemColor: darkMode ? Colors.blueGrey : Colors.grey,
        selectedItemColor: darkMode ? Colors.white : Colors.lightBlue,
        onTap: selectedScreen,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              selectedScreenIndex == 0 ? IconlyBold.search : IconlyLight.search,
              size: 20,
            ),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              selectedScreenIndex == 1
                  ? IconlyBold.category
                  : IconlyLight.category,
              size: 20,
            ),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              selectedScreenIndex == 2 ? IconlyBold.home : IconlyLight.home,
              size: 20,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: ValueListenableBuilder(
                valueListenable: cartItemCount,
                builder: (context, count, child) {
                  return Badge(
                    toAnimate: true,
                    shape: BadgeShape.circle,
                    badgeColor: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                    position: BadgePosition.topEnd(
                      top: -15,
                      end: -18,
                    ),
                    badgeContent: FittedBox(
                      child: TextWidget(
                        tText: count.toString(),
                        tColor: Colors.white,
                        tSize: 15,
                      ),
                    ),
                    child: Icon(
                      selectedScreenIndex == 3
                          ? IconlyBold.buy
                          : IconlyLight.buy,
                      size: 20,
                    ),
                  );
                },
              ),
              label: "Cart"),
          BottomNavigationBarItem(
            icon: Icon(
              selectedScreenIndex == 4
                  ? IconlyBold.profile
                  : IconlyLight.profile,
              size: 20,
            ),
            label: "User",
          ),
        ],
      ),
    );
  }
}

