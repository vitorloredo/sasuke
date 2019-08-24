import 'package:flutter/material.dart';
import 'package:sasuke/interface/home.dart';
import 'package:sasuke/model/address.dart';
import 'package:sasuke/model/date.dart';
import 'package:sasuke/model/link.dart';
import 'package:sasuke/model/user.dart';
import 'package:sasuke/widget/home.dart';

class OffersData implements HomeInterface {
  Date date;
  AddressData address;
  @override
  Link link;
  String state;

  @override
  String get displayAndress => address.getDisplay;

  @override
  Widget get toCard => HomeCard(
    viewData: this
  );

  @override
  Color get color => read ? Colors.grey : Colors.blue;

  @override
  bool get read => state == 'read';

  @override
  String title;

  @override
  String get displayDate => date.getDisplay;

  @override
  UserData user;

  OffersData.fromJson(Map map) {
    state = map['state'];
    final embedded = map['_embedded']['request'];
    title = embedded['title'];
    final valor = embedded['_embedded'];
    user = UserData.fromMap(valor['user']);
    date = Date(DateTime.parse(embedded['created_at']));
    address = AddressData.fromJson(valor['address']);
    link = Link.fromJson(map['_links']);
  }

  @override
  Color get colorType => Colors.blue;

  @override
  String get nameType => "Disponivel";
}