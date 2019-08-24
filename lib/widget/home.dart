import 'package:flutter/material.dart';
import 'package:sasuke/interface/home.dart';

class HomeCard extends StatelessWidget {
  final HomeInterface homeInterface;

  HomeCard({@required this.homeInterface});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      height: 20.0,
      width: 20.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
            Radius.circular(5.0)
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(0),
            child: Text(homeInterface.title),
          )
        ],
      ),
    );
  }
}