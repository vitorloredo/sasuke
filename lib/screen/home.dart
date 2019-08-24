import 'package:flutter/material.dart';
import 'package:sasuke/model/home.dart';
import 'package:sasuke/model/offers.dart';
import 'package:sasuke/model/view.dart';
import 'package:sasuke/service/home.dart';
import 'package:sasuke/service/offers.dart';
import 'package:sasuke/view/load.dart';
import 'package:sasuke/view/home.dart';

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
      backgroundColor: Theme.of(context).primaryColor,
      body: FutureBuilder<HomeData>(
        future: HomeService().get(),
        builder: (BuildContext bc, homeSnap) {
          if(homeSnap.connectionState == ConnectionState.waiting) return Load();
          if(!homeSnap.hasData) return Center(child: Text("Ops... Algum erro aconteceu"),);
          return _tabView(homeSnap.data);
        },
      ),
    );
  }

  TabBarView _tabView(HomeData homeData) {
    return TabBarView(
      children: [
        FutureBuilder(
          future: OffersService().getListOffers(homeData.offers),
          builder: (BuildContext bc, AsyncSnapshot<ViewData> viewData) {
            if(viewData.connectionState == ConnectionState.waiting) return Load();
            if(!viewData.hasData) return Center(child: Text("Ops... Algum erro aconteceu"),);
            return HomeView(viewData: viewData.data);
          },
        ),
        Icon(Icons.shopping_cart),
      ],
      controller: _tabController,
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