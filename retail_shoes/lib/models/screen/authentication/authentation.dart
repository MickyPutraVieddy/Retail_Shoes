import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:retail_shoes/models/database/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:retail_shoes/models/screen/dashboard/dashboard.dart';

class AuthenticationController extends GetxController {
  var isAuth = false.obs;

  // Users panggiluser = Users();

  // ini buat firestore agar di simpan
  CollectionReference storeGoogle =
      FirebaseFirestore.instance.collection('userGoogle');

  GoogleSignIn _googlesignin = GoogleSignIn();
  GoogleSignInAccount? _currentuser;
  Future<void> login() async {
    try {
      // ini untuk handle kebocoran data user sebelum login
      await _googlesignin.signIn().then((value) => _currentuser = value);

      var isSignedIn = await _googlesignin.isSignedIn();
      // jika ingin keluar gmail google
      var isSignedOut = await _googlesignin.signOut();

      if (isSignedIn) {
        print("Sudah berhasil login dengan akun : $_currentuser");
        Get.offAll(Dashboard()); // Ganti dengan halaman yang sesuai
      }
    } catch (error) {
      print("Error: $error");
    }

    // mengambil data dari isian google
    storeGoogle.doc(_currentuser!.email).set({
      'name': _currentuser!.displayName,
      'email': _currentuser!.email,
      'photoUrl': _currentuser!.photoUrl
    });

    // var googleSignInAuthentication = await _currentuser!.authentication;

    // var credential = GoogleAuthProvider.credential(
    //   accessToken: googleSignInAuthentication.accessToken,
    //   idToken: googleSignInAuthentication.idToken,
    // );

    // final usercredential =
    //     FirebaseAuth.instance.signInWithCredential(credential);

    // Setelah berhasil login, lakukan tindakan yang sesuai
    // Misalnya, pindah ke halaman utama
    isAuth.value = true; // Set status otentikasiatus otentikasi
  }
}
