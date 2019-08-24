import 'package:sasuke/model/link.dart';

class HomeData {
  Link offers;
  Link leads;

  HomeData({this.leads, this.offers});

  HomeData.fromJson(Map map) {
    final links = map['_links'];
    offers = Link(links['leads']["href"]);
    leads = Link(links['offers']["href"]);
  }
}