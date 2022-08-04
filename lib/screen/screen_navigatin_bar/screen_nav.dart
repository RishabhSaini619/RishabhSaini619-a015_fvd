import 'package:a015_fvd/global_theme.dart';
import 'package:a015_fvd/global_variable.dart';
import 'package:a015_fvd/screen/screen_cart/screen_cart.dart';
import 'package:a015_fvd/screen/screen_categories/screen_categories.dart';
import 'package:a015_fvd/screen/screen_home/screen_home.dart';
import 'package:a015_fvd/screen/screen_search/screen_search.dart';
import 'package:a015_fvd/screen/screen_user/screen_user_profile.dart';
import 'package:a015_fvd/widget/widget_text_widget.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class NavBarScreen extends StatefulWidget {
  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> _NavScreen = [
    {'screen': SearchScreen(), 'title': 'Search'},
    {'screen': CategoriesScreen(), 'title': 'Categories'},
    {'screen': HomeScreen(), 'title': 'Home'},
    {'screen': CartScreen(), 'title': 'Cart'},
    {'screen': UserProfileScreen(), 'title': 'Profile'},
  ];
  void _selectedScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _NavScreen[_selectedIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.shifting,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        unselectedItemColor: darkMode ? Colors.blueGrey : Colors.grey,
        selectedItemColor: darkMode ? Colors.white : Colors.lightBlue,
        onTap: _selectedScreen,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 0 ? IconlyBold.search : IconlyLight.search,
              size: 20,
            ),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 1 ? IconlyBold.category : IconlyLight.category,
              size: 20,
            ),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 2 ? IconlyBold.home : IconlyLight.home,
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
                      _selectedIndex == 3 ?
                      IconlyBold.buy :
                      IconlyLight.buy,
                      size: 20,
                    ),
                  );
                },
              ),
              label: "Cart"),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 4 ? IconlyBold.profile : IconlyLight.profile,
              size: 20,
            ),
            label: "User",
          ),
        ],
      ),
    );
  }
}
