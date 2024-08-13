// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  int? status;
  String? message;
  Profile? profile;

  ProfileModel({
    this.status,
    this.message,
    this.profile,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        status: json["status"],
        message: json["message"],
        profile:
            json["profile"] == null ? null : Profile.fromJson(json["profile"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "profile": profile?.toJson(),
      };
}

class Profile {
  String? id;
  String? userName;
  String? email;
  String? phoneNumber;

  Profile({
    this.id,
    this.userName,
    this.email,
    this.phoneNumber,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        userName: json["userName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userName": userName,
        "email": email,
        "phoneNumber": phoneNumber,
      };
}
