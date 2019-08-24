import 'package:flutter/material.dart';
import 'package:sasuke/model/link.dart';
import 'package:sasuke/model/user.dart';

abstract class HomeInterface {
  String get displayAndress;
  Widget get toCard;
  Color get color;
  bool get read;
  String title;
  UserData user;
  String get displayDate;
  Color get colorType;
  Link link;
  String get nameType;
  Widget get navigatorbar;
}