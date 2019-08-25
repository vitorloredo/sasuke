import 'package:flutter/material.dart';
import 'package:sasuke/model/view.dart';
import 'package:sasuke/screen/detail.dart';

class HomeView extends StatelessWidget {
  final ViewData viewData;
  final DetailPage Function() onSelect;

  HomeView({@required this.viewData, this.onSelect});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(12.0),
      itemCount: viewData.listHomeInter.length,
      itemBuilder: (BuildContext bc, int index) {
        final homeInterface = viewData.listHomeInter[index];
        return GestureDetector(
          child: homeInterface.toCard,
          onTap: () =>  Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => homeInterface.onSelect
            ),
          ),
        );
      },
    );
  }
}