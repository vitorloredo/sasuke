import 'package:sasuke/interface/home.dart';
import 'package:sasuke/model/link.dart';

class ViewData {
  Link link;
  List<HomeInterface> listHomeInter;

  ViewData.fromJson(Map map, List<HomeInterface> interface) {
    link = Link(map['_links']['self']['href']);
    listHomeInter = interface;
  }
}