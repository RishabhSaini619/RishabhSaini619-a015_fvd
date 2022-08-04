import 'package:a015_fvd/global/global_theme.dart';
import 'package:a015_fvd/global/global_variable.dart';
import 'package:a015_fvd/screen/screen_auth/screen_user_update.dart';
import 'package:a015_fvd/screen/screen_auth/widget_user_exit.dart';
import 'package:a015_fvd/widget/widget_text_widget.dart';
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
    return Center(
      child: Column(
        children: [
          InkWell(
            child: Row(
              children: [
                Icon(Icons.manage_accounts),
                TextWidget(
                  tText: "Profile Update",
                  tColor: themeData.primaryColor,
                  tSize: 20,
                )
              ],
            ),
            onTap: () async {
              return Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserUpdateScreen(),
                ),
              );
            },
          ),
          SwitchListTile(
            title: TextWidget(
              isTitle: true,
              tText: darkMode ? "Dark Theme" : " Light Theme",
              tColor: themeData.colorScheme.primary,
              tSize: 24,
            ),
            secondary: Icon(
              darkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
            ),
            activeColor: Colors.white,
            activeTrackColor: Colors.blue,
            activeThumbImage: const AssetImage(
              "assets/darkMode/moonIcon.png",
            ),
            autofocus: true,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.grey,
            inactiveThumbImage: const AssetImage("assets/darkMode/sunIcon.png"),
            onChanged: (bool value) {
              setState(() {
                darkMode = value;
              });
            },
            value: darkMode,
          ),
          UserExit(),
        ],
      ),
    );
  }
}
