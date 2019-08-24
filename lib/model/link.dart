import 'package:http/http.dart' as http;

class Link {
  final String _href;

  Link(this._href);

  get response => http.get(_href);
}