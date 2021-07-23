//@dart=2.9
// To parse this JSON data, do
//
//     final teacher = teacherFromJson(jsonString);

import 'dart:convert';

Teacher teacherFromJson(String str) => Teacher.fromJson(json.decode(str));

String teacherToJson(Teacher data) => json.encode(data.toJson());

class Teacher {

  Teacher({
    this.name,
    this.email,
    this.password,
    this.phone,
    this.role,
    this.subject,
    this.primaryAddress,
    this.presentAddress,
    this.pincode,
    this.state,
    this.photoUrl,


  });

  String name;
  String email;
  String password;
  String phone;
  String role;
  List<String> subject;
  String primaryAddress;
  String presentAddress;
  String pincode;
  String state;
  String photoUrl;

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
    name: json["name"] == null ? null : json["name"],
    email: json["email"] == null ? null : json["email"],
    password: json["password"] == null ? null : json["password"],
    phone: json["phone"] == null ? null : json["phone"],
    role: json["role"] == null ? null : json["role"],
    subject: json["subject"] == null ? [] : List<String>.from(json["subject"].map((x) => x)),
    primaryAddress: json["primary_address"] == null ? null : json["primary_address"],
    presentAddress: json["present_address"] == null ? null : json["present_address"],
    pincode: json["pincode"] == null ? null : json["pincode"],
    state: json["state"] == null ? null : json["state"],
    photoUrl: json["photo_url"] == null ? null : json["photo_url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "email": email == null ? null : email,
    "password": password == null ? null : password,
    "phone": phone == null ? null : phone,
    "role": role == null ? null : role,
    "subject": subject == null ? [] : List<dynamic>.from(subject.map((x) => x)),
    "primary_address": primaryAddress == null ? null : primaryAddress,
    "present_address": presentAddress == null ? null : presentAddress,
    "pincode": pincode == null ? null : pincode,
    "state": state == null ? null : state,
    "photo_url": photoUrl == null ? null : photoUrl,
  };


}
