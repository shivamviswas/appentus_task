import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class HttpService {
  static final int statusCodeSuccess = 200;
  static HttpService _httpService = HttpService._();
  _HttpBaseClient _httpBaseClient;



  Future<http.Response> get(String url) async {
    final header = {
      HttpHeaders.contentTypeHeader:"application/json",
    };
    print("api => $url");
    return await _httpBaseClient.get(Uri.parse(url),headers: header);
  }

  Future<http.Response> post(String url,  Map<String, dynamic> args, String token) async {
    final headers = {
       HttpHeaders.contentTypeHeader: 'application/json',
     // HttpHeaders.authorizationHeader: "Bearer " + token,
    };


    return await _httpBaseClient.post(Uri.parse(url), body: jsonEncode(args), headers: headers);
  }


  HttpService._() : _httpBaseClient = _HttpBaseClient(http.Client());
  static HttpService getInstance() => _httpService;


}


class _HttpBaseClient extends http.BaseClient{
  http.Client _httpClient;
  _HttpBaseClient(this._httpClient);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    return _httpClient.send(request);
  }
}