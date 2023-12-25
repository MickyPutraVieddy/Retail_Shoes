import 'package:flutter/material.dart';
import 'package:retail_shoes/models/colour/colour.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import 'package:retail_shoes/models/database/User.dart';
import 'package:retail_shoes/models/screen/authentication/authentation.dart';
import 'package:retail_shoes/models/screen/profile/profiledialog/profilecontroller.dart';
import 'package:retail_shoes/models/screen/profile/profiledialog/profiledialog.dart';

class profileScreen extends StatelessWidget {
  const profileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var isLogout = AuthenticationController();
    final controller = profilecontroller();

    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: FutureBuilder<DocumentSnapshot<Object?>>(
        future: controller
            .getdata(AuthenticationController().instance.currentUser!.uid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }

            var userdata = snapshot.data!.data() as Map<String,
                dynamic>; // ini buat parsing data dari json ke String,dynamic
            print(userdata);

            return SingleChildScrollView(
              child: Column(
                children: [
                  SafeArea(
                      child: ListTile(
                    titleTextStyle:
                        TextStyle(color: Colors.white, fontSize: 24),
                    subtitleTextStyle: TextStyle(color: Colors.grey.shade300),
                    subtitle: Text(
                      userdata['email'],
                      style: TextStyle(fontSize: 15),
                    ),
                    trailing: Ink(
                        height: 40,
                        width: 20,
                        child: InkWell(
                          onTap: () {
                            isLogout.logout();
                            print("berhasi Logout");
                          },
                          splashColor: Colors.red,
                          child: Icon(
                            Icons.exit_to_app,
                            color: Colors.red,
                          ),
                        )),
                    title: Text(
                      "Welcome ${userdata['userName']}",
                    ),
                    leading: CircleAvatar(
                        radius: 60,
                        child: Image.asset('lib/models/Image/Profile.png')),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 659,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(hexcolour("#242231"))),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 250),
                          child: Text(
                            "Account",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            print("di pencet");
                          },
                          child: Container(
                            width: width,
                            height: 50,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 37,
                                ),
                                Text(
                                  "Edit Profile",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  width: 250,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () {
                            print("di pencet");
                          },
                          child: Container(
                            width: width,
                            height: 50,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 35,
                                ),
                                Text(
                                  "Your Orders",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  width: 246,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () {
                            print("di pencet");
                          },
                          child: Container(
                            width: width,
                            height: 50,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 37,
                                ),
                                Text(
                                  "Help",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  width: 300,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 260),
                          child: Text(
                            "General",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            print("di pencet");
                          },
                          child: Container(
                            width: width,
                            height: 50,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 37,
                                ),
                                Text(
                                  "Privacy & Policy",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  width: 214,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () {
                            print("di pencet");
                          },
                          child: Container(
                            width: width,
                            height: 50,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 35,
                                ),
                                Text(
                                  "Term of Service",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  width: 217,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () {
                            print("di pencet");
                          },
                          child: Container(
                            width: width,
                            height: 50,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 37,
                                ),
                                Text(
                                  "Rate App",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  width: 265,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Center(
              child: Text(
                  'Unexpected connection state: ${snapshot.connectionState}'),
            );
          }
        },
      ),
    );
  }
}
