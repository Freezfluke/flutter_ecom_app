import 'dart:ffi';

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
  var isValid = true;
  var stop = false;

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

  bool checkComfirmPassword(String value, String compare) {
    if (value.isNotEmpty && value != compare) {
      validationConfirmPassword =
          'กรุณากรอก Comfirm password ให้ตรงกับ Password';
      confirmPasswordFocusNode.requestFocus();
      return true;
    } else {
      validationConfirmPassword = '';
      return false;
    }
  }

  void focusFirstError(Object? value) {
    if (value is Map<String, dynamic>) {
      // Check if 'name' exists and is a String
      final fieldName = value['name'] as String?;
      final fieldValue = value['value'] as String;

      if (fieldValue.isEmpty) {
        isValid = true;
        if (stop == false) {
          switch (fieldName) {
            case 'email':
              emailFocusNode.requestFocus();
              validationEmail = 'กรุณากรอก อีเมล';
              stop = true;
              break;
            case 'name':
              nameFocusNode.requestFocus();
              validationName = 'กรุณากรอก ชื่อ';
              stop = true;
              break;
            case 'lastName':
              lastNameFocusNode.requestFocus();
              validationLastname = 'กรุณากรอก นามสกุล';
              stop = true;
              break;
            case 'phoneNumber':
              phoneNumberFocusNode.requestFocus();
              validationPhoneNumber = validatePhoneNumber(fieldValue);
              stop = true;
              break;
            case 'password':
              passwordFocusNode.requestFocus();
              validationPassword = 'กรุณากรอก รหัสผู้ใช้งาน';
              stop = true;
              break;
            case 'confirmPassword':
              confirmPasswordFocusNode.requestFocus();
              validationConfirmPassword = 'กรุณากรอก ยืนยันรหัสผู้ใช้งาน';
              stop = true;
              break;
            default:
              break;
          }
        }
      } else {
        stop = false;
        isValid = false;
        switch (fieldName) {
          case 'email':
            validationEmail = null;
            break;
          case 'name':
            validationName = null;
            break;
          case 'lastName':
            validationLastname = null;
            break;
          case 'phoneNumber':
            validationPhoneNumber = null;
            break;
          case 'password':
            validationPassword = null;
            break;
          case 'confirmPassword':
            validationConfirmPassword = null;
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
    bool checkComfirm = checkComfirmPassword(password, confirmPassword);
    print('$checkComfirm $isValid');
    if (isValid == false && checkComfirm == false) {
      print(
          '$email $name, $lastName,$phoneNumber, $password, $confirmPassword');
    }
  }
}
