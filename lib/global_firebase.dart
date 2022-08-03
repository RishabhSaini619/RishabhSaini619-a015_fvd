// Firebase Auth
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

//
FirebaseAuth firebaseAuth = FirebaseAuth.instance;
UserCredential userCredential;
String currentUser;
String userName = "Name";

// Firebase Firestore
CollectionReference userCollection = FirebaseFirestore.instance.collection("user_profile");
CollectionReference productsCollection = FirebaseFirestore.instance.collection("products");


// All Document IDs
List<String> allDocumentIDs = [];
List<Map> allDocumentsData = [];

// Categories
List<Map> fruits = [];
List<Map> vegetables = [];
List<Map> herbs = [];
List<Map> nuts = [];
List<Map> spices = [];
List<Map> grains = [];
List<Map> daily = [];
List<Map> allProducts = [];


// Categories ID List
List<String> fruitsID = [];
List<String> vegetablesID = [];
List<String> herbsID = [];
List<String> nutsID = [];
List<String> spicesID = [];
List<String> grainsID = [];
List<String> dailyID = [];
List<String> allProductsID = [];

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