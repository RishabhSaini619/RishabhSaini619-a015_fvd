import 'package:a015_fresh_basket/global/global_firebase.dart';
import 'package:a015_fresh_basket/global/global_variable.dart';
import 'package:a015_fresh_basket/screen/screen_auth/screen_user_login/screen_user_login.dart';
import 'package:a015_fresh_basket/screen/screen_home/screen_home.dart';
import 'package:a015_fresh_basket/widget/widget_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class UserUpdateScreenAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        UserUpdateScreenImage(),
        UserUpdateScreenMessage(),
      ],
    );
  }
}

class UserUpdateScreenImage extends StatelessWidget {
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

class UserUpdateScreenMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 150, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextWidget(
            tText: 'Update',
            tCenter: false,
            tSize: 30,
            tColor: Color(0xff547c04),
          ),
        ],
      ),
    );
  }
}

class UserUpdateScreenFields extends StatelessWidget {
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
        child: UserUpdateTextFields(),
      ),
    );
  }
}

class UserUpdateTextFields extends StatefulWidget {
  @override
  State<UserUpdateTextFields> createState() => _UserUpdateTextFieldsState();
}

class _UserUpdateTextFieldsState extends State<UserUpdateTextFields> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
            height: size.height * 0.2,
          ),
          UserUpdateButtons(),
        ],
      ),
    );
  }
}

class UserUpdateButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isLoading
                ? CircularProgressIndicator()
                : InkWell(
                    onTap: () {
                      UpdateUser();
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
