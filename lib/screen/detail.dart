import 'package:flutter/material.dart';
import 'package:sasuke/model/detail.dart';
import 'package:sasuke/model/link.dart';
import 'package:sasuke/service/detail.dart';
import 'package:sasuke/view/load.dart';

class DetailPage extends StatefulWidget {
  final Color color;
  final Link link;
  final String title;

  DetailPage({
    @required this.color,
    @required this.link,
    @required this.title
  });

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(widget.title)
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: FutureBuilder(
        future: DetailService().get(widget.link),
        builder: (BuildContext bc, AsyncSnapshot<DetailData> detailSnap) {
          if(detailSnap.connectionState == ConnectionState.waiting) return Load();
          if(!detailSnap.hasData) return Center(child: Text("Ops... Algum erro aconteceu"),);
          return Column(

          );
        },
      ),
    );
  }
}