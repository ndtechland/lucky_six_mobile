// To parse this JSON data, do
//
//     final winLossListModel = winLossListModelFromJson(jsonString);

import 'dart:convert';

WinLossListModel winLossListModelFromJson(String str) =>
    WinLossListModel.fromJson(json.decode(str));

String winLossListModelToJson(WinLossListModel data) =>
    json.encode(data.toJson());

class WinLossListModel {
  Response? response;
  int? totalErning;

  WinLossListModel({
    this.response,
    this.totalErning,
  });

  factory WinLossListModel.fromJson(Map<String, dynamic> json) =>
      WinLossListModel(
        response: json["response"] == null
            ? null
            : Response.fromJson(json["response"]),
        totalErning: json["totalErning"],
      );

  Map<String, dynamic> toJson() => {
        "response": response?.toJson(),
        "totalErning": totalErning,
      };
}

class Response {
  bool? succeeded;
  int? statusCode;
  dynamic status;
  String? message;
  dynamic error;
  List<Datum>? data;

  Response({
    this.succeeded,
    this.statusCode,
    this.status,
    this.message,
    this.error,
    this.data,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
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
  num? id;
  String? userId;
  num? gameId;
  num? amount;
  DateTime? createDate;
  String? gameStatus;

  Datum({
    this.id,
    this.userId,
    this.gameId,
    this.amount,
    this.createDate,
    this.gameStatus,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["userId"],
        gameId: json["gameId"],
        amount: json["amount"],
        createDate: json["createDate"] == null
            ? null
            : DateTime.parse(json["createDate"]),
        gameStatus: json["gameStatus"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "gameId": gameId,
        "amount": amount,
        "createDate": createDate?.toIso8601String(),
        "gameStatus": gameStatus,
      };
}
