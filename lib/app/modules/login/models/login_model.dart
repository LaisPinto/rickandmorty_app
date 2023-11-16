import 'dart:convert';

class LoginModel {
  String? username;
  String? password;

  LoginModel({
    required this.username,
    required this.password,
  });

  factory LoginModel.fromMap(Map<String, dynamic> map) => LoginModel(
      username: map["username"],
      password: map["password"],
  );

  static dynamic body({LoginModel? loginModel}) {
    var payload = {
      "username": "${loginModel?.username}",
      "passaword": "${loginModel?.password}",
    };
    return jsonEncode(payload);
  }
}