import 'package:flutter/material.dart';
import 'package:sasuke/model/detail.dart';
import 'package:sasuke/model/link.dart';
import 'package:sasuke/service/detail.dart';
import 'package:sasuke/view/load.dart';

class DetailPage extends StatefulWidget {
  final MaterialColor color;
  final Link link;
  final String title;
  final Widget bottomNavigationBar;

  DetailPage({
    @required this.color,
    @required this.link,
    @required this.title,
    this.bottomNavigationBar
  });

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: widget.bottomNavigationBar,
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
          return SingleChildScrollView(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 12.0, right: 12.0, left: 12.0,  bottom: 18.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0)
                ),
              ),
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
                        Padding(
                          padding: const EdgeInsets.only(left: 28.0),
                          child: Text(
                            detail.distanceDisplay,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0
                            ),
                          ),
                        ),
                        SizedBox(height: 8.0,),
                        Divider(),
                        SizedBox(height: 8.0,),
                        ..._listInfo(detail),
                        SizedBox(height: 6.0,),
                      ],
                    ),
                  ),
                  _infoUser(detail),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0,horizontal: 20.0),
                    child: Center(
                      child: Text(
                        widget.color == Colors.blue ? "Aceite o pedido para destravar o contato!" : "Fale com o cliente o quanto antes",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0
                        ),
                      ),
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

  Widget _infoUser(DetailData detail) {
    return Container(
      padding: EdgeInsets.only(left: 12.0),
      height: 140,
      width: double.infinity,
      color: widget.color[300],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0, top: 16.0),
            child: Text(
              "Contato do Cliente",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18.0
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(Icons.lock_outline, color: Colors.white70,),
              SizedBox(width: 6.0,),
              Text(detail.user.getOnePhone, style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold,),)
            ],
          ),
          SizedBox(height: 16.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(Icons.lock_outline, color: Colors.white70,),
              SizedBox(width: 6.0,),
              Text(detail.user.email.toString(), style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold,),)
            ],
          )
        ],
      ),
    );
  }

  List<Widget> _listInfo(DetailData detail) {
    List<Widget> list = [];

    detail.listInfo.forEach((it) {
      list.add(
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _iconTab(
              iconData: Icons.info,
              text: it.label
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, bottom: 16.0, top: 4.0),
              child: Text(
                it.value.toString(),
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0
                ),
              ),
            ),
          ],
        )
      );
    });
    return list;
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
        Text(text, style: TextStyle(fontWeight: FontWeight.bold,),)
      ],
    );
  }
}