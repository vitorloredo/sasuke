import 'package:flutter/material.dart';

abstract class HomeInterface {
  String get displayAndress;
  Widget get toCard;
  Color get color;
  bool get read;
  String title;
  String user;
  String get displayDate;
}