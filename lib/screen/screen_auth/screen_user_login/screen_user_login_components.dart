import 'package:a015_fvd/screen/screen_auth/screen_user_register/screen_user_register.dart';
import 'package:a015_fvd/screen/screen_home/screen_home.dart';
import 'package:flutter/material.dart';

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

class UserLoginTextFields extends StatelessWidget {
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

class UserLoginButtons extends StatelessWidget {
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
