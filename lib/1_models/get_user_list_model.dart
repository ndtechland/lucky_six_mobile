// To parse this JSON data, do
//
//     final userListModel = userListModelFromJson(jsonString);

import 'dart:convert';

UserListModel userListModelFromJson(String str) =>
    UserListModel.fromJson(json.decode(str));

String userListModelToJson(UserListModel data) => json.encode(data.toJson());

class UserListModel {
  bool? succeeded;
  int? statusCode;
  dynamic status;
  String? message;
  dynamic error;
  List<Datum>? data;

  UserListModel({
    this.succeeded,
    this.statusCode,
    this.status,
    this.message,
    this.error,
    this.data,
  });

  factory UserListModel.fromJson(Map<String, dynamic> json) => UserListModel(
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
  String? userId;
  String? fullName;
  String? profilePicture;
  String? roomId;
  String? uniqueGameId;

  Datum({
    this.userId,
    this.fullName,
    this.profilePicture,
    this.roomId,
    this.uniqueGameId,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        userId: json["userId"],
        fullName: json["fullName"],
        profilePicture: json["profilePicture"],
        roomId: json["roomId"],
        uniqueGameId: json["uniqueGameID"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "fullName": fullName,
        "profilePicture": profilePicture,
        "roomId": roomId,
        "uniqueGameID": uniqueGameId,
      };
}
