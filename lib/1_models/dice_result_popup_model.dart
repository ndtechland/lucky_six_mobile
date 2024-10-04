// To parse this JSON data, do
//
//     final diceResultModel = diceResultModelFromJson(jsonString);

import 'dart:convert';

DiceResultModel diceResultModelFromJson(String str) =>
    DiceResultModel.fromJson(json.decode(str));

String diceResultModelToJson(DiceResultModel data) =>
    json.encode(data.toJson());

class DiceResultModel {
  bool? succeeded;
  num? statusCode;
  dynamic status;
  String? message;
  dynamic error;
  Data? data;

  DiceResultModel({
    this.succeeded,
    this.statusCode,
    this.status,
    this.message,
    this.error,
    this.data,
  });

  factory DiceResultModel.fromJson(Map<String, dynamic> json) =>
      DiceResultModel(
        succeeded: json["succeeded"],
        statusCode: json["statusCode"],
        status: json["status"],
        message: json["message"],
        error: json["error"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "succeeded": succeeded,
        "statusCode": statusCode,
        "status": status,
        "message": message,
        "error": error,
        "data": data?.toJson(),
      };
}

class Data {
  num? die1;
  num? die2;

  Data({
    this.die1,
    this.die2,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        die1: json["Die1"],
        die2: json["Die2"],
      );

  Map<String, dynamic> toJson() => {
        "Die1": die1,
        "Die2": die2,
      };
}
