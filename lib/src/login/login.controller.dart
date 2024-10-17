import 'package:first_app/src/utils/my_route.dart';
import 'package:flutter/material.dart';

class LoginController {
  late BuildContext context;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void init(BuildContext context) {
    this.context = context;
  }

  void goToRegisterPage() {
    Navigator.pushNamed(context, MyRoute.register);
  }

  void login() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
  }
}
