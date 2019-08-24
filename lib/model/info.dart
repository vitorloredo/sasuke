class InfoData {
  String label;
  dynamic value;

  InfoData.fromJson(Map map) {
    value = map['value'].toString().replaceAll('[', '').replaceAll(']', '');
    label = map['label'];
  }
}