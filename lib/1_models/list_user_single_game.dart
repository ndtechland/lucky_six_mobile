// To parse this JSON data, do
//
//     final userListModelSingle = userListModelSingleFromJson(jsonString);

import 'dart:convert';

UserListModelSingle userListModelSingleFromJson(String str) =>
    UserListModelSingle.fromJson(json.decode(str));

String userListModelSingleToJson(UserListModelSingle data) =>
    json.encode(data.toJson());

class UserListModelSingle {
  String? userId;
  String? fullName;
  String? profilePicture;
  String? roomId;
  String? uniqueGameId;
  List<UserListModelSingle>? usersInRoom;

  UserListModelSingle({
    this.userId,
    this.fullName,
    this.profilePicture,
    this.roomId,
    this.uniqueGameId,
    this.usersInRoom,
  });

  factory UserListModelSingle.fromJson(Map<String, dynamic> json) =>
      UserListModelSingle(
        userId: json["userId"],
        fullName: json["fullName"],
        profilePicture: json["profilePicture"],
        roomId: json["roomId"],
        uniqueGameId: json["uniqueGameID"],
        usersInRoom: json["usersInRoom"] == null
            ? []
            : List<UserListModelSingle>.from(json["usersInRoom"]!
                .map((x) => UserListModelSingle.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "fullName": fullName,
        "profilePicture": profilePicture,
        "roomId": roomId,
        "uniqueGameID": uniqueGameId,
        "usersInRoom": usersInRoom == null
            ? []
            : List<dynamic>.from(usersInRoom!.map((x) => x.toJson())),
      };
}
