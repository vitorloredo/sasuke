import 'package:flutter/material.dart';
import 'package:sasuke/interface/home.dart';
import 'package:sasuke/model/address.dart';
import 'package:sasuke/model/link.dart';
import 'package:sasuke/widget/home.dart';

class OffersData implements HomeInterface {
  DateTime date;
  String title;
  String user;
  AddressData address;
  Link link;
  String state;

  @override
  String get displayAndress => address.getDisplay;

  @override
  Widget get toWidget => HomeCard(homeInterface: this);

  @override
  Color get color => Colors.blue;

  @override
  bool get read => state == 'read';

  OffersData.fromJson(Map map) {
    state = map['state'];
    final embedded = map['_embedded'];
    title = embedded['title'];
  }
}