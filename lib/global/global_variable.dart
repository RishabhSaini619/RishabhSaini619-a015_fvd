import 'package:a015_fvd/global/global_firebase.dart';
import 'package:flutter/material.dart';

//SharedPreferences
var userPreferences;

//AnimationController
AnimationController animationControllerNavigationBar;
AnimationController animationControllerCart;
AnimationController animationControllerUserProfile;
AnimationController animationControllerSearch;
AnimationController animationControllerWishList;
AnimationController animationControllerUserUpdate;
AnimationController animationControllerUserRegister;
AnimationController animationControllerUserLogin;

//bool
bool hidePassword = true;
bool isLoading = false;
bool isErrorThere = true;
bool incorrectCredentials = false;
bool termsAndConditions = false;

//final & var
int errorCode;
var obscureTextData = true;
final passFocusNode = FocusNode();
final formKey = GlobalKey<FormState>();
//string
String message;
String userName = emailController.text;
String userPhoneNumber = passwordController.text;
String userEmail = emailController.text;
String userPassword = passwordController.text;
//TextEditingController
TextEditingController nameController = TextEditingController();
TextEditingController phoneNumberController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

//Val

///Name Regex
String validateName(String value) {
  Pattern pattern = r"[a-zA-Z]";
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return 'Enter Alphabets only';
  else
    return null;
}
///PhoneRegex
String validatePhoneNumber(String value) {
  Pattern pattern =
      r"((\+*)((0[ -]*)*|((91 )*))((\d{12})+|(\d{10})+))|\d{5}([- ]*)\d{6}";
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return 'Enter Valid Phone Number';
  else
    return null;
}
///Email Regex
String validateEmail(String value) {
  String pattern = r"([a-zA-Z0-9]+)([\.{1}])?([a-zA-Z0-9]+)\@([\.])";
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || !regex.hasMatch(value))
    return 'Enter Valid Email only';
  else
    return null;
}
///Password Regex
String validatePassword(String value) {
  if (value.isEmpty || value.length < 8) {
    return 'Enter Valid Password only\n (Must contains 8 Character)';
  } else {
    return null;
  }
}

// CartStatus
bool isCartPressed = false;
Set<dynamic> cartItems = {};
ValueNotifier<int> cartItemCount = ValueNotifier(cartItems.length);
ValueNotifier<int> billValue = ValueNotifier(0);

// WishListStatus
bool isWishListPressed = false;
Set<dynamic> wishListItems = {};
ValueNotifier<int> wishListItemCount = ValueNotifier(wishListItems.length);

//
int findIDUsingIndexWhere(String name) {
  final index = allDocumentsData.indexWhere((element) =>
      (element["product_name"].toLowerCase()) == name.toLowerCase());
  return index;
}


