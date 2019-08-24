import 'package:flutter/material.dart';
import 'package:sasuke/service/home.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();

    // HomeService().get().then((onValue) {
    //   onValue;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.format_align_justify),
        centerTitle: false,
        title: Text("Pedidos"),
      ),
    );
  }
}