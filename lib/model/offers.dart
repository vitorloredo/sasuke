import 'package:flutter/material.dart';
import 'package:sasuke/interface/home.dart';
import 'package:sasuke/model/address.dart';
import 'package:sasuke/model/date.dart';
import 'package:sasuke/model/link.dart';
import 'package:sasuke/model/user.dart';
import 'package:sasuke/screen/detail.dart';
import 'package:sasuke/widget/home.dart';

class OffersData implements HomeInterface {
  @override
  Link link;

  @override
  String get displayAndress => address.getDisplay;

  @override
  Widget get toCard => HomeCard(
    viewData: this,
  );

  @override
  Color get color => read ? Colors.grey : Colors.blue;

  bool get read => state == 'read';

  @override
  String title;

  @override
  String get displayDate => date.getDisplay;

  @override
  UserData user;

  @override
  DetailPage get onSelect => DetailPage(
    color: Colors.blue,
    link: link,
    title: "Ofertas",
    bottomNavigationBar: navigatorbar,
    footer: "Aceite o pedido para destravar o contato!"
  );

  @override
  Widget get navigatorbar => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 14.0),
          color: Colors.white,
          child: _iconTab(
            iconData: Icons.close,
            text: "ACEITAR",
            color: Colors.grey
          ),
        ),
      ),
      Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 14.0),
          color: Colors.greenAccent[700],
          child: _iconTab(
            iconData: Icons.check,
            text: "RECUSAR",
            color: Colors.black
          ),
        ),
      )
    ],
  );

  Date date;
  AddressData address;
  String state;

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