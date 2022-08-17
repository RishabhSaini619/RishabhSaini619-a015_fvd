import 'package:a015_fresh_basket/global/global_firebase.dart';
import 'package:a015_fresh_basket/global/global_variable.dart';
import 'package:a015_fresh_basket/screen/screen_auth/screen_user_register/screen_user_register.dart';
import 'package:a015_fresh_basket/widget/widget_fetch.dart';
import 'package:a015_fresh_basket/widget/widget_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLoginScreenAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        UserLoginScreenImage(),
        UserLoginScreenMessage(),
      ],
    );
  }
}

class UserLoginScreenImage extends StatelessWidget {
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

class UserLoginScreenMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 150, 10, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(
            tText: 'Welcome Back',
            tCenter: true,
            tSize: 30,
            tTitle: true,
            tColor: Color(0xff547c04),
          ),
          TextWidget(
            tText: 'Log In',
            tCenter: true,
            tSize: 30,
            tColor: Color(0xff547c04),
          ),
        ],
      ),
    );
  }
}

class UserLoginScreenFields extends StatelessWidget {
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
        child: UserLoginTextFields(),
      ),
    );
  }
}

class UserLoginTextFields extends StatefulWidget {
  @override
  State<UserLoginTextFields> createState() => _UserLoginTextFieldsState();
}

class _UserLoginTextFieldsState extends State<UserLoginTextFields> {
  void initState() {
    if (userCredential != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => Fetch(),
            ),
            (route) => false);
      });
    }
    userPreferences = SharedPreferences.getInstance();
    try {
      String emailFromStorage = userPreferences.getString("userID");
      if (emailFromStorage != null) {
        emailController.text = emailFromStorage;
      }
    } catch (e) {
      print("Failed to fetch email from local storage");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            textInputAction: TextInputAction.next,
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) => validateEmail(value),
            style: const TextStyle(
              color: Color(0xff547c04), //0xff992e24
            ),
            cursorColor: Color(0xff547c04),
            decoration: InputDecoration(
              icon: Icon(
                Icons.email,
                color: Color(0xffe38501),
              ),
              hintText: "Email",
              hintStyle: const TextStyle(
                color: Color(0xffe38501),
              ),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          TextFormField(
            textInputAction: TextInputAction.done,
            onEditingComplete: () {
              UserLoginButtons();
            },
            controller: passwordController,
            focusNode: passFocusNode,
            obscureText: obscureTextData,
            keyboardType: TextInputType.visiblePassword,
            validator: (value) => validatePassword(value),
            cursorColor: Color(0xff547c04),
            style: const TextStyle(
              color: Color(0xff547c04),
            ),
            decoration: InputDecoration(
              icon: Icon(
                Icons.vpn_key,
                color: Color(0xffe38501),
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(
                    () {
                      obscureTextData = !obscureTextData;
                    },
                  );
                },
                child: Icon(
                  obscureTextData ? Icons.visibility : Icons.visibility_off,
                  color: Color(0xffe38501),
                ),
              ),
              focusColor: Color(0xffe38501),
              hintText: "Enter Password",
              hintStyle: const TextStyle(
                color: Color(0xffe38501),
              ),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          TextWidget(
            tText: 'Forget Password?',
            tColor: Color(0xff992e24),
          ),
          SizedBox(
            height: 115,
          ),
          UserLoginButtons(),
        ],
      ),
    );
  }
}

class UserLoginButtons extends StatefulWidget {
  @override
  State<UserLoginButtons> createState() => _UserLoginButtonsState();
}

class _UserLoginButtonsState extends State<UserLoginButtons> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(
        20,
      ),
      child: Container(
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                ValidateUser();
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Color(0xff547c04),
                  borderRadius: BorderRadius.circular(
                    45,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff547c04).withOpacity(0.2),
                      offset: Offset(5, 5),
                      blurRadius: 10,
                    )
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                  tText: "Don't have an Account?",
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => UserRegisterScreen(),
                      ),
                    );
                  },
                  child: TextWidget(
                    tColor: Color(0xffca9000),
                    tText: 'Sign Up',
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
