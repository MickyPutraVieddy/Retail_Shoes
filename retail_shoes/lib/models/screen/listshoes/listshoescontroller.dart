import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class usercontroller extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> getdata() async {
    CollectionReference userData = firestore.collection('userSignup');

// ini untuk mendapatkan seluruh data
    return userData.get();
  }
}
