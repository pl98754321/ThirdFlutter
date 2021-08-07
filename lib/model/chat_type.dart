import 'package:flutter/material.dart';

class Chatdata {
  String text, name;
  DateTime date = DateTime.now();
  int id, icon_id, IsMe; // If isme = 1 it mean this Chat send by me
  Chatdata(
      {required this.text,
      required this.name,
      required this.IsMe,
      required this.icon_id,
      required this.date,
      this.id = 0});

  Map<String, Object?> Tomap() => {
        "text": this.text,
        "name": this.name,
        "IsMe": this.IsMe,
        "icon_id": this.icon_id,
        "date": this.date.toString()
      };
}
