import 'package:a015_fresh_basket/global/global_firebase.dart';
import 'package:a015_fresh_basket/screen/screen_auth/screen_user_login/screen_user_login.dart';
import 'package:a015_fresh_basket/widget/widget_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class UserExit extends StatefulWidget {
  @override
  State<UserExit> createState() => _UserExitState();
}

class _UserExitState extends State<UserExit> {
  @override
  void initState() {
    super.initState();
    userCredential = null;
    currentUser = null;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return InkWell(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(70, 10, 27.5, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextWidget(
              tText: "Log out",
              tColor: themeData.colorScheme.primary,
              tSize: 24,
              tTitle: true,
            ),
            Icon(IconlyLight.logout),
          ],
        ),
      ),
      onTap: () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => UserLoginScreen(),
              ),
              (route) => false);
        });
      },
    );
  }
}
