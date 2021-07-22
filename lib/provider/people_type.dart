import 'package:flutter/material.dart';

class People {
  String title, subtitle;
  DateTime date = DateTime.now();
  int id, icon_id;
  People(
      {required this.title,
      required this.subtitle,
      required this.icon_id,
      required this.date,
      this.id = 0});

  Map<String, Object?> Tomap() => {
        "title": this.title,
        "subtitle": this.subtitle,
        "icon_id": this.icon_id,
        "date": this.date.toString()
      };
}
