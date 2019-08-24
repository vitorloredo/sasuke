import 'package:flutter/material.dart';
import 'package:sasuke/interface/home.dart';

class HomeView extends StatefulWidget {
  final List<HomeInterface> listInterface;

  HomeView({@required this.listInterface});

  @override
  OoffersStateView createState() => OoffersStateView();
}

class OoffersStateView extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
}