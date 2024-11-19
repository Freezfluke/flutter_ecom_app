import 'package:first_app/src/models/response_api.dart';
import 'package:first_app/src/provider/users.provider.dart';
import 'package:first_app/src/utils/my_route.dart';
import 'package:first_app/src/utils/my_snackbar.dart';
import 'package:flutter/material.dart';

class LoginController {
  UserProvider userProvider = UserProvider();
  final MySnackbar _snackbar = MySnackbar();
  late BuildContext context;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isValid = true;

  void init(BuildContext context) async {
    this.context = context;
    await userProvider.init(context);
  }

  void goToRegisterPage() {
    Navigator.pushNamed(context, MyRoute.register);
  }

  void validationLogin() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    if (email.isEmpty || password.isEmpty) {
      isValid = true;
    } else {
      isValid = false;
    }
  }

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    try {
      ResponseApi responseApi = await userProvider.singIn(email, password);
      if (!context.mounted) return;
      _snackbar.showSnackBar(context, responseApi.message,
          responseApi.success ? Colors.green : Colors.red);
    } catch (e) {
      _snackbar.showSnackBar(context, '$e', Colors.red);
    }
  }
}
