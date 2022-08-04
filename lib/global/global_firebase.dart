// imports
import 'package:a015_fvd/global/global_variable.dart';
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
CollectionReference userCollection = FirebaseFirestore.instance.collection("user_profile");
CollectionReference productsCollection = FirebaseFirestore.instance.collection("products");


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

// Future<void> updateUserDetails() async{
//   setState(() {
//     isLoading = true;
//   });
//   Map<String, dynamic> data = {
//     "user_name":nameController.text,
//     "user_email":emailController.text,
//     "user_phone_number":phoneNumberController.text
//   };
//   if (currentUser != null) {
//     DocumentSnapshot documentSnapshot =
//     await userCollection.doc(currentUser).get();
//     Map<String, dynamic> doc = documentSnapshot.data();
//     userCollection.doc(currentUser).update(data);
//   }
//   setState(() {
//     isLoading = false;
//   });
// }

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




// class FireStoreService extends ChangeNotifier {
//   FireStoreService();
//
//   static Future<dynamic> loadImage(BuildContext context, String ID) async {
//     return await FirebaseStorage.instance
//         .ref()
//         .child("$ID.jpg")
//         .getDownloadURL();
//   }
// }


//firebase options
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC_61VH6q-rQB5emiF1Sqot7vNW4MWUEpU',
    appId: '1:531872287724:web:53e6376aba11e0bbd08ec9',
    messagingSenderId: '531872287724',
    projectId: 'a015-fvd',
    storageBucket: 'a015-fvd.appspot.com',
  );
}

