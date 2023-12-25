import 'package:flutter/material.dart';
import 'package:retail_shoes/models/colour/colour.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import 'package:retail_shoes/models/database/User.dart';
import 'package:retail_shoes/models/screen/authentication/authentation.dart';
import 'package:retail_shoes/models/screen/profile/profiledialog/profilecontroller.dart';
import 'package:retail_shoes/models/screen/profile/profiledialog/profiledialog.dart';

class basketscreen extends StatelessWidget {
  const basketscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var isLogout = AuthenticationController();
    final controller = profilecontroller();

    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 100,
                width: width,
                child: Center(
                  child: Text(
                    "Favorite Shoes",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ),
              Container(
                height: 659,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(hexcolour("#242231"))),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 210),
                      child: Container(
                        height: 400,
                        width: width,
                        child: Column(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              child: Icon(
                                Icons.abc,
                                size: 100,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              child: Text(
                                "you don't have dream shoes?",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              height: 30,
                              child: Text(
                                "Let's find your favorite shoes",
                                style: TextStyle(
                                    color: Colors.grey.shade600, fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 50,
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40)),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Color(hexcolour("#6C5ECF"))),
                                  onPressed: () {},
                                  child: Text(
                                    "Explore Store",
                                    style: TextStyle(color: Colors.white),
                                  )),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
