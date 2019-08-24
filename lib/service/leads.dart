import 'package:sasuke/model/leads.dart';
import 'package:sasuke/model/link.dart';
import 'dart:convert' as convert;

import 'package:sasuke/model/view.dart';

class LeadsService {
  Future<ViewData> getList(Link link) async {
    return await link.response
      .then((response) async {
        final decode = convert.utf8.decode(response.bodyBytes);
        final jsonResponse = convert.jsonDecode(decode);
        List<LeadsData> list = [];

        jsonResponse['leads'] as List
        ..forEach((leads) {
          list.add(LeadsData.fromJson(leads));
        });

        return ViewData.fromJson(jsonResponse, list);
      });
  }
}