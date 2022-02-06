import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class Api {
  static sendMessageGroup(String name, String caption, String file) async {
    final url =
        Uri.parse("https://bootcell-api.herokuapp.com/send-group-message");
    final hearders = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    };
    var body = jsonEncode(
        <String, String>{'name': name, 'caption': caption, 'file': file});
    print(body.toString());
    final response = await http.post(url, headers: hearders, body: body);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      if (response.statusCode == 503) {
        print(response.body.toString());
        return response.body.toString();
      }
    }
  }
}
