import 'package:a015_fvd/screen/screen_auth/screen_user_login/screen_user_login.dart';
import 'package:a015_fvd/screen/screen_home/screen_home.dart';
import 'package:flutter/material.dart';

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

class UserRegisterTextFields extends StatelessWidget {
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
                'Register',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Name',
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Phone',
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
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

class UserRegisterButtons extends StatelessWidget {
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => HomeScreen(),
                  ),
                );
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
