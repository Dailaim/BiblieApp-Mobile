import 'dart:convert';

/* import 'package:flutter_tutorial/core/models/user_data.dart'; */

class UserResponse {
  final String? email;
  final String? username;

  UserResponse({
    this.email,
    this.username,
  });

  factory UserResponse.fromJson(String str) =>
      UserResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserResponse.fromMap(Map<String, dynamic> json) => UserResponse(
        email: json["email"],
        username: json["username"],
      );

  Map<String, dynamic> toMap() => {
        "email": email,
        "username": username,
      };

/*   UserData toUserData() => UserData(
        avatar: avatar,
        email: email,
        emailVisibility: emailVisibility,
        name: name,
        username: username,
        verified: verified,
        description: description,
      ); */
}
