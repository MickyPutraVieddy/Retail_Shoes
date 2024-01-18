import 'dart:async';

import 'package:flutter/material.dart';
import 'package:retail_shoes/models/colour/colour.dart';
import 'package:get/get.dart';
import 'package:retail_shoes/models/screen/authentication/authentation.dart';

import 'package:retail_shoes/models/screen/listshoes/allshoes.dart';
import 'package:retail_shoes/models/screen/listshoes/basketball.dart';
import 'package:retail_shoes/models/screen/listshoes/hiking.dart';
import 'package:retail_shoes/models/screen/listshoes/running.dart';
import 'package:retail_shoes/models/screen/listshoes/training.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:retail_shoes/models/screen/navigationlist/basket.dart';
import 'package:retail_shoes/models/screen/navigationlist/chatbar.dart';
import 'package:retail_shoes/models/screen/navigationlist/favorite.dart';
import 'package:retail_shoes/models/screen/navigationlist/profile.dart';
import 'package:retail_shoes/models/screen/profile/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:retail_shoes/models/screen/profile/profiledialog/profilecontroller.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

// ini untuk topbar button
int current = 0;

// buat bottombar
int _current = 2;
var listjudul = ["All Shoes", "Running", "Training", "Basketball", "Hiking"];

// teruntuk textediting
final Textedit = TextEditingController();

// untuk list widget bottombar

final List<Widget> _widgetBar = <Widget>[
  basketscreen(),
  chatscreen(),
  allshoesScreen(),
  favoritescreen(),
  profileScreen(),
];

// untuk list widgetnya
final List<Widget> _widgetoptions = <Widget>[
  allshoesScreen(),
  RunningScreen(),
  TrainingScreen(),
  BasketBallScreen(),
  HikingScreen(),
];

final List<Widget> _icon = <Widget>[
  Icon(
    FontAwesome.cart_shopping_solid,
    size: 25,
    color: Color(hexcolour("#6C5ECF")),
  ),
  Icon(
    FontAwesome.message,
    size: 25,
    color: Color(hexcolour("#6C5ECF")),
  ),
  Icon(
    FontAwesome.basket_shopping_solid,
    size: 40,
    color: Color(hexcolour("#6C5ECF")),
  ),
  Icon(
    FontAwesome.heart,
    size: 25,
    color: Color(hexcolour("#6C5ECF")),
  ),
  Icon(
    FontAwesome.user,
    size: 25,
    color: Color(hexcolour("#6C5ECF")),
  ),
];

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    // untuk widget yang ingin di buat
    @override

// buat clean code resource jika widget sehabis di pakai
    @override
    void dispose() {
      super.dispose();
    }

    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
            color: Color(hexcolour("#2B2937")),
            items: _icon,
            letIndexChange: (value) => true,
            index: _current,
            onTap: (value) {
              setState(() {
                _current = value;
              });
            },
            height: 60,
            backgroundColor: Color(hexcolour("#1F1D2B"))),
        backgroundColor: Color(
          hexcolour("#1F1D2B"),
        ),
        // _checkbody pengecekan 2 body di bawah
        body: _CheckBody());
  }
}

// ini buat pengecekan dua boddy
Widget _CheckBody() {
  if (_current == 2) {
    return homebody(); // ini untuk tampilan allshoes
  } else {
    return navigatebody(
        current: current,
        useSingleChildScrollView: false,
        widgetBar: _widgetBar,
        widgetOptions: _widgetoptions,
        currentIndex: _current); // ini buat naviagatebar
  }
}

class homebody extends StatefulWidget {
  @override
  State<homebody> createState() => _homebodyState();
}

class _homebodyState extends State<homebody> {
  // ini untuk data streamnya

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = profilecontroller();

    return FutureBuilder<DocumentSnapshot<Object?>>(
        future: controller
            .getdata(AuthenticationController().instance.currentUser!.uid),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var userdata = snapshot.data!.data() as Map<String,
                dynamic>; // ini buat parsing data dari json ke String,dynamic
            var role = userdata['role'];
            late bool isSwitch;
            if (role == "Seller") {
              isSwitch = true;
            } else {
              isSwitch = false;
            }
            print(isSwitch);
            return Scaffold(
              floatingActionButton: isSwitch
                  ? FloatingActionButton(
                      onPressed: () {
                        Get.toNamed('/collection');
                      },
                      child: Icon(Icons.add),
                    )
                  : null, // Set to null if the u

              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Stack(children: [
                  Column(children: [
                    SizedBox(
                      height: 45,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(width: 1, color: Colors.grey)),
                            height: 50,
                            width: 350,
                            child: TextFormField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  prefixIcon: IconButton(
                                    icon: Icon(Icons.search),
                                    onPressed: () {},
                                    color: Color(hexcolour("#6C5ECF")),
                                  ),
                                  hintText: "Search for a shoes",
                                  hintStyle: TextStyle(
                                      color: Color(hexcolour("504F5E")))),
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(hexcolour("#999999")),
                          ),
                          child: InkWell(
                            onTap: () async {
                              String barcode =
                                  await FlutterBarcodeScanner.scanBarcode(
                                "#000000",
                                "CANCEL",
                                true,
                                ScanMode.QR,
                              );
                            },
                            child: Icon(
                              size: 40,
                              Icons.qr_code_scanner,
                              color: Color(hexcolour("#6C5ECF")),
                            ),
                          ),
                        )
                      ],
                    ),

                    SizedBox(
                      height: 50,
                    ),
                    Container(),

                    /// CUSTOM TABBAR
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: listjudul.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, index) {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      current = index;
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    margin: const EdgeInsets.all(5),
                                    width: 120,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: current == index
                                          ? Color(hexcolour("#6C5ECF"))
                                          : Color(hexcolour("#999999")),
                                      borderRadius: current == index
                                          ? BorderRadius.circular(15)
                                          : BorderRadius.circular(10),
                                      border: current == index
                                          ? Border.all(
                                              color: Colors.white54, width: 2)
                                          : Border.all(
                                              color:
                                                  Color(hexcolour("#999999"))),
                                    ),
                                    child: Center(
                                      child: Text(
                                        listjudul[index],
                                      ),
                                    ),
                                  ),
                                ),
                                Visibility(
                                    visible: current == index,
                                    child: Container(
                                      width: 5,
                                      height: 5,
                                      decoration: const BoxDecoration(
                                          color: Colors.purple,
                                          shape: BoxShape.circle),
                                    ))
                              ],
                            );
                          }),
                    ),

                    /// MAIN BODY
                    Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                            margin: const EdgeInsets.only(top: 30),
                            width: MediaQuery.of(context).size.width,
                            color: Colors.transparent,
                            height: double.maxFinite,
                            child: _current == 2
                                ? _widgetoptions.elementAt(current)
                                : _widgetBar.elementAt(_current))),
                  ]),
                ]),
              ),
            );
          }
          return CircularProgressIndicator();
        });
  }
}

class navigatebody extends StatelessWidget {
  final int current;
  final List<Widget> widgetBar;
  final List<Widget> widgetOptions;
  final int currentIndex;
  final bool useSingleChildScrollView; // Added parameter

  const navigatebody({
    Key? key,
    required this.current,
    required this.widgetBar,
    required this.widgetOptions,
    required this.currentIndex,
    required this.useSingleChildScrollView, // Added parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// MAIN BODY
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Container(
            margin: const EdgeInsets.only(top: 30),
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
            height: 760,
            child: useSingleChildScrollView
                ? Stack(children: [
                    SingleChildScrollView(
                      child: currentIndex == 2
                          ? widgetOptions.elementAt(current)
                          : widgetBar.elementAt(currentIndex),
                    ),
                  ])
                : currentIndex == 2
                    ? widgetOptions.elementAt(current)
                    : widgetBar.elementAt(currentIndex),
          ),
        ),
      ],
    );
  }
}
