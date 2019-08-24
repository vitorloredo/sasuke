import 'package:flutter/material.dart';
import 'package:sasuke/interface/home.dart';

class HomeCard extends StatelessWidget {
  final HomeInterface homeInterface;

  HomeCard({@required this.homeInterface});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
            Radius.circular(12.0)
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 12.0, bottom: 4.0),
            child: Text(
              homeInterface.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0
              ),
            ),
          ),
          Divider(),
          Row(
            children: <Widget>[
              IconText(
                Icons.person, homeInterface.user.user
              ),
              Spacer(),
              IconText(
                Icons.person, homeInterface.displayDate
              ),
            ],
          ),
          SizedBox(height: 12.0,),
          IconText(
            Icons.pin_drop, homeInterface.displayAndress
          ),
          SizedBox(height: 12.0,)
        ],
      ),
    );
  }

  IconText(IconData iconData, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(iconData, color: homeInterface.color,),
        SizedBox(width: 6.0,),
        Text(
          text,
          style: TextStyle(
            color: Colors.grey[600],
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}