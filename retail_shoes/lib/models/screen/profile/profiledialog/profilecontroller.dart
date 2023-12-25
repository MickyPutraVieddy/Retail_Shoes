import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class profilecontroller extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getdata(String uid) async {
    var data = await firestore.collection('userSignup').doc(uid).get();
    return data;
  }
}
