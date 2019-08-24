import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Link {
  String _href;

  Link(this._href);

  Future<Response> get response => http.get(_href);

  Link.fromJson(Map map) {
    _href = map['self']['href'];
  }
}