class InfoData {
  String label;
  dynamic value;

  InfoData.fromJson(Map map) {
    value = map['value'];
    label = map['label'];
  }
}