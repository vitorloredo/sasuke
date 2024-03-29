import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sasuke/interface/home.dart';
import 'package:sasuke/model/address.dart';
import 'package:sasuke/model/date.dart';
import 'package:sasuke/model/link.dart';
import 'package:sasuke/model/user.dart';
import 'package:sasuke/screen/detail.dart';
import 'package:sasuke/widget/home.dart';
import 'package:url_launcher/url_launcher.dart';


class LeadsData implements HomeInterface{
  @override
  String title;

  @override
  UserData user;

  @override
  Link link;

  @override
  Color get color => Colors.green;

  @override
  String get displayAndress => address.getDisplay;

  @override
  String get displayDate => date.getDisplay;

  @override
  Widget get toCard => HomeCard(
    viewData: this
  );

  @override
  DetailPage get onSelect => DetailPage(
    color: Colors.green,
    link: link,
    title: "Aceitos",
    bottomNavigationBar: navigatorbar,
    footer: "Fale com o cliente o quanto antes"
  );

  @override
  Widget get navigatorbar => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Expanded(
        child: GestureDetector(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 14.0),
            color: Colors.white,
            child: _iconTab(
              iconData: Icons.phone,
              text: "LIGAR",
              color: Colors.blue
            ),
          ),
          onTap: () async {
            var phone = "tel:+55119999999";
            await canLaunch(phone) ? launch(phone) : print("ops");
          },
        ),
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 10.0,
            width: 2.0,
            color: Colors.white,
          ),
          SizedBox(height: 32.0,),
          Container(
            height: 10.0,
            width: 2.0,
            color: Colors.white,
          ),
        ],
      ),
      Expanded(
        child: GestureDetector(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 14.0),
            color: Colors.white,
            child: _iconTab(
              iconData: Icons.message,
              text: "WHATSAPP",
              color: Colors.blue
            ),
          ),
          onTap: () async {
            var whatsappUrl ="whatsapp://send?phone=+55119999999";
            await canLaunch(whatsappUrl) ? launch(whatsappUrl) : print("not have whats");
          }
        ),
      )
    ],
  );

  Date date;
  AddressData address;

  LeadsData.fromJson(Map map) {
    date = Date(DateTime.parse(map['created_at']));
    final embedded = map['_embedded'];
    address = AddressData.fromJson(embedded['address']);
    user = UserData.fromMap(embedded['user']);
    title = embedded['request']['title'];
    link = Link.fromJson(map['_links']);
  }

  Row _iconTab({IconData iconData, String text, Color color}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(iconData, color: color,),
        SizedBox(width: 6.0,),
        Text(text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: color
        ),)
      ],
    );
  }
}