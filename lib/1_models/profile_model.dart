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
  String? fullName;
  String? email;
  String? phoneNumber;
  String? profilePicture;
  DateTime? dob;
  String? address;
  String? pinCode;

  Profile({
    this.id,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.profilePicture,
    this.dob,
    this.address,
    this.pinCode,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        fullName: json["fullName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        profilePicture: json["profilePicture"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        address: json["address"],
        pinCode: json["pinCode"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "email": email,
        "phoneNumber": phoneNumber,
        "profilePicture": profilePicture,
        "dob": dob?.toIso8601String(),
        "address": address,
        "pinCode": pinCode,
      };
}
