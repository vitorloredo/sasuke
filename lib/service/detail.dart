
import 'package:sasuke/model/detail.dart';
import 'package:sasuke/model/link.dart';
import 'dart:convert' as convert;

class DetailService {
  get(Link link) async {
    return await link.response
    .then((response) async {
      final decode = convert.utf8.decode(response.bodyBytes);
      final jsonResponse = convert.jsonDecode(decode);
      DetailData.fromJson(jsonResponse);
    });
  }
}