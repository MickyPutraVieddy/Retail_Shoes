import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

import 'package:retail_shoes/models/colour/colour.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';

import 'package:get/get.dart';

class addProductScreen extends StatefulWidget {
  const addProductScreen({super.key});

  @override
  State<addProductScreen> createState() => _addProductScreenState();
}

class _addProductScreenState extends State<addProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: EdgeInsets.only(
            left: 70,
          ),
          child: Text(
            "ADD PRODUCT",
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
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 180),
            child: Container(
              child: Text(
                "ADD PRODUCT",
                style: TextStyle(
                    color: Color(hexcolour("#2b2d47")),
                    fontSize: 21,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              child: Text("You can add upto 3 products for your collection"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(right: 250),
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(hexcolour("#dbd3d3")),
              ),
              child: InkWell(
                child: Icon(
                  Icons.camera_alt_outlined,
                  size: 40,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            child: Text(
              "Price",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.bold),
            ),
            padding: EdgeInsets.only(right: 320),
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
                      hintText: "Price of Items",
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
              "Add Sizes",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.bold),
            ),
            padding: EdgeInsets.only(right: 280),
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
                      hintText: "Add Sizes",
                      hintStyle: TextStyle(color: Color(hexcolour("504F5E")))),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 220,
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
                    "Post Now",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )))
        ],
      ),
    );
  }
}
