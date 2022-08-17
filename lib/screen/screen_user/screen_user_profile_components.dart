import 'package:a015_fresh_basket/global/global_theme.dart';
import 'package:a015_fresh_basket/screen/screen_auth/screen_user_update/screen_user_update.dart';
import 'package:a015_fresh_basket/widget/widget_text_widget.dart';
import 'package:flutter/material.dart';

class UserProfileScreenAppBarImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image(
      fit: BoxFit.fitHeight,
      image: AssetImage('assets/appbar/user.png'),
    );
  }
}
class UserProfileScreenUpdateProfileButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return InkWell(
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
    );
  }
}

class UserProfileScreenThemeUiSwitch extends StatefulWidget {
  @override
  State<UserProfileScreenThemeUiSwitch> createState() => _UserProfileScreenThemeUiSwitchState();
}

class _UserProfileScreenThemeUiSwitchState extends State<UserProfileScreenThemeUiSwitch> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return SwitchListTile(
      title: TextWidget(
        tTitle: true,
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
    );
  }
}
