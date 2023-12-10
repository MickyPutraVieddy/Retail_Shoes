import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Users extends GetxController {
  String name;
  int umur;
  String gender;

  Users(this.name, this.umur, this.gender);

  CollectionReference firestoreUser =
      FirebaseFirestore.instance.collection('user');

  Future<void> addUser() {
    return firestoreUser
        .add({'name': name, 'umur': umur, 'gender': gender})
        .then((value) => print("Datanya adalah $value"))
        .catchError((error) => print("errornya adalah $error"));
  }
}
