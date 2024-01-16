import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:retail_shoes/models/colour/colour.dart';
import 'package:retail_shoes/models/database/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:retail_shoes/models/screen/dashboard/dashboard.dart';
import 'package:retail_shoes/models/screen/loginscreen/daftarscreen.dart';
import 'package:retail_shoes/models/screen/loginscreen/loginscreen.dart';
import 'package:retail_shoes/models/screen/profile/profiledialog/profiledialog.dart';

class AuthenticationController extends GetxController {
  var isAuth = false.obs;

// ini buat signup email,password dan user buat daftarscreen
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailControllerSignup = TextEditingController();
  TextEditingController passwordControllerSignup = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();

// ini untuk bypass data semisal ada valuenya mengggunakan RX

  RxString selectedRole = RxString("");

  var daftar = Get.find<daftarscreen>;

  // Users panggiluser = Users();

  // ini buat firestore agar di simpan
  CollectionReference storeGoogle =
      FirebaseFirestore.instance.collection('userGoogle');

  // ini butuh buat ngegget firebase
  var instance = FirebaseAuth.instance;

  GoogleSignIn _googlesignin = GoogleSignIn();
  GoogleSignInAccount? _currentuser;

  // ini untuk login buat google
  Future<void> loginGoogle() async {
    try {
      // ini untuk handle kebocoran data user sebelum login
      await _googlesignin.signIn().then((value) => _currentuser = value);

      var isSignedIn = await _googlesignin.isSignedIn();

      if (isSignedIn) {
        print("Sudah berhasil login dengan akun : $_currentuser");
        // buat menampilkan jika login berhasil
        Get.defaultDialog(
          titleStyle: TextStyle(
              color: Colors.green, fontWeight: FontWeight.bold, fontSize: 22),
          title: "Login Successfully",
          middleTextStyle: TextStyle(fontSize: 20),
          middleText: "Berhasil Login",
        );
        await Future.delayed(Duration(
            seconds:
                2)); // ini untuk mendelayed agar default dialognya muncul dulu lalu navigasi ke dashboard
        Get.offAll(Dashboard()); // buat navigasi ke dashboarnya

        if (_currentuser == null) {
          print("Sign-in failed or user is null");
        } else {
          isAuth.value = true; // Set status otentikasiatus otentikasi
          var googleSignInAuthentication = await _currentuser!.authentication;

          var credential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken,
          );

          final usercredential =
              FirebaseAuth.instance.signInWithCredential(credential);
          print("credentialnya adalah = $credential");

          storeGoogle.doc(_currentuser!.email).set({
            'name': _currentuser!.displayName,
            'email': _currentuser!.email,
            'photoUrl': _currentuser!.photoUrl,
            'uid': _currentuser!.id
          });
        }
      }
    } catch (error) {
      print("Errornya adalah: $error");
    }
  }

// ini ntuk signupnyaa
  Future<void> signUp() async {
    // ini untuk mengcreate email dan password
    final String email = emailControllerSignup.text;
    final String password = passwordControllerSignup.text;
    final String fullName = fullnameController.text;
    final String userName = usernameController.text;

    try {
      // Check if the email is already in use
      var user = await FirebaseAuth.instance
          .fetchSignInMethodsForEmail(email)
          .then((value) => (value));

      if (user.isNotEmpty) {
        // Email is already in use
        print("Email already in use");
        // Handle the situation (e.g., show an error message)
        return;
      }

      // tunggu untuk mengecreate email and password
      var userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      ////////////////////////////////////

      // Add user data to Firestore
      CollectionReference storeSignup =
          FirebaseFirestore.instance.collection('userSignup');

// ini untuk memasukan data signupnya ke firestore
// dan juga tambahkan pengecekan semisal datanya tidak sama dengan null akan mengcreate
      if (userCredential.user != null) {
        storeSignup.doc(userCredential.user!.uid).set({
          'name': fullName,
          'email': email,
          'photoUrl': '',
          'userName': userName,
          'uid': userCredential.user!.uid,
          'role': selectedRole.value
        });
      }

      print("Datanya terdaftar $userCredential");

      Get.toNamed('/page2');
      // ini method untuk texteditingcontroller ketika inputanya sesuah login
// jadi ini mengeclear semua inputan email dan passwordnya/ datanya
      emailControllerSignup.clear();
      passwordControllerSignup.clear();
      fullnameController.clear();
      usernameController.clear();
    } catch (error) {
      print("erronya adalah ${error.toString()}");
      return Future.error(error.toString());
    }
  }

// ini untuk user loginya
  Future<void> login() async {
    try {
      // Replace with actual email and password values
      var enteredEmail = emailController.text;
      var enteredPassword = passwordController.text;

      // Log in the user with email and password
      var userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: enteredEmail, password: enteredPassword);

// ini method untuk texteditingcontroller ketika inputanya sesuah login
// jadi ini mengeclear semua inputan email dan passwordnya/ datanya
      emailController.clear();
      passwordController.clear();
      ////////////////////////////////////

      // buat menampilkan jika login berhasil
      Get.defaultDialog(
        titleStyle: TextStyle(
            color: Colors.green, fontWeight: FontWeight.bold, fontSize: 22),
        title: "Login Successfully",
        middleTextStyle: TextStyle(fontSize: 20),
        middleText: "Berhasil Login",
      );
      await Future.delayed(Duration(
          seconds:
              2)); // ini untuk mendelayed agar default dialognya muncul dulu lalu navigasi ke dashboard
      Get.offAll(Dashboard()); // buat navigasi ke dashboarnya

      // If login is successful, you can navigate to the desired screen
      // Get.offAll(Dashboard());

      print("Successfully logged in: ${userCredential.user?.email}");
    } catch (e) {
      if (e is FirebaseAuthException) {
        // Handle FirebaseAuthException errors
        Get.defaultDialog(
          titleStyle: TextStyle(
              color: Color(hexcolour("#ED6363")),
              fontWeight: FontWeight.bold,
              fontSize: 22),
          backgroundColor: Colors.white,
          title: "Silahkan Daftar",
          onConfirm: () {
            Get.back();
          },
          middleTextStyle: TextStyle(
            fontSize: 20,
          ),
          middleText: "Email dan Password anda tidak terdaftar",
        );
        print("FirebaseAuthException - Code: ${e.code}, Message: ${e.message}");

        // Handle specific error codes
        if (e.code == 'user-not-found') {
          print("No user found for that email");
          // Handle accordingly
        } else if (e.code == 'wrong-password') {
          print("Wrong password provided for that user ${e.message}");
          // Handle accordingly (e.g., show an error message)
        } else {
          // Handle other FirebaseAuthException errors
          print("Error Auth exception: ${e.message}");
          // Handle accordingly (e.g., show an error message)
        }
      } else {
        // Handle other exceptions
        print("Error: $e");
        // Handle accordingly (e.g., show a generic error message)
      }
    }

    // ini buat login Seller
    try {
      CollectionReference loginSeller =
          FirebaseFirestore.instance.collection('loginSeller');
    } catch (error) {}
  }

// ini untuk fungsi logoutnya
  Future<void> logout() async {
    showDialog(
      context: Get.context!,
      builder: (context) => const profileDialog(),
    );
    await _googlesignin.signOut();
    // Delay to allow the user to see the loading dialog
    await Future.delayed(const Duration(seconds: 13));

    Get.defaultDialog(
      titleStyle: const TextStyle(
          color: Colors.green, fontWeight: FontWeight.bold, fontSize: 22),
      title: "Logout Successfully",
      middleTextStyle: const TextStyle(fontSize: 20),
      middleText: "Berhasil Logout",
    );
    await Future.delayed(const Duration(
        seconds:
            2)); // ini untuk mendelayed agar default dialognya muncul dulu lalu navigasi ke dashboard
    Get.offAll(const LoginScreen());
  }
}
