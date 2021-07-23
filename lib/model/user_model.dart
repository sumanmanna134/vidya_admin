//@dart=2.9
// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        this.success,
        this.token,
        this.user,
    });

    bool success;
    String token;
    UserClass user;

    factory User.fromJson(Map<String, dynamic> json) => User(
        success: json["success"] == null ? null : json["success"],
        token: json["token"] == null ? null : json["token"],
        user: json["user"] == null ? null : UserClass.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "token": token == null ? null : token,
        "user": user == null ? null : user.toJson(),
    };
}

class UserClass {
    UserClass({
        this.s3SecretKey,
        this.address,
        this.role,
        this.isDisable,
        this.photoUrl,
        this.createdBy,
        this.id,
        this.name,
        this.email,
        this.password,
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
    dynamic createdBy;
    String id;
    String name;
    String email;
    String password;
    String ip;
    String phone;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
        s3SecretKey: json["s3_secret_key"],
        address: json["address"],
        role: json["role"] == null ? null : json["role"],
        isDisable: json["isDisable"] == null ? null : json["isDisable"],
        photoUrl: json["photoUrl"],
        createdBy: json["createdBy"],
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        password: json["password"] == null ? null : json["password"],
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
        "createdBy": createdBy,
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "password": password == null ? null : password,
        "ip": ip == null ? null : ip,
        "phone": phone == null ? null : phone,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
    };
}
