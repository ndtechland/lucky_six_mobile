// To parse this JSON data, do
//
//     final geWiningPercentModel = geWiningPercentModelFromJson(jsonString);

import 'dart:convert';

GeWiningPercentModel geWiningPercentModelFromJson(String str) =>
    GeWiningPercentModel.fromJson(json.decode(str));

String geWiningPercentModelToJson(GeWiningPercentModel data) =>
    json.encode(data.toJson());

class GeWiningPercentModel {
  int? status;
  String? message;
  Data? data;

  GeWiningPercentModel({
    this.status,
    this.message,
    this.data,
  });

  factory GeWiningPercentModel.fromJson(Map<String, dynamic> json) =>
      GeWiningPercentModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  int? id;
  int? amount;

  Data({
    this.id,
    this.amount,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
      };
}
