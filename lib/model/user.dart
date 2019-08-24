class UserData {
  String user;
  String email;
  String phones;

  UserData.fromMap(Map map) {
    user = map['name'];
    email = map['email'];
    if(map['_embedded'] != null)
      phones = map['_embedded']['phones']['number']  ?? null;
  }
}