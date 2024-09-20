import 'dart:convert';

DicepipupBidAvlPriceModel dicepipupBidAvlPriceModelFromJson(String str) =>
    DicepipupBidAvlPriceModel.fromJson(json.decode(str));
String dicepipupBidAvlPriceModelToJson(DicepipupBidAvlPriceModel data) =>
    json.encode(data.toJson());

class DicepipupBidAvlPriceModel {
  bool? succeeded;
  num? statusCode;
  dynamic status;
  String? message;
  dynamic error;
  DataBal? data2;

  DicepipupBidAvlPriceModel({
    this.succeeded,
    this.statusCode,
    this.status,
    this.message,
    this.error,
    this.data2,
  });

  factory DicepipupBidAvlPriceModel.fromJson(Map<String, dynamic> json) =>
      DicepipupBidAvlPriceModel(
        succeeded: json["succeeded"],
        statusCode: json["statusCode"],
        status: json["status"],
        message: json["message"],
        error: json["error"],
        data2: json["data"] == null ? null : DataBal.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "succeeded": succeeded,
        "statusCode": statusCode,
        "status": status,
        "message": message,
        "error": error,
        "data": data2?.toJson(),
      };
}

class DataBal {
  num? bettingAmount;
  num? totalAvlAmt;

  DataBal({
    this.bettingAmount,
    this.totalAvlAmt,
  });

  factory DataBal.fromJson(Map<String, dynamic> json) => DataBal(
        bettingAmount: json["bettingAmount"],
        totalAvlAmt: json["totalAvlAmt"],
      );

  Map<String, dynamic> toJson() => {
        "bettingAmount": bettingAmount,
        "totalAvlAmt": totalAvlAmt,
      };
}

///todo:.......twgmfbfdbmfdbmfdmbfdb........sdvcdsv.........dscvd.........sdcdsc.........sdcds.........cdsd..........
