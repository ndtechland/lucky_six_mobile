// To parse this JSON data, do
//
//     final diceSelection = diceSelectionFromJson(jsonString);

import 'dart:convert';

DiceSelection diceSelectionFromJson(String str) =>
    DiceSelection.fromJson(json.decode(str));

String diceSelectionToJson(DiceSelection data) => json.encode(data.toJson());

class DiceSelection {
  bool? succeeded;
  int? statusCode;
  dynamic status;
  String? message;
  dynamic error;
  List<Datum>? data;

  DiceSelection({
    this.succeeded,
    this.statusCode,
    this.status,
    this.message,
    this.error,
    this.data,
  });

  factory DiceSelection.fromJson(Map<String, dynamic> json) => DiceSelection(
        succeeded: json["succeeded"],
        statusCode: json["statusCode"],
        status: json["status"],
        message: json["message"],
        error: json["error"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "succeeded": succeeded,
        "statusCode": statusCode,
        "status": status,
        "message": message,
        "error": error,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? id;
  String? name;
  String? description;
  DateTime? createDate;

  Datum({
    this.id,
    this.name,
    this.description,
    this.createDate,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        createDate: json["createDate"] == null
            ? null
            : DateTime.parse(json["createDate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "createDate": createDate?.toIso8601String(),
      };
}
