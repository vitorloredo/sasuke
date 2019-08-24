import 'package:flutter/material.dart';
import 'package:sasuke/model/detail.dart';
import 'package:sasuke/model/link.dart';
import 'package:sasuke/service/detail.dart';

class DetailPage extends StatefulWidget {
  final Color color;
  final Link link;

  DetailPage({@required this.color, @required this.link});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: DetailService().get(widget.link),
        builder: (BuildContext bc, AsyncSnapshot<DetailData> detailSnap) {
          return SizedBox();
        },
      ),
    );
  }
}