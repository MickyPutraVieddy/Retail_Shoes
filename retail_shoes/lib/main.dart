import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:retail_shoes/models/colour/colour.dart';
import 'package:retail_shoes/models/screen/authentication/authentation.dart';
import 'package:retail_shoes/models/screen/dashboard/dashboard.dart';
import 'package:retail_shoes/models/screen/description/descriptionarunning.dart';
import 'package:retail_shoes/models/screen/loginscreen/daftarscreen.dart';
import 'package:retail_shoes/models/screen/loginscreen/loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:retail_shoes/models/screen/splash/splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // sbelumnya menggunakan options: defaultFirebaseoptions // tidak mengget apinya sehingga error di prosess authenhicationya
  // ini menggunakan firebaseoption mengget semua id/api pada firebase sehingga bisa di get datanya di authenhication dan tidak error
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyCY_Xv3lT6dM0bH_wqJQH-6-M-DEUiHWv8",
          appId: "1:495969882636:android:1f7f58c3b5edfd44e85429",
          messagingSenderId: "495969882636",
          projectId: "retailshoesstorage"));
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
        GetPage(
          name: '/pagedescription',
          page: () => descriptionscreenall(),
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
          } else {}
          return splashscreen();
        },
      ),
    );
  }
}
