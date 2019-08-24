import 'package:flutter/material.dart';
import 'package:sasuke/service/home.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.format_align_justify),
        centerTitle: false,
        title: Text("Pedidos"),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              icon: _iconTab(
                iconData: Icons.shopping_cart,
                text: "DISPONÍVEIS"
              )
            ),
            Tab(
              icon: _iconTab(
                iconData: Icons.check,
                text: "ACEITOS"
              )
            ),
          ],
        )
      ),
      body: TabBarView(
          children: [
            Text("This is chat Tab View"),
            Text("This is notification Tab View"),
          ],
      controller: _tabController,
      ),
    );
  }

  Row _iconTab({IconData iconData, String text}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(iconData),
        SizedBox(width: 6.0,),
        Text(text)
      ],
    );
  }
}