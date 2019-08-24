class UserData {
  String user;

  UserData.fromMap(Map map) {
    user = map['name'];
  }
}