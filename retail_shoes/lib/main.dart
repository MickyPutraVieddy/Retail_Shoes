import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:retail_shoes/models/database/UserRepository.dart';
import 'package:retail_shoes/models/screen/authentication/authentation.dart';
import 'package:retail_shoes/models/screen/dashboard/dashboard.dart';
import 'package:retail_shoes/models/screen/description/descriptionarunning.dart';
import 'package:retail_shoes/models/screen/loginscreen/daftarscreen.dart';
import 'package:retail_shoes/models/screen/loginscreen/loginscreen.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:retail_shoes/models/screen/qrscanner/scanner.dart';
import 'package:retail_shoes/models/screen/splash/splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // sbelumnya menggunakan options: defaultFirebaseoptions // tidak mengget apinya sehingga error di prosess authenhicationya
  // ini menggunakan firebaseoption mengget semua id/api pada firebase sehingga bisa di get datanya di authenhication dan tidak error
  await Firebase.initializeApp(
      options: const FirebaseOptions(
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
          page: () => const LoginScreen(),
        ),
        GetPage(
          name: '/page3',
          page: () => const daftarscreen(),
        ),
        GetPage(
          name: '/page4',
          page: () => const Dashboard(),
        ),
        GetPage(
          name: '/pagedescription',
          page: () => const descriptionscreenall(),
        ),
        GetPage(
          name: '/scan',
          page: () => const scanScreen(),
        ),
      ],
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Future.delayed(const Duration(seconds: 5), () {
              Get.offAll(() => const LoginScreen());
              // print("datanya ada");
            });
            Get.put(AuthenticationController());
            // Get.put(Data());
            Get.put(homebody());
          } else {}
          return const splashscreen();
        },
      ),
    );
  }
}
