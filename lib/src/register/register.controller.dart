import 'package:flutter/material.dart';

class RegisterController {
  late BuildContext context;
  void init(BuildContext context) {
    this.context = context;
  }

  void goBack() {
    Navigator.pop(context);
  }
}
