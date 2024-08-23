import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'controllersssstest.dart';

class DocumentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DocumentController controller = Get.put(DocumentController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Document Details'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.documentResponse != null) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FileItem(
                  title: 'MafFile',
                  filePath: controller.documentResponse!.allData.mafFile,
                ),
                FileItem(
                  title: 'ReceiptFile',
                  filePath: controller.documentResponse!.allData.receiptFile,
                ),
                FileItem(
                  title: 'AgreementFile',
                  filePath: controller.documentResponse!.allData.agreementFile,
                ),
              ],
            ),
          );
        } else {
          return Center(child: Text('Failed to load documents'));
        }
      }),
    );
  }
}

class FileItem extends StatelessWidget {
  final String title;
  final String filePath;

  // Base URL for the files
  final String baseUrl = 'https://new.signatureresorts.in/';

  FileItem({required this.title, required this.filePath});

  void _openFile(String filePath) async {
    // Concatenate the base URL with the file path
    final fullUrl = baseUrl + filePath;

    if (await canLaunch(fullUrl)) {
      await launch(fullUrl);
    } else {
      print("Could not open file: $fullUrl");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openFile(filePath),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          '$title: $filePath',
          style: TextStyle(
            color: Colors.blue,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
