import 'package:first_app/src/utils/my_route.dart';
import 'package:flutter/material.dart';

class LoginController {
  late BuildContext context;

  void init(BuildContext context) {
    this.context = context;
  }

  void goToRegisterPage() {
    Navigator.pushNamed(context, MyRoute.register);
  }
}
