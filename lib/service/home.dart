import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class HomeService {
  static const _url = "http://testemobile.getninjas.com.br";

  Future get() async {
    return await http.get(_url)
      .then((response) async {
        var jsonResponse = convert.jsonDecode(response.body);
        return;
      });
  }
}