import 'dart:convert';

User userFormJson(String str) => User.fromJson(json.decode(str));

String userTojson(User data) => json.encode(data.toJson());

class User {
  String email;
  String password;
  String lastName;
  String phoneNumber;
  String name;

  User({
    required this.email,
    required this.password,
    required this.name,
    required this.lastName,
    required this.phoneNumber,
  });
  factory User.fromJson(Map<String, dynamic> json) => User(
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      lastName: json['lastName'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      name: json['name'] ?? '');

  Map<String, dynamic> toJson() => {
        "email": email,
        "name": name,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "password": password
      };
}
