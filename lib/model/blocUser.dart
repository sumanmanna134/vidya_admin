// To parse this JSON data, do
//
//     final blockUser = blockUserFromJson(jsonString);
//@dart=2.9
import 'dart:convert';

BlockUser blockUserFromJson(String str) => BlockUser.fromJson(json.decode(str));

String blockUserToJson(BlockUser data) => json.encode(data.toJson());

class BlockUser {
  BlockUser({
    this.email,
    this.block,
  });

  String email;
  String block;

  factory BlockUser.fromJson(Map<String, dynamic> json) => BlockUser(
    email: json["email"] == null ? null : json["email"],
    block: json["block"] == null ? null : json["block"],
  );

  Map<String, dynamic> toJson() => {
    "email": email == null ? null : email,
    "block": block == null ? null : block,
  };
}
