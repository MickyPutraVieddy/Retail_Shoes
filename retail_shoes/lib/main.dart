import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:retail_shoes/models/colour/colour.dart';
import 'package:retail_shoes/models/screen/authentication/authentation.dart';
import 'package:retail_shoes/models/screen/dashboard/dashboard.dart';
import 'package:retail_shoes/models/screen/loginscreen/daftarscreen.dart';
import 'package:retail_shoes/models/screen/loginscreen/loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:retail_shoes/models/screen/splash/splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Mains());
}

class Mains extends StatelessWidget {
  // untuk database firebase
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(
          name: '/page2',
          page: () => LoginScreen(),
        ),
        GetPage(
          name: '/page3',
          page: () => daftarscreen(),
        ),
        GetPage(
          name: '/page4',
          page: () => Dashboard(),
        ),
      ],
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Future.delayed(Duration(seconds: 5), () {
              Get.offAll(() => LoginScreen());
              print("datanya ada");
            });
            Get.put(AuthenticationController());
          } else {
            print("Datanya tidak ada");
          }
          return splashscreen();
        },
      ),
    );
  }
}
