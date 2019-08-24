class AddressData {
  String city;
  String neighborhood;

  AddressData.fromJson(Map map) {
    city = map["city"];
    neighborhood = map["neighborhood"];
  }

  String get getDisplay => "$neighborhood - $city";
}