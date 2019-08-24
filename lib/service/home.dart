import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:sasuke/model/home.dart';

class HomeService {
  static const _url = "http://testemobile.getninjas.com.br";

  Future<HomeData> get() async {
    return await http.get(_url)
      .then((response) async {
        final jsonResponse = convert.jsonDecode(response.body);
        return HomeData.fromJson(jsonResponse);
      });
  }
}