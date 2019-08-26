import 'package:google_maps_flutter/google_maps_flutter.dart';

class Geolocation {
  double latitude;
  double longitude;

  Geolocation.fromJson(Map map) {
    latitude = map['latitude'];
    longitude = map['longitude'];
  }

  CameraPosition get cameraPosition => CameraPosition(target: LatLng(latitude, longitude));
}