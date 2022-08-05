import 'package:a015_fvd/global/global_firebase.dart';
import 'package:a015_fvd/global/global_variable.dart';
import 'package:a015_fvd/screen/screen_auth/screen_user_register/screen_user_register.dart';
import 'package:a015_fvd/screen/screen_home/screen_home.dart';
import 'package:a015_fvd/widget/widget_fetch.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLoginScreenImage extends StatelessWidget {
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

class UserLoginScreenMessage extends StatelessWidget {
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
            'WELCOME Back',
            style: TextStyle(
              color: themeData.colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
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
      padding: const EdgeInsets.only(
        top: 150,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: themeData.colorScheme.background,
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
  void initState() async {
    if(userCredential != null){
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => Fetch(),
            ),
                (route) => false);
      });
    }
    userPreferences = await SharedPreferences.getInstance() ;
    try {
      String emailFromStorage = userPreferences.getString("userID");
      if (emailFromStorage != null) {
        emailController.text = emailFromStorage;
      }
    } catch (e) {
      print("Failed to fetch email from local storage");
    }

    // TODO: implement initState
    super.initState();
  }
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
          borderRadius: BorderRadius.circular(
            75,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(
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
                'Sign In',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) => validateEmail(value),
                style: const TextStyle(
                  color: Color(0xffF5591F),
                ),
                cursorColor: Color(0xffF5591F),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.email,
                    color: Color(0xffF5591F),
                  ),
                  hintText: "Email",
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
                cursorColor: Color(0xffF5591F),
                style: const TextStyle(
                  color: Color(0xffF5591F),
                ),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.vpn_key,
                    color: Color(0xffF5591F),
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
                      obscureTextData ? Icons.visibility :
                      Icons.visibility_off,
                      color: Color(0xffF5591F),
                    ),
                  ),
                  focusColor: Color(0xffF5591F),
                  hintText: "Enter Password",
                  hintStyle: const TextStyle(color: Colors.grey),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Text(
                'Forget Password?',
              ),
              SizedBox(
                height: 115,
              ),
              UserLoginButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

class UserLoginButtons extends StatefulWidget {
  @override
  State<UserLoginButtons> createState() => _UserLoginButtonsState();
}

class _UserLoginButtonsState extends State<UserLoginButtons> {
  void initState() async {
    if(userCredential != null){
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
                (route) => false);
      });
    }
    userPreferences = await SharedPreferences.getInstance() ;
    try {
      String emailFromStorage = userPreferences.getString("userID");
      if (emailFromStorage != null) {
        emailController.text = emailFromStorage;
      }
    } catch (e) {
      print("Failed to fetch email from local storage");
    }

    // TODO: implement initState
    super.initState();
  }
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
                  color: Color(
                    0xffca9000,
                  ),
                  borderRadius: BorderRadius.circular(
                    45,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: themeData.colorScheme.primary.withOpacity(
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
                  color: themeData.colorScheme.background,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an Account?",
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
                  child: Text(
                    'Sign Up',
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
