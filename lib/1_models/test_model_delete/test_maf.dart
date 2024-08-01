// // To parse this JSON data, do
// //
// //     final mafListKp = mafListKpFromJson(jsonString);
//
// import 'dart:convert';
//
// MafListKp mafListKpFromJson(String str) => MafListKp.fromJson(json.decode(str));
//
// String mafListKpToJson(MafListKp data) => json.encode(data.toJson());
//
// class MafListKp {
//   int? status;
//   String? message;
//   List<MafModel>? data;
//
//   MafListKp({
//     this.status,
//     this.message,
//     this.data,
//   });
//
//   factory MafListKp.fromJson(Map<String, dynamic> json) => MafListKp(
//         status: json["Status"],
//         message: json["Message"],
//         data: json["Data"] == null
//             ? []
//             : List<MafModel>.from(
//                 json["Data"]!.map((x) => MafModel.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "Status": status,
//         "Message": message,
//         "Data": data == null
//             ? []
//             : List<dynamic>.from(data!.map((x) => x.toJson())),
//       };
// }
//
// class MafModel {
//   int? id;
//   int? approvalNumber;
//   String? memberName;
//   DateTime? craeteDate;
//   dynamic welcomeFormNumber;
//   bool? isMember;
//   String? mafNumber;
//   String? dsaCode;
//   String? status;
//   String? mobileNumber;
//   String? preName;
//   dynamic isAdd;
//
//   MafModel({
//     this.id,
//     this.approvalNumber,
//     this.memberName,
//     this.craeteDate,
//     this.welcomeFormNumber,
//     this.isMember,
//     this.mafNumber,
//     this.dsaCode,
//     this.status,
//     this.mobileNumber,
//     this.preName,
//     this.isAdd,
//   });
//
//   factory MafModel.fromJson(Map<String, dynamic> json) => MafModel(
//         id: json["Id"],
//         approvalNumber: json["ApprovalNumber"],
//         memberName: json["MemberName"],
//         craeteDate: json["CraeteDate"] == null
//             ? null
//             : DateTime.parse(json["CraeteDate"]),
//         welcomeFormNumber: json["WelcomeFormNumber"],
//         isMember: json["IsMember"],
//         mafNumber: json["MafNumber"],
//         dsaCode: json["DsaCode"],
//         status: json["Status"],
//         mobileNumber: json["MobileNumber"],
//         preName: json["PreName"],
//         isAdd: json["IsAdd"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "Id": id,
//         "ApprovalNumber": approvalNumber,
//         "MemberName": memberName,
//         "CraeteDate": craeteDate?.toIso8601String(),
//         "WelcomeFormNumber": welcomeFormNumber,
//         "IsMember": isMember,
//         "MafNumber": mafNumber,
//         "DsaCode": dsaCode,
//         "Status": status,
//         "MobileNumber": mobileNumber,
//         "PreName": preName,
//         "IsAdd": isAdd,
//       };
// }
