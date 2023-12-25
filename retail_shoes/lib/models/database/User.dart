import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class UserShoes extends GetxController {
  String gambar;
  String typeShoes;
  String namaSepatu;
  String description;
  int harga;

  UserShoes(
      {required this.gambar,
      required this.typeShoes,
      required this.namaSepatu,
      required this.description,
      required this.harga});
}
