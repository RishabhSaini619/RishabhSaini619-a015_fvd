// imports
import 'package:a015_fvd/global/global_variable.dart';
import 'package:a015_fvd/screen/screen_home/screen_home.dart';
import 'package:a015_fvd/widget/widget_inner_product_thumbnail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart'
    show ChangeNotifier, TargetPlatform, defaultTargetPlatform;
import 'package:flutter/material.dart';
import '../../main.dart';

//Firebase Auth
FirebaseAuth firebaseAuth = FirebaseAuth.instance;
UserCredential userCredential;
String currentUser;
String userName = "Name";
DocumentSnapshot<Map> documentSnapshot;

// Firebase Firestore
CollectionReference userCollection =
    FirebaseFirestore.instance.collection("user_profile");
CollectionReference productsCollection =
    FirebaseFirestore.instance.collection("products");

// All Document IDs
List<String> allDocumentIDs = [];
List<Map> allDocumentsData = [];

// Categories
List<Map> fruits = [];
List<Map> vegetables = [];
List<Map> daily = [];
List<Map> grains = [];

List<Map> herbs = [];
List<Map> nuts = [];
List<Map> spices = [];

List<Map> allProducts = [];

// Categories ID List
List<String> fruitsID = [];
List<String> vegetablesID = [];
List<String> dailyID = [];
List<String> grainsID = [];

List<String> herbsID = [];
List<String> nutsID = [];
List<String> spicesID = [];

List<String> allProductsID = [];

// allCategories
List<Map> allCategories = [
  //Fruits
  {
    "name": "Fruits",
    "image": "assets/categories/fruits.png/",
    "category": fruits,
    "idList": fruitsID
  },
  //Vegetables
  {
    "name": "Vegetables",
    "image": "assets/categories/vegetables.png",
    "category": vegetables,
    "idList": vegetablesID
  },
  //Daily
  {
    "name": "Daily",
    "image": "assets/categories/daily.png",
    "category": daily,
    "idList": dailyID
  },
  //Grains
  {
    "name": "Grains",
    "image": "assets/categories/grains.png",
    "category": grains,
    "idList": grainsID
  },
  //Herbs
  {
    "name": "Herbs",
    "image": "assets/categories/herbs.png",
    "category": herbs,
    "idList": herbsID
  },
  //Nuts
  {
    "name": "Nuts",
    "image": "assets/categories/nuts.png",
    "category": nuts,
    "idList": nutsID
  },
  //Spices
  {
    "name": "Spices",
    "image": "assets/categories/spices.png",
    "category": spicesID,
    "idList": spicesID
  },
];

//FireStoreService
class FireStoreService extends ChangeNotifier {
  FireStoreService();

  static Future<dynamic> loadImage(BuildContext context, String ID) async {
    ProductThumbnail.finalURL =
        await FirebaseStorage.instance.ref().child("$ID.jpg").getDownloadURL();
    return ProductThumbnail.finalURL;
  }
}

class RegisterModel {
  String userId;
  String userName;
  String email;
  int phoneNumber;

  RegisterModel({this.userId, this.userName, this.email, this.phoneNumber});

  Future<void> addUser() async {
    CollectionReference userCollection =
        FirebaseFirestore.instance.collection('user_profile');

    Map<String, dynamic> userData = {
      "user_name": userName,
      "user_email": email,
      "user_phone_number": phoneNumber,
      "user_id": userId,
      "cart": [],
    };

    await userCollection.doc(userId).set(userData);
  }
}

Future<Map> getItemDetails() async {
  DocumentSnapshot doc = await productsCollection.doc().get();
  return doc.data();
}

Future<Widget> getImage(BuildContext context, String imageName) async {
  Image image;
  await FireStoreService.loadImage(context, imageName).then((value) {
    image = Image.network(
      value.toString(),
      fit: BoxFit.cover,
    );
  });
  return ClipRRect(
    borderRadius: BorderRadius.circular(5),
    child: image,
  );
}

Future<void> getUserDetail(String userId) async {
  DocumentSnapshot documentSnapshot = await userCollection.doc().get();

  if (documentSnapshot.exists) {
    print(documentSnapshot.id);
    print(documentSnapshot.data);
  }
}

Future<bool> checkUserId(String id) async {
  DocumentSnapshot documentSnapshot = await userCollection.doc(id).get();
  return documentSnapshot.exists;
}

class GetUser extends StatefulWidget {
  @override
  State<GetUser> createState() => _GetUserState();
}

class _GetUserState extends State<GetUser> {
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<void> getUser() async {
    if (currentUser != null) {
      DocumentSnapshot documentSnapshot =
          await userCollection.doc(currentUser).get();
      Map<String, dynamic> doc = documentSnapshot.data();
      nameController.text = doc["user_name"];
      emailController.text = doc["user_email"];
      phoneNumberController.text = (doc["user_phone_number"]).toString();
      print(emailController.text);
    }
  }
}

class ValidateUser extends StatefulWidget {
  @override
  State<ValidateUser> createState() => _ValidateUserState();
}

class _ValidateUserState extends State<ValidateUser> {
  void initState() {
    GetUser();
    validateUser();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<void> validateUser() async {
    print("started validating user");
    setState(() {
      incorrectCredentials = false;
      isLoading = true;
    });

    try {
      userCredential = await firebaseAuth.signInWithEmailAndPassword(
          email: userEmail, password: userPassword);

      if (userCredential.user.uid.isNotEmpty) {
        currentUser = userCredential.user.uid;

        try {
          userPreferences.setString("userID", "$userEmail");
          print("Successfully inserted userID to local storage");
        } catch (exception) {
          print("Failed to insert userID to local storage");
          print(exception);
        }

        DocumentSnapshot documentSnapshot =
            await userCollection.doc(currentUser).get();
        Map<String, dynamic> doc = documentSnapshot.data();
        userName = doc["user_name"];
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => HomeScreen(),
          ),
        );
      }
    } catch (exception) {
      if (exception is FirebaseAuthException) {
        message = exception.message;
        setState(() {
          incorrectCredentials = true;
          isLoading = false;
        });

        Future.delayed(Duration(seconds: 3), () {
          setState(() {
            incorrectCredentials = false;
          });
        });

        print(exception.message);
      }
    }
    if (userCredential.user.emailVerified) {
      print("Login successful");
    }
    isLoading = false;
    setState(() {});
  }
}

class ValidateUserEntry extends StatefulWidget {
  @override
  State<ValidateUserEntry> createState() => _ValidateUserEntryState();
}

class _ValidateUserEntryState extends State<ValidateUserEntry> {
  void initState() {
    GetUser();
    validateUserEntry();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<void> validateUserEntry() async {
    if (!termsAndConditions) {
      errorCode = 0;
    } else if (nameController.text == "") {
      errorCode = 1;
    } else if (emailController.text == "") {
      errorCode = 2;
    } else if (phoneNumberController.text == "") {
      errorCode = 3;
    } else if (passwordController.text.length < 6) {
      errorCode = 4;
    } else {
      errorCode = null;
    }
    try {
      int.parse(phoneNumberController.text);
    } catch (exception) {
      errorCode = 5;
    }
    print(errorCode);

    if (errorCode == null) {
      RegisterUser();
    }

    setState(() {});
  }
}

class RegisterUser extends StatefulWidget {
  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  void initState() {
    GetUser();
    registerUser();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<void> registerUser() async {
    setState(() {
      isLoading = true;
    });
    String email = emailController.text;
    String password = passwordController.text;
    try {
      userCredential = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      userPreferences.setString("userID", userCredential);
      print("try block executed sucessfully");
    } catch (exception) {
      if (exception is FirebaseAuthException) {
        print(exception.message);
      }
    }
    if (userCredential.user != null) {
      print("This line is executed");
      await RegisterModel(
        email: email,
        phoneNumber: int.parse(phoneNumberController.text),
        userName: nameController.text,
        userId: userCredential.user.uid,
      )
        ..addUser();
    }
    currentUser = userCredential.user.uid;
    setState(() {
      isLoading = false;
    });
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
        (route) => false);
  }
}

class UpdateUser extends StatefulWidget {
  @override
  State<UpdateUser> createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
  void initState() {
    GetUser();
    updateUser();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<void> updateUser() async {
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> data = {
      "user_name": nameController.text,
      "user_email": emailController.text,
      "user_phone_number": phoneNumberController.text
    };
    if (currentUser != null) {
      DocumentSnapshot documentSnapshot =
          await userCollection.doc(currentUser).get();
      Map<String, dynamic> doc = documentSnapshot.data();
      userCollection.doc(currentUser).update(data);
    }
    setState(() {
      isLoading = false;
    });
  }
}

Future<String> loadImage(BuildContext context, String ID) async {
  return await FirebaseStorage.instance.ref().child("$ID.jpg").getDownloadURL();
}

//firebase options
