import 'package:sasuke/model/link.dart';
import 'package:sasuke/model/offers.dart';
import 'dart:convert' as convert;

import 'package:sasuke/model/view.dart';

class OffersService {
  Future<ViewData> getList(Link link) async {
    return await link.response
      .then((response) async {
        final decode = convert.utf8.decode(response.bodyBytes);
        final jsonResponse = convert.jsonDecode(decode);
        List<OffersData> list = [];

        jsonResponse['offers'] as List
        ..forEach((offer) {
          list.add(OffersData.fromJson(offer));
        });

        return ViewData.fromJson(jsonResponse, list);
      });
  }
}