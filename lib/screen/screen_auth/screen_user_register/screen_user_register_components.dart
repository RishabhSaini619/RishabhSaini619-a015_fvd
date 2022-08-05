import 'package:url_launcher/url_launcher.dart';
import 'package:a015_fvd/global/global_firebase.dart';
import 'package:a015_fvd/global/global_variable.dart';
import 'package:a015_fvd/screen/screen_auth/screen_user_login/screen_user_login.dart';
import 'package:a015_fvd/screen/screen_home/screen_home.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserRegisterScreenImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image(
      fit: BoxFit.fill,
      image: AssetImage(
        'assets/background/auth.png',
      ),
    );
  }
}

class UserRegisterScreenMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(
        top: 50,
        left: 50,
        right: 50,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'WELCOME\nto the\nFAMILY',
            style: TextStyle(
              color: themeData.colorScheme.background,
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
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
      padding: EdgeInsets.only(
        top: 50,
        left: 50,
        right: 50,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'WELCOME',
            style: TextStyle(
              color: themeData.colorScheme.background,
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          ),
        ],
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
      padding: const EdgeInsets.fromLTRB(
        30,
        30,
        30,
        30,
      ),
      child: Container(
        width: size.width * 10,
        height: size.height,
        decoration: BoxDecoration(
          color: themeData.colorScheme.primary,
          borderRadius: BorderRadius.circular(75),
          boxShadow: [
            BoxShadow(
              color: themeData.colorScheme.onPrimary.withOpacity(
                0.2,
              ),
              offset: Offset(5, 5,),
              blurRadius: 10,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            20,
            50,
            20,
            20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'User Register',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              //name
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: nameController,
                keyboardType: TextInputType.name,
                validator: (value) => validateName(value),
                style: TextStyle(
                  color: Color(0xffF5591F),
                ),
                cursorColor: Color(0xffF5591F),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.person,
                    color: Color(0xffF5591F),
                  ),
                  hintText: "Name",
                  hintStyle: TextStyle(color: Colors.grey),
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
                  color: Color(0xffF5591F),
                ),
                cursorColor: Color(0xffF5591F),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.person,
                    color: Color(0xffF5591F),
                  ),
                  hintText: "First Name",
                  hintStyle: TextStyle(color: Colors.grey),
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
                  color: Color(0xffF5591F),
                ),
                cursorColor: Color(0xffF5591F),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.email,
                    color: Color(0xffF5591F),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () async {
                      print("Searching email");
                      bool existOrNot = await checkUserId('${emailController.text}');
                      if (existOrNot) {
                      } else
                        getUserDetail('${emailController.text}');
                    },
                    icon: Icon(
                      IconlyLight.search,
                      size: 20,
                      color: Color(0xffF5591F),
                    ),
                  ),
                  hintText: "Email & check for availability",
                  hintStyle: TextStyle(color: Colors.grey),
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
                  color: Color(0xffF5591F),
                ),
                cursorColor: Color(0xffF5591F),
                decoration: InputDecoration(
                  focusColor: Color(0xffF5591F),
                  icon: Icon(
                    Icons.vpn_key,
                    color: Color(0xffF5591F),
                  ),

                  suffixIcon: IconButton(
                    icon: Icon(
                      obscureTextData ? Icons.visibility:
                      Icons.visibility_off,
                      color: Color(0xffF5591F),
                    ),
                    onPressed:
                        () {
                      setState(
                            () {
                          obscureTextData = !obscureTextData;
                        },
                      );
                    },
                  ),
                  hintText: "Enter Password",
                  hintStyle: const TextStyle(color: Colors.grey),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
              SizedBox(
                height: 70,
              ),
              UserRegisterButtons(),
            ],
          ),
        ),
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
                ValidateUserEntry();
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Color(
                    0xffca9000,
                  ),
                  borderRadius: BorderRadius.circular(
                    45,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: themeData.colorScheme.onPrimary.withOpacity(
                        0.2,
                      ),
                      offset: Offset(
                        5,
                        5,
                      ),
                      blurRadius: 10,
                    )
                  ],
                ),
                child: Icon(
                  Icons.arrow_forward_rounded,
                  color: themeData.colorScheme.primary,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Padding(
              padding: EdgeInsets.all(8.h),
              child: Row(
                children: [
                  Checkbox(
                      value: termsAndConditions,
                      activeColor: themeData.colorScheme.primary,
                      onChanged: (value) {
                        termsAndConditions = value;
                        setState(() {});
                      }),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "I agree the ",
                          style:
                          TextStyle(color: Colors.black, fontSize: 12.h),
                        ),
                        TextSpan(
                          text: "Terms and Conditions",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              String url = "https://example.com";
                              await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
                            },
                          style: TextStyle(
                              color: themeData.colorScheme.primary,
                              fontSize: 12.h),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already a User?'),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => UserLoginScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: Color(
                        0xffca9000,
                      ),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
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
