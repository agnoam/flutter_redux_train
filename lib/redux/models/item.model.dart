import 'package:flutter/material.dart';

class ItemModel {
  String title;
  Icon icon;
  bool checked;

  ItemModel({ this.title, this.icon, this.checked = false });
}