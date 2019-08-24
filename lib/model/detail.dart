import 'package:sasuke/model/address.dart';
import 'package:sasuke/model/info.dart';
import 'package:sasuke/model/user.dart';

class DetailData {
  String title;
  List<InfoData> listInfo = [];
  UserData user;
  AddressData address;

  DetailData.fromJson(Map map) {
    title = map['title'];
    final embedded = map['_embedded'];

    embedded['info'] as List
    ..forEach((it) {
      listInfo.add(InfoData.fromJson(it));
    });

    user = UserData.fromMap(embedded['user']);
    address = AddressData.fromJson(embedded['address']);
  }
}