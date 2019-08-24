import 'package:sasuke/interface/home.dart';
import 'package:sasuke/model/link.dart';

class ViewData {
  Link link;
  List<HomeInterface> homeInterface;

  ViewData.fromJson(Map map, List<HomeInterface> interface) {
    link = Link(map['_links']['self']['href']);
    homeInterface = interface;
  }
}