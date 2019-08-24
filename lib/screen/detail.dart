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
          final detail = detailSnap.data;
          return Container(
            width: double.infinity,
            margin: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0)
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _map(),
                  _title(detail),
                  Divider(
                    indent: 18.0,
                    endIndent: 18.0,
                  ),
                  SizedBox(height: 6.0,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _iconTab(
                          text: detail.user.user,
                          iconData: Icons.person
                        ),
                        SizedBox(height: 8.0,),
                        _iconTab(
                          text: detail.address.getDisplay,
                          iconData: Icons.pin_drop
                        ),
                        Text(
                          detail.distanceDisplay,
                          style: TextStyle(color: Colors.grey),
                        ),

                        SizedBox(height: 6.0,),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Padding _title(DetailData detail) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, top: 22.0, bottom: 5.0, right: 18.0),
      child: Text(
        detail.title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 28.0
        ),
      ),
    );
  }

  Container _map() {
    return Container(
      color: Colors.red,
      child: SizedBox(height: 180, width: double.infinity,),
    );
  }

  Row _iconTab({IconData iconData, String text}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(iconData, color: widget.color,),
        SizedBox(width: 6.0,),
        Text(text)
      ],
    );
  }
}