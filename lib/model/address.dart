import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sasuke/model/geolocation.dart';

class AddressData {
  String city;
  String neighborhood;
  Geolocation geolocation;

  AddressData.fromJson(Map map) {
    city = map["city"];
    neighborhood = map["neighborhood"];
    if(map['geolocation'] != null)
      geolocation = Geolocation.fromJson(map['geolocation']);
  }

  CameraPosition get cameraPosition => geolocation.cameraPosition;

  String get getDisplay => "$neighborhood - $city";
}