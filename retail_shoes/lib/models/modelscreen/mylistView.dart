import 'package:flutter/material.dart';
import 'package:retail_shoes/models/colour/colour.dart';

class Mylistview extends StatelessWidget {
  final String image;
  final String judul;
  final String description;
  final String harga;

  const Mylistview(
      {super.key,
      required this.image,
      required this.judul,
      required this.description,
      required this.harga});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: 150,
              width: 150,
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20)),
              child: InkWell(
                child: Image.asset(
                  image,
                ),
                onTap: () {},
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  width: 100,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      textAlign: TextAlign.start,
                      judul,
                      style: TextStyle(
                          color: Color(hexcolour("#999999")), fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  width: 200,
                  child: Text(
                    description,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  child: Text(
                    harga,
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  padding: EdgeInsets.only(right: 120),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
