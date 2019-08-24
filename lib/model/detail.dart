import 'package:sasuke/model/address.dart';
import 'package:sasuke/model/info.dart';
import 'package:sasuke/model/user.dart';

class DetailData {
  String title;
  List<InfoData> listInfo = [];
  UserData user;
  AddressData address;
  int distance;

  String get distanceDisplay => ' a ${distance~/10000}km de você';

  DetailData.fromJson(Map map) {
    title = map['title'];
    final embedded = map['_embedded'];
    distance = map['distance'];

    embedded['info'] as List
    ..forEach((it) {
      listInfo.add(InfoData.fromJson(it));
    });

    user = UserData.fromMap(embedded['user']);
    address = AddressData.fromJson(embedded['address']);
  }
}