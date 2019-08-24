class InfoData {
  String label;
  List value;

  InfoData.fromJson(Map map) {
    value = map['value'];
    label = map['label'];
  }
}