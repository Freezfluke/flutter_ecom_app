import 'package:flutter/material.dart';

class RegisterController {
  late BuildContext context;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String? validationPhoneNumber;

  void init(BuildContext context) {
    this.context = context;
  }

  void goBack() {
    Navigator.pop(context);
  }

  String? ValidatePhoneNumber(String value) {
    if (value.isEmpty) {
      return 'กรุณากรอกเบอร์โทรศัพท์';
    } else if (!RegExp(r'^\+?[0-9]{10}$').hasMatch(value)) {
      return 'กรุณากรอกเบอร์โทรศัพท์ให้ถูกต้อง';
    }
    return null; // Valid input
  }

  void register() {
    String email = emailController.text.trim();
    String name = nameController.text.trim();
    String lastName = lastNameController.text.trim();
    String phoneNumber = phoneNumberController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    validationPhoneNumber = ValidatePhoneNumber(phoneNumber);
  }
}
