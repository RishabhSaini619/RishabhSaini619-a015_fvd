import 'package:a015_fresh_basket/widget/widget_text_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:a015_fresh_basket/global/global_firebase.dart';
import 'package:a015_fresh_basket/global/global_variable.dart';
import 'package:a015_fresh_basket/screen/screen_auth/screen_user_login/screen_user_login.dart';
import 'package:a015_fresh_basket/screen/screen_home/screen_home.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserRegisterScreenAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        UserRegisterScreenImage(),
        UserRegisterScreenMessage(),
      ],
    );
  }
}

class UserRegisterScreenImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image(
      fit: BoxFit.fill,
      image: AssetImage(
        'assets/appbar/auth.png',
      ),
    );
  }
}

class UserRegisterScreenMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 150, 10, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(
            tText: 'Welcome 2 Family',
            tCenter: true,
            tSize: 30,
            tTitle: true,
            tColor: Color(0xff547c04),
          ),
          TextWidget(
            tText: 'Register',
            tCenter: true,
            tSize: 30,
            tColor: Color(0xff547c04),
          ),
        ],
      ),
    );
  }
}

class UserRegisterScreenFields extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: themeData.colorScheme.background.withOpacity(0.1),
          borderRadius: BorderRadius.circular(
            75,
          ),
        ),
        child: UserRegisterTextFields(),
      ),
    );
  }
}

class UserRegisterTextFields extends StatefulWidget {
  @override
  State<UserRegisterTextFields> createState() => _UserRegisterTextFieldsState();
}

class _UserRegisterTextFieldsState extends State<UserRegisterTextFields> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
      child: Column(
        textDirection: TextDirection.ltr,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        verticalDirection: VerticalDirection.down,
        children: [
          //name
          TextFormField(
            textInputAction: TextInputAction.next,
            controller: nameController,
            keyboardType: TextInputType.name,
            validator: (value) => validateName(value),
            style: TextStyle(
              color: Color(0xff547c04),
            ),
            cursorColor: Color(0xff547c04),
            decoration: InputDecoration(
              icon: Icon(
                Icons.person,
                color: Color(0xffe38501),
              ),
              hintText: "Name",
              hintStyle: TextStyle(color: Color(0xffe38501)),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          //phone
          TextFormField(
            textInputAction: TextInputAction.next,
            controller: phoneNumberController,
            keyboardType: TextInputType.name,
            validator: (value) => validatePhoneNumber(value),
            style: TextStyle(
              color: Color(0xff547c04),
            ),
            cursorColor: Color(0xff547c04),
            decoration: InputDecoration(
              icon: Icon(
                Icons.person,
                color: Color(0xffe38501),
              ),
              hintText: "Phone",
              hintStyle: TextStyle(
                color: Color(0xffe38501),
              ),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          //email
          TextFormField(
            textInputAction: TextInputAction.next,
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) => validateEmail(value),
            style: TextStyle(
              color: Color(0xff547c04),
            ),
            cursorColor: Color(0xff547c04),
            decoration: InputDecoration(
              icon: Icon(
                Icons.email,
                color: Color(0xffe38501),
              ),
              suffixIcon: IconButton(
                onPressed: () async {
                  print("Searching email");
                  bool existOrNot =
                      await checkUserId('${emailController.text}');
                  if (existOrNot) {
                  } else
                    getUserDetail('${emailController.text}');
                },
                icon: Icon(
                  IconlyLight.search,
                  size: 20,
                  color: Color(0xffe38501),
                ),
              ),
              hintText: "Email & check for availability",
              hintStyle: TextStyle(
                color: Color(0xffe38501),
              ),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          //pass
          TextFormField(
            textInputAction: TextInputAction.done,
            onEditingComplete: () {
              UserRegisterButtons();
            },
            controller: passwordController,
            keyboardType: TextInputType.visiblePassword,
            validator: (value) => validatePassword(value),
            obscureText: obscureTextData,
            style: const TextStyle(
              color: Color(0xff547c04),
            ),
            cursorColor: Color(0xff547c04),
            decoration: InputDecoration(
              focusColor: Color(0xff547c04),
              icon: Icon(
                Icons.vpn_key,
                color: Color(0xffe38501),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  obscureTextData ? Icons.visibility : Icons.visibility_off,
                  color: Color(0xffe38501),
                ),
                onPressed: () {
                  setState(
                    () {
                      obscureTextData = !obscureTextData;
                    },
                  );
                },
              ),
              hintText: "Enter Password",
              hintStyle: const TextStyle(
                color: Color(0xffe38501),
              ),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
          SizedBox(
            height: size.height * 0.1,
          ),
          UserRegisterButtons(),
        ],
      ),
    );
  }
}

class UserRegisterButtons extends StatefulWidget {
  @override
  State<UserRegisterButtons> createState() => _UserRegisterButtonsState();
}

class _UserRegisterButtonsState extends State<UserRegisterButtons> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                ValidateUserEntry();
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Color(0xff547c04),
                  borderRadius: BorderRadius.circular(45),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff547c04).withOpacity(0.2),
                      offset: Offset(5, 5),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.arrow_forward_rounded,
                  color: Color(0xffffff00),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Row(
              children: [
                Checkbox(
                    value: termsAndConditions,
                    activeColor: Colors.green,
                    onChanged: (value) {
                      termsAndConditions = value;
                      setState(() {});
                    }),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "I agree the ",
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                      TextSpan(
                        text: "Terms and Conditions",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            String url = "https://example.com";
                            await launchUrl(Uri.parse(url),
                                mode: LaunchMode.externalApplication);
                          },
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                  tText: "Already a User?",
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => UserLoginScreen(),
                      ),
                    );
                  },
                  child: TextWidget(
                    tColor: Color(0xffca9000),
                    tText: 'Sign In',
                    tSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
