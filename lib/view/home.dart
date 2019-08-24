import 'package:flutter/material.dart';
import 'package:sasuke/model/view.dart';

class HomeView extends StatelessWidget {
  final ViewData viewData;

  HomeView({@required this.viewData});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(12.0),
      itemCount: viewData.listHomeInter.length,
      itemBuilder: (BuildContext bc, int index) {
        final homeInterface = viewData.listHomeInter[index];
        return homeInterface.toCard;
      },
    );
  }
}