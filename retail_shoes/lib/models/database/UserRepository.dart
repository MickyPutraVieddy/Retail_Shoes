import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:retail_shoes/models/database/User.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// class DataRepository extends GetxController {
//   static DataRepository get instance => Get.find();

//   final _db = FirebaseFirestore.instance.collection("dataProduct").snapshots();

//   // ini untuk singupnya
//   Stream<QuerySnapshot<Object?>> getDataProducts() {
//     var currentUser = FirebaseAuth.instance.currentUser;
//     var userId = currentUser?.uid;

//     if (userId != null) {
//       CollectionReference userProducts = FirebaseFirestore.instance
//           .collection('userSignup')
//           .doc(userId)
//           .collection('dataProduct');

//       return userProducts.snapshots();
//     }

//     // Return an empty stream if the user is not authenticated
//     return Stream.empty();
//   }
//   // ini untuk email
//   // Stream<QuerySnapshot<Object?>> getProducts() {
//   //   var currentUser = FirebaseAuth.instance.currentUser;
//   //   var userId = currentUser?.uid;

//   //   if (userId != null) {
//   //     CollectionReference userProducts =
//   //         FirebaseFirestore.instance.collection('userSignup').doc(userId).collection('products');

//   //     return userProducts.snapshots();
//   //   }

//   //   // Return an empty stream if the user is not authenticated
//   //   return Stream.empty();
//   // }

//   Future<void> addProduct(UserShoes user) async {
//     // ini untuk data produt usersignup
//     CollectionReference _db =
//         FirebaseFirestore.instance.collection('userSignup');

//     // Get the currently authenticated user
//     var currentUser = FirebaseAuth.instance.currentUser;
//     var userId = currentUser?.uid;

//     if (userId != null) {
//       // Add product data to the user's subcollection
//       await _db.doc(userId).collection('dataProduct').add({
//         'nameShoes': user.namaSepatu,
//         'description': user.description,
//         'price': user.harga,
//         'typeShoes': user.typeShoes,
//         'gambarShoes': user.gambar
//       });
//     }
//     ;

//     // ini buat data product email
//   }
// }
