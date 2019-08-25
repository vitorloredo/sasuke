import 'package:flutter/material.dart';
import 'package:sasuke/model/link.dart';
import 'package:sasuke/model/user.dart';
import 'package:sasuke/screen/detail.dart';

abstract class HomeInterface {
  String get displayAndress;
  Widget get toCard;
  Color get color;
  String get displayDate;
  Widget get navigatorbar;
  DetailPage get onSelect;
  String title;
  UserData user;
  Link link;
}