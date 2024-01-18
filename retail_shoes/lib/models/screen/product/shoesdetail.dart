import 'package:flutter/material.dart';
import 'package:retail_shoes/models/colour/colour.dart';

class ShoesDetailScreen extends StatefulWidget {
  const ShoesDetailScreen({super.key});

  @override
  State<ShoesDetailScreen> createState() => _ShoesDetailScreenState();
}

class _ShoesDetailScreenState extends State<ShoesDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              SizedBox(
                height: 20,
              ),
            ],
          )
        ],
      ),
    );
  }
}
