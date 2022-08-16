import 'package:a015_fresh_basket/global/global_firebase.dart';
import 'package:a015_fresh_basket/global/global_variable.dart';
import 'package:a015_fresh_basket/screen/screen_auth/screen_user_login/screen_user_login.dart';
import 'package:a015_fresh_basket/screen/screen_home/screen_home.dart';
import 'package:flutter/material.dart';

class UserUpdateScreenImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image(
      fit: BoxFit.fill,
      image: AssetImage(
        'assets/appbar/auth.png',      ),
    );
  }
}

class UserUpdateScreenMessage extends StatelessWidget {
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
            'Profile Update',
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

class UserUpdateScreenFields extends StatelessWidget {
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
                'User Update',
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
                  hintText: "Email",
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
              SizedBox(
                height: 70,
              ),
              UserUpdateButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

class UserUpdateButtons extends StatelessWidget {
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
            isLoading ? CircularProgressIndicator() :InkWell(
              onTap: () {
                UpdateUser();
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
