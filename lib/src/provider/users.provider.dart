import 'package:first_app/src/api/environment.dart';
import 'package:first_app/src/models/response_api.dart';
import 'package:first_app/src/models/user.dart';
import 'package:first_app/src/utils/my_snackbar.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserProvider {
  final String _url = '${Environment.apiEcom}${Environment.apiVersion}';
  final String _api = '/auth/sign-up';

  late BuildContext context;

  final MySnackbar snackBar = MySnackbar();

  Future<void> init(BuildContext context) async {
    this.context = context;
  }

  Future<ResponseApi> create(User user) async {
    try {
      Uri url = Uri.parse('http://$_url$_api');
      String bodyParams = json.encode(user);
      Map<String, String> headers = {'Content-type': 'application/json'};
      final res = await http.post(url, headers: headers, body: bodyParams);
      final result = jsonDecode(res.body);
      ResponseApi responseApi = ResponseApi.fromJson(result);
      return responseApi;
    } catch (e) {
      throw Exception('Error during API request: $e');
    }
  }
}
