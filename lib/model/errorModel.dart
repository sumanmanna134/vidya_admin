
//@dart=2.9
// To parse this JSON data, do
//
//     final errorModel = errorModelFromJson(jsonString);

import 'dart:convert';

ErrorModel errorModelFromJson(String str) => ErrorModel.fromJson(json.decode(str));

String errorModelToJson(ErrorModel data) => json.encode(data.toJson());

class ErrorModel {
  ErrorModel({
    this.success,
    this.message,
  });

  bool success;
  String message;

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
    success: json["success"] == null ? null : json["success"],
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "message": message == null ? null : message,
  };
}