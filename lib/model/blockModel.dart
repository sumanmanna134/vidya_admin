
//@dart=2.9
// To parse this JSON data, do
//
//     final errorModel = errorModelFromJson(jsonString);

import 'dart:convert';


class BlockModel {
  BlockModel({
    this.success,
    this.message,
  });

  bool success;
  String message;

  factory BlockModel.fromJson(Map<String, dynamic> json) => BlockModel(
    success: json["success"] == null ? null : json["success"],
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "message": message == null ? null : message,
  };
}