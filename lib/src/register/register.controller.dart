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
  String? validationEmail;
  String? validationName;
  String? validationLastname;
  String? validationPassword;
  String? validationConfirmPassword;
  final FocusNode phoneNumberFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode lastNameFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();

  void init(BuildContext context) {
    this.context = context;
  }

  void goBack() {
    Navigator.pop(context);
  }

  String? validatePhoneNumber(String value) {
    if (value.isEmpty) {
      return 'กรุณากรอกเบอร์โทรศัพท์';
    } else if (!RegExp(r'^\+?[0-9]{10}$').hasMatch(value)) {
      return 'กรุณากรอกเบอร์โทรศัพท์ให้ถูกต้อง';
    }
    return null; // Valid input
  }

  void focusFirstError(Object? value) {
    if (value is Map<String, dynamic>) {
      // Check if 'name' exists and is a String
      final fieldName = value['name'] as String?;
      final fieldValue = value['value'] as String;

      // Only proceed if 'name' is not null
      if (fieldValue.isEmpty) {
        switch (fieldName) {
          case 'email':
            emailFocusNode.requestFocus();
            validationEmail = 'กรุณากรอก อีเมล';
            break;
          case 'name':
            nameFocusNode.requestFocus();
            validationName = 'กรุณากรอก ชื่อ';
            break;
          case 'lastName':
            nameFocusNode.requestFocus();
            validationLastname = 'กรุณากรอก นามสกุล';
            break;
          case 'phoneNumber':
            nameFocusNode.requestFocus();
            validationPhoneNumber = validatePhoneNumber(fieldValue);
            break;
          case 'password':
            nameFocusNode.requestFocus();
            validationPassword = 'กรุณากรอก รหัสผู้ใช้งาน';
            break;
          case 'confirmPassword':
            nameFocusNode.requestFocus();
            validationConfirmPassword = 'กรุณากรอก รหัสผู้ใช้งาน';
            break;
          default:
            break;
        }
      } else {
        switch (fieldName) {
          case 'email':
            validationEmail = '';
            break;
          case 'name':
            validationName = '';
            break;
          case 'lastName':
            validationLastname = '';
            break;
          case 'phoneNumber':
            validationPhoneNumber = '';
            break;
          case 'password':
            validationPassword = '';
            break;
          case 'confirmPassword':
            validationConfirmPassword = '';
            break;
          default:
            break;
        }
      }
    }
  }

  void register() {
    String email = emailController.text.trim();
    String name = nameController.text.trim();
    String lastName = lastNameController.text.trim();
    String phoneNumber = phoneNumberController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();
    // Create a map to hold all the fields and their corresponding names
    Map<String, String> fields = {
      'email': email,
      'name': name,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'password': password,
      'confirmPassword': confirmPassword
    };

    for (var entry in fields.entries) {
      String value = entry.value;
      String fieldName = entry.key;

      focusFirstError({'name': fieldName, 'value': value});
    }
  }
}
