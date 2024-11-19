import 'package:flutter/material.dart';

class MySnackbar {
  late BuildContext context;
  // Using context in some method

  Future<void> init(BuildContext context) async {
    this.context = context;
  }

  void showSnackBar(
      BuildContext context, String message, Color changeBackground) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        backgroundColor: changeBackground,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
