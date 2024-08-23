class DocumentResponse {
  int status;
  String message;
  AllData allData;

  DocumentResponse(
      {required this.status, required this.message, required this.allData});

  factory DocumentResponse.fromJson(Map<String, dynamic> json) {
    return DocumentResponse(
      status: json['Status'],
      message: json['Message'],
      allData: AllData.fromJson(json['Alldata']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Status': status,
      'Message': message,
      'Alldata': allData.toJson(),
    };
  }
}

class AllData {
  String mafFile;
  String receiptFile;
  String agreementFile;

  AllData(
      {required this.mafFile,
      required this.receiptFile,
      required this.agreementFile});

  factory AllData.fromJson(Map<String, dynamic> json) {
    return AllData(
      mafFile: json['MafFile'],
      receiptFile: json['ReceiptFile'],
      agreementFile: json['AgreementFile'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'MafFile': mafFile,
      'ReceiptFile': receiptFile,
      'AgreementFile': agreementFile,
    };
  }
}
