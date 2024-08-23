// To parse this JSON data, do
//
//     final gamePriceListModel = gamePriceListModelFromJson(jsonString);

import 'dart:convert';

GamePriceListModel gamePriceListModelFromJson(String str) =>
    GamePriceListModel.fromJson(json.decode(str));

String gamePriceListModelToJson(GamePriceListModel data) =>
    json.encode(data.toJson());

class GamePriceListModel {
  int? status;
  String? message;
  List<GetGameAmount>? getGameAmount;

  GamePriceListModel({
    this.status,
    this.message,
    this.getGameAmount,
  });

  factory GamePriceListModel.fromJson(Map<String, dynamic> json) =>
      GamePriceListModel(
        status: json["status"],
        message: json["message"],
        getGameAmount: json["getGameAmount"] == null
            ? []
            : List<GetGameAmount>.from(
                json["getGameAmount"]!.map((x) => GetGameAmount.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "getGameAmount": getGameAmount == null
            ? []
            : List<dynamic>.from(getGameAmount!.map((x) => x.toJson())),
      };
}

class GetGameAmount {
  num? id;
  String? gameName;
  num? gameAmt;
  num? winingAmt;
  DateTime? createDate;
  bool? isActive;

  GetGameAmount({
    this.id,
    this.gameName,
    this.gameAmt,
    this.winingAmt,
    this.createDate,
    this.isActive,
  });

  factory GetGameAmount.fromJson(Map<String, dynamic> json) => GetGameAmount(
        id: json["id"],
        gameName: json["gameName"],
        gameAmt: json["gameAmt"],
        winingAmt: json["winingAmt"],
        createDate: json["createDate"] == null
            ? null
            : DateTime.parse(json["createDate"]),
        isActive: json["isActive"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "gameName": gameName,
        "gameAmt": gameAmt,
        "winingAmt": winingAmt,
        "createDate": createDate?.toIso8601String(),
        "isActive": isActive,
      };
}
