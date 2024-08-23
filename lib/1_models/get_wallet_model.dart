// To parse this JSON data, do
//
//     final getWallettModel = getWallettModelFromJson(jsonString);

import 'dart:convert';

GetWallettModel getWallettModelFromJson(String str) =>
    GetWallettModel.fromJson(json.decode(str));

String getWallettModelToJson(GetWallettModel data) =>
    json.encode(data.toJson());

class GetWallettModel {
  int? status;
  String? message;
  GetWallet? getWallet;

  GetWallettModel({
    this.status,
    this.message,
    this.getWallet,
  });

  factory GetWallettModel.fromJson(Map<String, dynamic> json) =>
      GetWallettModel(
        status: json["status"],
        message: json["message"],
        getWallet: json["getWallet"] == null
            ? null
            : GetWallet.fromJson(json["getWallet"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "getWallet": getWallet?.toJson(),
      };
}

class GetWallet {
  num? id;
  String? userId;
  num? walletAmount;
  DateTime? createdAt;
  DateTime? updatedAt;

  GetWallet({
    this.id,
    this.userId,
    this.walletAmount,
    this.createdAt,
    this.updatedAt,
  });

  factory GetWallet.fromJson(Map<String, dynamic> json) => GetWallet(
        id: json["id"],
        userId: json["userId"],
        walletAmount: json["walletAmount"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "walletAmount": walletAmount,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
