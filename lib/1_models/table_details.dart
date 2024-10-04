// To parse this JSON data, do
//
//     final tableDetailsModel = tableDetailsModelFromJson(jsonString);

import 'dart:convert';

TableDetailsModel tableDetailsModelFromJson(String str) =>
    TableDetailsModel.fromJson(json.decode(str));

String tableDetailsModelToJson(TableDetailsModel data) =>
    json.encode(data.toJson());

class TableDetailsModel {
  bool? succeeded;
  int? statusCode;
  dynamic status;
  String? message;
  dynamic error;
  Data? data;

  TableDetailsModel({
    this.succeeded,
    this.statusCode,
    this.status,
    this.message,
    this.error,
    this.data,
  });

  factory TableDetailsModel.fromJson(Map<String, dynamic> json) =>
      TableDetailsModel(
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
  String? userId0;
  String? fullName0;
  String? profilePicture0;
  String? firstDiceNumberId0;
  String? secondDiceNumberId0;
  String? roomId0;
  String? uniqueGameId0;
  String? gameAmt0;
  String? winingAmt0;
  String? totalAmount0;
  dynamic fullName1;
  dynamic profilePicture1;
  dynamic fullName2;
  dynamic profilePicture2;
  dynamic fullName3;
  dynamic profilePicture3;
  dynamic fullName4;
  dynamic profilePicture4;
  dynamic fullName5;
  dynamic profilePicture5;
  dynamic fullName6;
  dynamic profilePicture6;

  Data({
    this.userId0,
    this.fullName0,
    this.profilePicture0,
    this.firstDiceNumberId0,
    this.secondDiceNumberId0,
    this.roomId0,
    this.uniqueGameId0,
    this.gameAmt0,
    this.winingAmt0,
    this.totalAmount0,
    this.fullName1,
    this.profilePicture1,
    this.fullName2,
    this.profilePicture2,
    this.fullName3,
    this.profilePicture3,
    this.fullName4,
    this.profilePicture4,
    this.fullName5,
    this.profilePicture5,
    this.fullName6,
    this.profilePicture6,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId0: json["UserId_0 "],
        fullName0: json["FullName_0 "],
        profilePicture0: json["ProfilePicture_0"],
        firstDiceNumberId0: json["FirstDiceNumberId_0"],
        secondDiceNumberId0: json["SecondDiceNumberId_0"],
        roomId0: json["RoomId_0"],
        uniqueGameId0: json["UniqueGameID_0"],
        gameAmt0: json["GameAmt_0"],
        winingAmt0: json["WiningAmt_0"],
        totalAmount0: json["TotalAmount_0"],
        fullName1: json["FullName_1 "],
        profilePicture1: json["ProfilePicture_1"],
        fullName2: json["FullName_2 "],
        profilePicture2: json["ProfilePicture_2"],
        fullName3: json["FullName_3 "],
        profilePicture3: json["ProfilePicture_3"],
        fullName4: json["FullName_4 "],
        profilePicture4: json["ProfilePicture_4"],
        fullName5: json["FullName_5 "],
        profilePicture5: json["ProfilePicture_5"],
        fullName6: json["FullName_6 "],
        profilePicture6: json["ProfilePicture_6"],
      );

  Map<String, dynamic> toJson() => {
        "UserId_0 ": userId0,
        "FullName_0 ": fullName0,
        "ProfilePicture_0": profilePicture0,
        "FirstDiceNumberId_0": firstDiceNumberId0,
        "SecondDiceNumberId_0": secondDiceNumberId0,
        "RoomId_0": roomId0,
        "UniqueGameID_0": uniqueGameId0,
        "GameAmt_0": gameAmt0,
        "WiningAmt_0": winingAmt0,
        "TotalAmount_0": totalAmount0,
        "FullName_1 ": fullName1,
        "ProfilePicture_1": profilePicture1,
        "FullName_2 ": fullName2,
        "ProfilePicture_2": profilePicture2,
        "FullName_3 ": fullName3,
        "ProfilePicture_3": profilePicture3,
        "FullName_4 ": fullName4,
        "ProfilePicture_4": profilePicture4,
        "FullName_5 ": fullName5,
        "ProfilePicture_5": profilePicture5,
        "FullName_6 ": fullName6,
        "ProfilePicture_6": profilePicture6,
      };
}
