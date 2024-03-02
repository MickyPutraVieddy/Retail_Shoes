import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:retail_shoes/models/colour/colour.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:retail_shoes/models/database/User.dart';

class descriptionscreenall extends StatefulWidget {
  const descriptionscreenall({Key? key}) : super(key: key);

  @override
  State<descriptionscreenall> createState() => _descriptionscreenallState();
}

class _descriptionscreenallState extends State<descriptionscreenall> {
  dynamic _selectedindex = {};
  int _current = 0;

  // ini untuk data"

  // untuk mengklik icon love
  bool _isclicked = false;

  // buat gambar list fimiliar shoes
  final List<String> gambarlist = [
    "lib/models/Image/Shoes/Running/Running1.png",
    "lib/models/Image/Shoes/Running/Running4.png",
    "lib/models/Image/Shoes/Running/Running5.png",
    "lib/models/Image/Shoes/Running/Running6.png",
  ];

  final List<dynamic> gambar = [
    {
      'image': 'lib/models/Image/Shoes/Running/Running1.png',
    },
    {
      'image': 'lib/models/Image/Shoes/Running/Running2.png',
    },
    {
      'image': 'lib/models/Image/Shoes/Running/Running3.png',
    },
  ];

  final CarouselController _controller = CarouselController();

  Widget build(BuildContext context) {
    // untuk mengepaskan layout width
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          // Move the container above the Carousel

          Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                height: height,
                width: width,
                color: Colors.white,
                child: Container(
                  width: width,
                  height: 400,
                  decoration: BoxDecoration(color: Colors.transparent),
                  child: CarouselSlider(
                    carouselController: _controller,
                    options: CarouselOptions(
                      aspectRatio: 40 / 40,
                      viewportFraction: 1,
                      enlargeFactor: 1.5,
                      enlargeCenterPage: false,
                      autoPlay: true,
                      initialPage: 0,
                      pageSnapping: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      },
                    ),
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
                            child: Column(
                              children: [
                                Container(
                                  height: 400,
                                  clipBehavior: Clip.hardEdge,
                                  decoration:
                                      BoxDecoration(color: Colors.white),
                                  child: Image.asset(
                                    movie['image'],
                                    width: width,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),
              Positioned(
                top: 320,
                child: Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(hexcolour("#1F1D2B")),
                  ),
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 40, left: 20),
                          child: ListTile(
                            subtitle: Text(
                              "Running",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                            title: Text(
                              "TERREX URBAN LOW",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            onTap: () {
                              setState(() {
                                print("dipencet");
                                _isclicked = !_isclicked;
                              });
                            },
                            trailing: _isclicked
                                ? Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.purple.shade600,
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.favorite,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                  )
                                : Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey.shade800,
                                    ),
                                    child: Center(
                                        child: Icon(
                                      Icons.favorite,
                                      color: Colors.black,
                                      size: 30,
                                    ))), // or Container() based on your preference
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        color: Color(hexcolour("#2B2937")),
                        height: 60,
                        width: 350,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Price Start From",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            SizedBox(
                              width: 100,
                            ),
                            Text(
                              "Rp.43434",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, right: 215),
                        child: Text(
                          "Description",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Container(
                          width: 400,
                          height: 90,
                          child: Text(
                            "Unpaved trails and mixed surfaces are easy when you have the traction and support you need. Casual enough for the daily commute.",
                            style: TextStyle(
                                color: Color(hexcolour("#999999")),
                                fontSize: 18),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 190),
                        child: Text(
                          "Fimilliar Shoes",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          height: 80,
                          width: 400, // Sesuaikan tinggi dengan kebutuhan
                          child: ListView.builder(
                            scrollDirection: Axis
                                .horizontal, // Pilih arah scroll yang diinginkan
                            itemCount: gambarlist.length,
                            itemBuilder: (context, index) {
                              final shoe = gambarlist[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: InkWell(
                                    onTap: () {}, // still not solving navigate
                                    child: Image.asset(
                                      shoe,
                                      width:
                                          70, // Sesuaikan lebar dengan kebutuhan
                                      height:
                                          70, // Sesuaikan tinggi dengan kebutuhan
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.transparent,
                                border: Border.all(
                                    width: 2,
                                    color: Color(hexcolour("#6C5ECF")))),
                            child: Center(
                                child: IconButton(
                                    splashRadius: 80,
                                    onPressed: () {},
                                    icon: SvgPicture.asset(
                                        "lib/models/Image/logo/Chat.svg"))),
                          ),
                          SizedBox(
                            width: 35,
                          ),
                          Container(
                            height: 60,
                            width: 150,
                            child: ElevatedButton(
                              style: ButtonStyle(backgroundColor:
                                  MaterialStateProperty.resolveWith(
                                (states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return Colors.green;
                                  } else {
                                    return Color(hexcolour("#6C5ECF"));
                                  }
                                },
                              )),
                              onPressed: () {},
                              child: Text(
                                "Add to Cart",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: 20,
                  left: 10,
                  child: Row(
                    children: [
                      IconButton(
                          iconSize: 30,
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(Icons.arrow_back_ios)),
                      SizedBox(
                        width: 300,
                      ),
                      IconButton(
                          iconSize: 20,
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            "lib/models/Image/logo/CartBag.svg",
                            height: 30,
                          ))
                    ],
                  )),
              Positioned(
                bottom: 515,
                left: 0.0,
                right: 0.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: gambar.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: _current == entry.key ? 35 : 11,
                        height: 12.0,
                        margin: EdgeInsets.symmetric(horizontal: 3.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: _current == entry.key
                              ? Color(hexcolour("#6C5ECF"))
                              : Colors.grey,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
            fit: StackFit.passthrough,
          ),
        ],
      ),
    );
  }
}
