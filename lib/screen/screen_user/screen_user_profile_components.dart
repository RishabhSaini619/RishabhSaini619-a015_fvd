import 'package:a015_fresh_basket/global/global_firebase.dart';
import 'package:a015_fresh_basket/global/global_theme.dart';
import 'package:a015_fresh_basket/screen/screen_auth/screen_user_update/screen_user_update.dart';
import 'package:a015_fresh_basket/widget/widget_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class UserProfileScreenAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        UserProfileScreenAppBarImage(),
        UserProfileScreenAppBarMessage(),
      ],
    );
  }
}

class UserProfileScreenAppBarImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.fill,
      image: AssetImage('assets/appbar/user.png'),
    );
  }
}

class UserProfileScreenAppBarMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextWidget(
            tText: 'hi ',
            tSize: 30,
            tColor: Colors.white,
          ),
          TextWidget(
            tText: '$userName',
            tCenter: true,
            tSize: 30,
            tTitle: true,
            tColor: Colors.white,
          ),
        ],
      ),
    );
  }
}

class UserProfileScreenUpdateProfileButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(70, 10, 30, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextWidget(
              tText: "Update Profile",
              tColor: themeData.colorScheme.primary,
              tSize: 24,
              tTitle: true,
              tCenter: true,
            ),
            Icon(IconlyLight.upload),
          ],
        ),
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
  State<UserProfileScreenThemeUiSwitch> createState() =>
      _UserProfileScreenThemeUiSwitchState();
}

class _UserProfileScreenThemeUiSwitchState
    extends State<UserProfileScreenThemeUiSwitch> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return SwitchListTile(
      title: TextWidget(
        tTitle: true,
        tText: darkMode ? "Dark Theme" : "Light Theme",
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
      value: darkMode,
      onChanged: (bool value) {
        setState(() {
          darkMode = value;
        });
      },
    );
  }
}
