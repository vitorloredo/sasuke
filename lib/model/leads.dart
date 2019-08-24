import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sasuke/interface/home.dart';
import 'package:sasuke/model/address.dart';
import 'package:sasuke/model/date.dart';
import 'package:sasuke/model/link.dart';
import 'package:sasuke/model/user.dart';
import 'package:sasuke/widget/home.dart';

class LeadsData implements HomeInterface{
  @override
  String title;

  @override
  UserData user;

  Date date;
  AddressData address;

  @override
  Link link;

  String state;

  @override
  Color get color => Colors.green;

  @override
  String get displayAndress => address.getDisplay;

  @override
  String get displayDate => date.getDisplay;

  @override
  bool get read => null;

  @override
  Widget get toCard => HomeCard(
    viewData: this
  );

  LeadsData.fromJson(Map map) {
    date = Date(DateTime.parse(map['created_at']));
    final embedded = map['_embedded'];
    address = AddressData.fromJson(embedded['address']);
    user = UserData.fromMap(embedded['user']);
    title = embedded['request']['title'];
    link = Link.fromJson(map['_links']);
  }

  @override
  Color get colorType => Colors.green;

  @override
  String get nameType => "Disponivel";
}