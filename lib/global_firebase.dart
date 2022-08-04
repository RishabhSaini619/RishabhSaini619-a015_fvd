// imports
import 'package:a015_fvd/widget/screen_inner_product_thumbnail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart'
    show ChangeNotifier, TargetPlatform, defaultTargetPlatform;
import 'package:flutter/material.dart';

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

// otherCategories
List<Map> otherCategories = [
  {
    "name": "Fruits",
    "image": "assets/Fruits.svg",
    "category": herbs,
    "idList": herbsID
  },
  {
    "name": "Veggies",
    "image": "assets/Vegetables.svg",
    "category": nuts,
    "idList": nutsID
  },
  {
    "name": "Dairy",
    "image": "assets/Dairy.svg",
    "category": spices,
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

