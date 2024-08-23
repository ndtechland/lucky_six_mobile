// To parse this JSON data, do
//
//     final gameTypeModel = gameTypeModelFromJson(jsonString);

import 'dart:convert';

GameTypeModel gameTypeModelFromJson(String str) =>
    GameTypeModel.fromJson(json.decode(str));

String gameTypeModelToJson(GameTypeModel data) => json.encode(data.toJson());

class GameTypeModel {
  int? status;
  String? message;
  List<GetGame>? getGames;

  GameTypeModel({
    this.status,
    this.message,
    this.getGames,
  });

  factory GameTypeModel.fromJson(Map<String, dynamic> json) => GameTypeModel(
        status: json["status"],
        message: json["message"],
        getGames: json["getGames"] == null
            ? []
            : List<GetGame>.from(
                json["getGames"]!.map((x) => GetGame.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "getGames": getGames == null
            ? []
            : List<dynamic>.from(getGames!.map((x) => x.toJson())),
      };
}

class GetGame {
  num? id;
  String? gameName;
  String? description;
  num? numOfDice;
  DateTime? createdDate;
  bool? isActive;

  GetGame({
    this.id,
    this.gameName,
    this.description,
    this.numOfDice,
    this.createdDate,
    this.isActive,
  });

  factory GetGame.fromJson(Map<String, dynamic> json) => GetGame(
        id: json["id"],
        gameName: json["gameName"],
        description: json["description"],
        numOfDice: json["numOfDice"],
        createdDate: json["createdDate"] == null
            ? null
            : DateTime.parse(json["createdDate"]),
        isActive: json["isActive"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "gameName": gameName,
        "description": description,
        "numOfDice": numOfDice,
        "createdDate": createdDate?.toIso8601String(),
        "isActive": isActive,
      };
}
