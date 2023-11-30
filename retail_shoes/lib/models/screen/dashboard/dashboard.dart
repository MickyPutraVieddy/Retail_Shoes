import 'package:flutter/material.dart';
import 'package:retail_shoes/models/colour/colour.dart';
import 'package:retail_shoes/models/screen/listshoes/allshoes.dart';
import 'package:retail_shoes/models/screen/listshoes/basketball.dart';
import 'package:retail_shoes/models/screen/listshoes/hiking.dart';
import 'package:retail_shoes/models/screen/listshoes/running.dart';
import 'package:retail_shoes/models/screen/listshoes/training.dart';
import 'package:get/get.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:icons_plus/icons_plus.dart';

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

final List<Widget> _widgetbar = <Widget>[
  
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
    FontAwesome.house,
    size: 25,
    color: Color(hexcolour("#6C5ECF")),
  ),
  Icon(
    FontAwesome.message,
    size: 25,
    color: Color(hexcolour("#6C5ECF")),
  ),
  Icon(
    FontAwesome.basket_shopping,
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
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
            color: Color(hexcolour("#2B2937")),
            items: _icon,
            letIndexChange: (value) => true,
            index: _current,
            height: 60,
            backgroundColor: Color(hexcolour("#1F1D2B"))),
        backgroundColor: Color(
          hexcolour("#1F1D2B"),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
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
                        border: Border.all(width: 1, color: Colors.grey)),
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
                          hintStyle:
                              TextStyle(color: Color(hexcolour("504F5E")))),
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
                    onTap: () {},
                    child: Icon(
                      FontAwesome.user,
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
                                  ? Border.all(color: Colors.white54, width: 2)
                                  : Border.all(
                                      color: Color(hexcolour("#999999"))),
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
                                  color: Colors.purple, shape: BoxShape.circle),
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
                    child: _widgetoptions.elementAt(current))),
          ]),
        ));
  }
}
