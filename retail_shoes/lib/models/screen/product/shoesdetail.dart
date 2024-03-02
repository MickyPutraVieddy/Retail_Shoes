import 'dart:ui';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:retail_shoes/models/colour/colour.dart';

class ShoesDetailScreen extends StatefulWidget {
  const ShoesDetailScreen({super.key});

  @override
  State<ShoesDetailScreen> createState() => _ShoesDetailScreenState();
}

class _ShoesDetailScreenState extends State<ShoesDetailScreen> {
  final List<String> gambar = [
    "lib/models/Image/logo/running-shoe.png",
    "lib/models/Image/logo/sneakers.png",
    "lib/models/Image/logo/basketball.png"
  ];

  List<bool> isClicked = [false, false, false];
  @override
  Widget build(BuildContext context) {
    final int itemcount = 3;
    List<bool> checktrue = List.generate(itemcount, (index) => false);
    return Scaffold(
      resizeToAvoidBottomInset: false, // ini untuk biar keyboard tidak overflow
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: EdgeInsets.only(
            left: 59,
          ),
          child: Text(
            "Shoes Collection",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.cyan,
                ),
                child: Align(
                  child: Text(
                    "1",
                    style: TextStyle(color: Colors.white),
                  ),
                  alignment: Alignment.center,
                ),
              ),
              Container(
                height: 10,
                width: 100,
                color: Colors.cyan,
              ),
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.cyan,
                ),
                child: Align(
                  child: Text(
                    "2",
                    style: TextStyle(color: Colors.white),
                  ),
                  alignment: Alignment.center,
                ),
              ),
              Container(
                height: 10,
                width: 100,
                color: Color(hexcolour("#eab676")),
              ),
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(hexcolour("#eab676")),
                ),
                child: Align(
                  child: Text(
                    "3",
                    style: TextStyle(color: Colors.white),
                  ),
                  alignment: Alignment.center,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            child: Text(
              "Shoes Name",
              style: TextStyle(fontSize: 18, color: Colors.grey.shade500),
            ),
            padding: EdgeInsets.only(right: 260),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Colors.grey)),
                height: 50,
                width: 350,
                child: TextFormField(
                  // controller: authC.emailController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.tram_sharp,
                        color: Color(hexcolour("#6C5ECF")),
                      ),
                      hintText: "Shoes Name",
                      hintStyle: TextStyle(color: Color(hexcolour("504F5E")))),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            child: Text(
              "Type Shoes",
              style: TextStyle(fontSize: 18, color: Colors.grey.shade500),
            ),
            padding: EdgeInsets.only(right: 270),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Colors.grey)),
                height: 50,
                width: 350,
                child: TextFormField(
                  // controller: authC.emailController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.tram_sharp,
                        color: Color(hexcolour("#6C5ECF")),
                      ),
                      hintText: "Type Shoes",
                      hintStyle: TextStyle(color: Color(hexcolour("504F5E")))),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            child: Text(
              "Description Shoes",
              style: TextStyle(fontSize: 18, color: Colors.grey.shade500),
            ),
            padding: EdgeInsets.only(right: 210),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(right: 35, left: 10),
            child: Center(
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                minLines: 2,
                maxLines: 2,
                maxLength: 200,
                // controller: authC.emailController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20).copyWith(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(40),
                            topLeft: Radius.circular(45))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(40).copyWith(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(45),
                        )),
                    // hintMaxLines: 270,
                    prefixIcon: Icon(
                      Icons.tram_sharp,
                      color: Color(hexcolour("#6C5ECF")),
                    ),
                    hintText: "Description Shoes",
                    hintStyle: TextStyle(color: Color(hexcolour("504F5E")))),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            child: Text(
              "Category Shoes",
              style: TextStyle(fontSize: 18, color: Colors.grey.shade500),
            ),
            padding: EdgeInsets.only(right: 210),
          ),
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            // color: Colors.blue,
            child: GridView.builder(
              padding: EdgeInsets.only(
                right: 40,
              ),
              itemCount: itemcount,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 30, top: 30, bottom: 10),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: isClicked[index] ? Colors.green : Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isClicked[index] ? Colors.green : Colors.white,
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isClicked[index] = !isClicked[index];
                          print(isClicked);
                        });
                      },
                      child: Stack(
                        children: [
                          BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Colors.red, Colors.white],
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10, top: 10),
                            child: Image.asset("${gambar[index]}"),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              height: 50,
              width: 350,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(hexcolour("#2b2d47"))),
                  onPressed: () {
                    Get.toNamed("/product");
                  },
                  child: Text(
                    "CONTINUE ADD PRODUCT",
                    style: TextStyle(color: Colors.white),
                  )))
        ],
      ),
    );
  }
}
