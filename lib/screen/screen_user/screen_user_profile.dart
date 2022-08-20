import 'package:a015_fresh_basket/global/global_variable.dart';
import 'package:a015_fresh_basket/screen/screen_auth/widget_user_exit/widget_user_exit.dart';
import 'package:a015_fresh_basket/screen/screen_user/screen_user_profile_components.dart';
import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    animationControllerUserProfile = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    animationControllerUserProfile.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return Scaffold(
      body: Column(
        children: [
          UserProfileScreenAppBar(),

          UserProfileScreenThemeUiSwitch(),
          Divider(
            thickness: 2,
            color: themeData.colorScheme.primary.withOpacity(
              0.2,
            ),
          ),
          UserProfileScreenUpdateProfileButton(),
          Divider(
            thickness: 2,
            color: themeData.colorScheme.primary.withOpacity(
              0.2,
            ),
          ),
          UserExit(),
          Divider(
            thickness: 2,
            color: themeData.colorScheme.primary.withOpacity(
              0.2
            ),
          ),
        ],
      ),
    );
  }
}
