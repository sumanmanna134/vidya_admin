//@dart=2.9
// To parse this JSON data, do
//
//     final allUserModel = allUserModelFromJson(jsonString);

import 'dart:convert';

AllUserModel allUserModelFromJson(String str) => AllUserModel.fromJson(json.decode(str));

String allUserModelToJson(AllUserModel data) => json.encode(data.toJson());

class AllUserModel {
  AllUserModel({
    this.success,
    this.user,
  });

  bool success;
  List<Users> user;

  factory AllUserModel.fromJson(Map<String, dynamic> json) => AllUserModel(
    success: json["success"] == null ? null : json["success"],
    user: json["user"] == null ? null : List<Users>.from(json["user"].map((x) => Users.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "user": user == null ? null : List<dynamic>.from(user.map((x) => x.toJson())),
  };
}

class Users {
  Users({
    this.s3SecretKey,
    this.address,
    this.role,
    this.isDisable,
    this.photoUrl,
    this.createdBy,
    this.id,
    this.name,
    this.email,
    this.ip,
    this.phone,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  dynamic s3SecretKey;
  dynamic address;
  String role;
  bool isDisable;
  dynamic photoUrl;
  String createdBy;
  String id;
  String name;
  String email;
  String ip;
  String phone;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    s3SecretKey: json["s3_secret_key"],
    address: json["address"],
    role: json["role"] == null ? null : json["role"],
    isDisable: json["isDisable"] == null ? null : json["isDisable"],
    photoUrl: json["photoUrl"],
    createdBy: json["createdBy"] == null ? null : json["createdBy"],
    id: json["_id"] == null ? null : json["_id"],
    name: json["name"] == null ? null : json["name"],
    email: json["email"] == null ? null : json["email"],
    ip: json["ip"] == null ? null : json["ip"],
    phone: json["phone"] == null ? null : json["phone"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"] == null ? null : json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "s3_secret_key": s3SecretKey,
    "address": address,
    "role": role == null ? null : role,
    "isDisable": isDisable == null ? null : isDisable,
    "photoUrl": photoUrl,
    "createdBy": createdBy == null ? null : createdBy,
    "_id": id == null ? null : id,
    "name": name == null ? null : name,
    "email": email == null ? null : email,
    "ip": ip == null ? null : ip,
    "phone": phone == null ? null : phone,
    "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
    "__v": v == null ? null : v,
  };
}
