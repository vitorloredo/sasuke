class UserData {
  String user;
  String email;
  List phones;

  UserData.fromMap(Map map) {
    user = map['name'];
    email = map['email'];
    if(map['_embedded'] != null) {
      phones = map['_embedded']['phones'];
    }
  }
}