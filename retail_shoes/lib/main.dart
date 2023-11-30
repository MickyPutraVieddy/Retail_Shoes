import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:retail_shoes/models/colour/colour.dart';
import 'package:retail_shoes/models/screen/dashboard/dashboard.dart';
import 'package:retail_shoes/models/screen/loginscreen/daftarscreen.dart';
import 'package:retail_shoes/models/screen/loginscreen/loginscreen.dart';

void main() => runApp(Mains());

class Mains extends StatelessWidget {
  const Mains({super.key});

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
      home: LoginScreen(),
    );
  }
}
