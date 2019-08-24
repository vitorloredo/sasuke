import 'package:flutter/material.dart';
import 'package:sasuke/model/view.dart';
import 'package:sasuke/widget/home.dart';

class HomeView extends StatefulWidget {
  final ViewData viewData;

  HomeView({@required this.viewData});

  @override
  OoffersStateView createState() => OoffersStateView();
}

class OoffersStateView extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(12.0),
      itemCount: widget.viewData.listHomeInter.length,
      itemBuilder: (BuildContext bc, int index) {
        final homeInterface = widget.viewData.listHomeInter[index];
        return HomeCard(homeInterface: homeInterface);
      },
    );
  }
}