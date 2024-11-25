import 'dart:io';

import 'package:first_app/src/api/environment.dart';
import 'package:first_app/src/models/response_api.dart';
import 'package:first_app/src/models/user.dart';
import 'package:first_app/src/utils/my_service.dart';
import 'package:first_app/src/utils/my_snackbar.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserProvider {
  static const _api = '${Environment.url}/auth';

  late BuildContext context;

  final MySnackbar snackBar = MySnackbar();

  Future<void> init(BuildContext context) async {
    this.context = context;
  }

  Future<ResponseApi> create(User user) async {
    try {
      Uri url = Uri.parse('$_api${MyService.signUp}');
      String bodyParams = json.encode(user);
      final res =
          await http.post(url, headers: Environment.headers, body: bodyParams);
      final result = jsonDecode(res.body);
      ResponseApi responseApi = ResponseApi.fromJson(result);
      return responseApi;
    } on SocketException catch (_) {
      throw Exception('ไม่สามารถเชื่อมต่อระบบได้กรุณาทำรายการใหม่อีกครั้ง');
    } catch (e) {
      throw Exception('$e');
    }
  }

  Future<ResponseApi> signIn(String email, String password) async {
    try {
      Uri url = Uri.parse('$_api${MyService.signIn}');

      String bodyParams = json.encode({"email": email, "password": password});

      final res = await http.post(
        url,
        headers: Environment.headers,
        body: bodyParams,
      );

      final result = jsonDecode(res.body);
      ResponseApi responseApi = ResponseApi.fromJson(result);
      return responseApi;
    } on SocketException catch (_) {
      throw Exception('ไม่สามารถเชื่อมต่อระบบได้กรุณาทำรายการใหม่อีกครั้ง');
    } catch (e) {
      throw Exception('$e');
    }
  }
}
