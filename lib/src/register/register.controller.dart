import 'package:flutter/material.dart';

class RegisterController {
  late BuildContext context;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  void init(BuildContext context) {
    this.context = context;
  }

  void goBack() {
    Navigator.pop(context);
  }

  void register() {
    String email = emailController.text.trim();
    String name = nameController.text.trim();
    String lastName = lastNameController.text.trim();
    String phoneNumber = phoneNumberController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();
    print(
        'data, $email $name $lastName $phoneNumber $password $confirmPassword');
  }
}
