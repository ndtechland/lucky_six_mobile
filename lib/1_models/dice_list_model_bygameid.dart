// To parse this JSON data, do
//
//     final getDiceListModel = getDiceListModelFromJson(jsonString);

import 'dart:convert';

GetDiceListModel getDiceListModelFromJson(String str) =>
    GetDiceListModel.fromJson(json.decode(str));

String getDiceListModelToJson(GetDiceListModel data) =>
    json.encode(data.toJson());

class GetDiceListModel {
  int? status;
  String? message;
  List<DiceNumver>? diceNumvers;

  GetDiceListModel({
    this.status,
    this.message,
    this.diceNumvers,
  });

  factory GetDiceListModel.fromJson(Map<String, dynamic> json) =>
      GetDiceListModel(
        status: json["status"],
        message: json["message"],
        diceNumvers: json["diceNumvers"] == null
            ? []
            : List<DiceNumver>.from(
                json["diceNumvers"]!.map((x) => DiceNumver.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "diceNumvers": diceNumvers == null
            ? []
            : List<dynamic>.from(diceNumvers!.map((x) => x.toJson())),
      };
}

class DiceNumver {
  num? id;
  num? firstDiceNumber;
  num? secondDiceNumber;
  String? gameName;

  DiceNumver({
    this.id,
    this.firstDiceNumber,
    this.secondDiceNumber,
    this.gameName,
  });

  factory DiceNumver.fromJson(Map<String, dynamic> json) => DiceNumver(
        id: json["id"],
        firstDiceNumber: json["firstDiceNumber"],
        secondDiceNumber: json["secondDiceNumber"],
        gameName: json["gameName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstDiceNumber": firstDiceNumber,
        "secondDiceNumber": secondDiceNumber,
        "gameName": gameName,
      };
}
