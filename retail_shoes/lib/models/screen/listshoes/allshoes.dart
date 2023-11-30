import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:retail_shoes/models/colour/colour.dart';
import 'package:retail_shoes/models/modelscreen/mylistView.dart';

class allshoesScreen extends StatefulWidget {
  @override
  State<allshoesScreen> createState() => _allshoesScreenState();
}

class _allshoesScreenState extends State<allshoesScreen> {
  //ini index gak boleh di context "untuk indicatorslide"
  int _current = 0;

// untuk index bottombar
  int _selected = 0;

  //
  dynamic _selectedindex = {};

// untuk list gambar slider 1
  final List<dynamic> gambar = [
    {
      'title': 'Hiking',
      'image': 'lib/models/Image/sepatuP.png',
      'description': 'TERREX URBAN LOW',
      'price': 200
    },
    {
      'title': 'Hiking',
      'image': 'lib/models/Image/sepatuP2.png',
      'description': 'COURT VISION 2.0',
      'price': 200
    },
    {
      'title': 'Hiking',
      'image': 'lib/models/Image/sepatuP3.png',
      'description': 'COURT VISION 1.0',
      'price': 200
    },
  ];

  final CarouselController _controller = CarouselController();

// ignore: unused_local_variable
  final pagecontroller = PageController();

  @override
  Widget build(BuildContext context) {
    // jika width samping lebar sama
    final width = MediaQuery.of(context).size.width;
    // jika height tinggi sama
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              "Popular Products",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          SizedBox(
            height: 20,
          ),

          // bagian carouselslidernya buat #Popular Product
          Container(
            width: 700,
            height: 380,
            decoration: BoxDecoration(),
            child: CarouselSlider(
                carouselController: _controller,
                options: CarouselOptions(
                    aspectRatio: 20 / 20,
                    viewportFraction: 0.70,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    pageSnapping: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
                items: gambar.map((movie) {
                  return Builder(
                    builder: (BuildContext context) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_selectedindex == movie) {
                              _selectedindex = {};
                            } else {
                              _selectedindex = movie;
                            }
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: _selectedindex == movie
                                  ? Border.all(
                                      color: Colors.blue.shade500, width: 3)
                                  : null,
                              boxShadow: _selectedindex == movie
                                  ? [
                                      BoxShadow(
                                          color: Colors.blue.shade100,
                                          blurRadius: 30,
                                          offset: Offset(0, 10))
                                    ]
                                  : [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          blurRadius: 20,
                                          offset: Offset(0, 5))
                                    ]),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                    height: 270,
                                    margin: EdgeInsets.only(top: 10),
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: InkWell(
                                        onTap: () {}, // Handle your callback.
                                        splashColor:
                                            Colors.blue.withOpacity(0.5),
                                        child: Image.asset(
                                          movie['image'],
                                          width: 300,
                                          fit: BoxFit.cover,
                                        ))),
                                SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 35),
                                    child: Text(
                                      movie['title'],
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Color(hexcolour("#999999")),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 35),
                                    child: Text(
                                      movie['description'],
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 35),
                                    child: Text(
                                      movie['price'].toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }).toList()),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 210),
            child: Text(
              "New Arrivals",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Mylistview(
                image: "lib/models/Image/sepatuP2.png",
                judul: "Football",
                description: "Predator 20.3 Firm Ground",
                harga: "Rp.200.000"),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Mylistview(
                image: "lib/models/Image/sepatuP2.png",
                judul: "Football",
                description: "Predator 20.3 Firm Ground",
                harga: "Rp.200.000"),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Mylistview(
                image: "lib/models/Image/sepatuP2.png",
                judul: "Football",
                description: "Predator 20.3 Firm Ground",
                harga: "Rp.200.000"),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Mylistview(
                image: "lib/models/Image/sepatuP2.png",
                judul: "Football",
                description: "Predator 20.3 Firm Ground",
                harga: "Rp.200.000"),
          ),
        ]));
  }
}
