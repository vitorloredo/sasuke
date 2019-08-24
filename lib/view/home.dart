import 'package:flutter/material.dart';
import 'package:sasuke/model/view.dart';

class HomeView extends StatefulWidget {
  final ViewData viewData;

  HomeView({@required this.viewData});

  @override
  OoffersStateView createState() => OoffersStateView();
}

class OoffersStateView extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
}