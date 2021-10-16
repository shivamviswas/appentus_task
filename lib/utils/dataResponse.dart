import 'dart:convert';

import 'package:appentus_task/utils/api.dart';

import 'service_http.dart';

class DataResponse {
  static HttpService _httpService = HttpService.getInstance();

  static Future<dynamic> getImages({int page:1}) async {
    var data;
    var response = await _httpService.get(
      Api.getImages+"?page=${page}&limit=4",
    );
    if (response.statusCode == 200) {
      data = json.decode(response.body);
    }else{
      data = "error";
    }

    return data;
  }
}
