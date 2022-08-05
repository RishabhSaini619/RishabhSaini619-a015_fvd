import 'package:a015_fvd/widget/widget_text_widget.dart';
import 'package:flutter/material.dart';

class NetworkStatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          Image(
            fit: BoxFit.fitHeight,
            image: AssetImage('assets/appbar/auth.png'),
          ),
          Center(
            child: TextWidget(
              tText: "Please connect your device to internet",
              tSize: 20,
              tColor: themeData.colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
