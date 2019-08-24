import 'package:flutter/material.dart';
import 'package:sasuke/interface/home.dart';

class HomeCard extends StatelessWidget {
  final HomeInterface homeInterface;

  HomeCard({@required this.homeInterface});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
            Radius.circular(5.0)
        ),
      ),
    );
  }
}