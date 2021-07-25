import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class GetAPIData {
  Future<List<dynamic>> getData(
      {@required String type,
      @required String pageNumber,
      @required String perPage,
      @required String author}) async {
    Uri url = Uri.parse(
        "https://cloudelib.midadedev.com/api/api-json/items/all/$type?page_number=$pageNumber&per_page=$perPage&author=$author&sort=title#");
     // print(url);
    http.Response res = await http.get(url);

    // print(res.body.toString());
    Map jsonDecoder = jsonDecode(res.body);

    List list = jsonDecoder["data"];
    // print(list);

    return list;
  }

  Future<List<dynamic>> getSearchData({
    @required String text,
  }) async {
    List list = [];
    Uri url = Uri.parse(
        "https://cloudelib.midadedev.com/api/api-json/search/1?word=$text");
    print(url);
    http.Response res = await http.get(url);

    // print(res.body.toString());
    Map jsonDecoder = jsonDecode(res.body);

    list = jsonDecoder["data"];
    // print(list);

    return list;
  }
}
