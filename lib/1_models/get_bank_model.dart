// To parse this JSON data, do
//
//     final getBankModel = getBankModelFromJson(jsonString);

import 'dart:convert';

GetBankModel getBankModelFromJson(String str) =>
    GetBankModel.fromJson(json.decode(str));

String getBankModelToJson(GetBankModel data) => json.encode(data.toJson());

class GetBankModel {
  int? status;
  String? message;
  BankDetail? bankDetail;

  GetBankModel({
    this.status,
    this.message,
    this.bankDetail,
  });

  factory GetBankModel.fromJson(Map<String, dynamic> json) => GetBankModel(
        status: json["status"],
        message: json["message"],
        bankDetail: json["bankDetail"] == null
            ? null
            : BankDetail.fromJson(json["bankDetail"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "bankDetail": bankDetail?.toJson(),
      };
}

class BankDetail {
  num? id;
  String? userId;
  String? email;
  String? phone;
  String? bankName;
  String? ifsc;
  String? address;
  String? accountHolderName;
  String? upiId;
  String? accountNo;
  DateTime? createdAt;

  BankDetail({
    this.id,
    this.userId,
    this.email,
    this.phone,
    this.bankName,
    this.ifsc,
    this.address,
    this.accountHolderName,
    this.upiId,
    this.accountNo,
    this.createdAt,
  });

  factory BankDetail.fromJson(Map<String, dynamic> json) => BankDetail(
        id: json["id"],
        userId: json["userId"],
        email: json["email"],
        phone: json["phone"],
        bankName: json["bankName"],
        ifsc: json["ifsc"],
        address: json["address"],
        accountHolderName: json["accountHolderName"],
        upiId: json["upiId"],
        accountNo: json["accountNo"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "email": email,
        "phone": phone,
        "bankName": bankName,
        "ifsc": ifsc,
        "address": address,
        "accountHolderName": accountHolderName,
        "upiId": upiId,
        "accountNo": accountNo,
        "createdAt": createdAt?.toIso8601String(),
      };
}
