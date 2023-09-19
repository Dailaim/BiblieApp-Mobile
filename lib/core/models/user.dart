import 'dart:convert';

class User {
  final String? email;
  final String? user;
  final String? password;
  final String? token;

  User({
    this.email,
    this.user,
    this.token,
    this.password,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        email: json["email"],
        user: json["user"],
        token: json["token"],
        password: json["password"],
      );

  Map<String, dynamic> toMap() => {
        "email": email,
        "user": user,
        "token": token,
        "password": password,
      };

  User copyWith({
    String? email,
    String? user,
    String? token,
    String? password,
  }) {
    return User(
      email: email ?? this.email,
      user: user ?? this.user,
      token: token ?? this.token,
      password: password ?? this.password,
    );
  }
}
