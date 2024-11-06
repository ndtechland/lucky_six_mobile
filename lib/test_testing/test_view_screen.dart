import 'dart:io';

import 'package:flutter/material.dart';
import 'package:game_app/test_testing/showcase_test_controller.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final UserController userController = Get.put(UserController());
  bool _pdfCreated = false;

  Future<String?> getFilePath() async {
    try {
      final directory = await getExternalStorageDirectory();
      return directory?.path;
    } catch (e) {
      print('Failed to get file path: $e');
      return null;
    }
  }

  Future<void> requestPermissions() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
  }

  Future<Map<String, String>> fetchLocalValues() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'field1': prefs.getString('field1') ?? '',
      'field2': prefs.getString('field2') ?? '',
      'field3': prefs.getString('field3') ?? '',
      'field4': prefs.getString('field4') ?? '',
      'field5': prefs.getString('field5') ?? '',
      'dropdownValue': prefs.getString('dropdownValue') ?? '',
    };
  }

  Future<void> createOrUpdatePdf() async {
    await requestPermissions(); // Ensure permissions are granted

    // Fetch local values
    final localValues = await fetchLocalValues();

    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
                'Field 1: ${userController.field1.value.isNotEmpty ? userController.field1.value : localValues['field1']}',
                style:
                    pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 8),
            pw.Text(
                'Field 2: ${userController.field2.value.isNotEmpty ? userController.field2.value : localValues['field2']}',
                style:
                    pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 8),
            pw.Text(
                'Field 3: ${userController.field3.value.isNotEmpty ? userController.field3.value : localValues['field3']}',
                style:
                    pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 8),
            pw.Text(
                'Field 4: ${userController.field4.value.isNotEmpty ? userController.field4.value : localValues['field4']}',
                style:
                    pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 8),
            pw.Text(
                'Field 5: ${userController.field5.value.isNotEmpty ? userController.field5.value : localValues['field5']}',
                style:
                    pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 8),
            pw.Text(
                'Dropdown: ${userController.dropdownValue.value.isNotEmpty ? userController.dropdownValue.value : localValues['dropdownValue']}',
                style:
                    pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
          ],
        ),
      ),
    );

    final outputFilePath = await getFilePath();
    if (outputFilePath == null) {
      print('Failed to get file path');
      return;
    }

    final filePath = '$outputFilePath/sample.pdf';
    final file = File(filePath);

    try {
      await file.writeAsBytes(await pdf.save());
      print('PDF file saved to: $filePath');
      setState(() {
        _pdfCreated = true;
      });
    } catch (e) {
      print('Failed to save PDF file: $e');
    }
  }

  Future<void> openPdfFile() async {
    await requestPermissions(); // Ensure permissions are granted

    try {
      final filePath = await getFilePath();
      if (filePath == null) {
        print('Failed to get file path');
        return;
      }

      final fullPath = '$filePath/sample.pdf';
      print('Trying to open file at: $fullPath'); // Debug print

      final file = File(fullPath);
      if (await file.exists()) {
        final result = await OpenFile.open(fullPath);
        if (result.type == ResultType.done) {
          print('File opened successfully');
        } else {
          print('Failed to open file: ${result.message}');
        }
      } else {
        print('File does not exist at path: $fullPath');
      }
    } catch (e, stackTrace) {
      print('Error opening file: $e');
      print('Stack trace: $stackTrace');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Field 1:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Obx(() => Text(
                  userController.field1.value.isNotEmpty
                      ? userController.field1.value
                      : 'No Value',
                  style: TextStyle(fontSize: 16))),
              SizedBox(height: 12),
              Text('Field 2:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Obx(() => Text(
                  userController.field2.value.isNotEmpty
                      ? userController.field2.value
                      : 'No Value',
                  style: TextStyle(fontSize: 16))),
              SizedBox(height: 12),
              Text('Field 3:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Obx(() => Text(
                  userController.field3.value.isNotEmpty
                      ? userController.field3.value
                      : 'No Value',
                  style: TextStyle(fontSize: 16))),
              SizedBox(height: 12),
              Text('Field 4:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Obx(() => Text(
                  userController.field4.value.isNotEmpty
                      ? userController.field4.value
                      : 'No Value',
                  style: TextStyle(fontSize: 16))),
              SizedBox(height: 12),
              Text('Field 5:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Obx(() => Text(
                  userController.field5.value.isNotEmpty
                      ? userController.field5.value
                      : 'No Value',
                  style: TextStyle(fontSize: 16))),
              SizedBox(height: 12),
              Text('Dropdown:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Obx(() => Text(
                  userController.dropdownValue.value.isNotEmpty
                      ? userController.dropdownValue.value
                      : 'No Value',
                  style: TextStyle(fontSize: 16))),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await createOrUpdatePdf(); // Create or update the PDF file
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal, // Background color
                  padding: EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 24.0), // Padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                  ),
                ),
                child: Text('Save PDF',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _pdfCreated
                    ? () async {
                        await openPdfFile(); // Open the generated PDF file
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Background color
                  padding: EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 24.0), // Padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                  ),
                ),
                child: Text('View PDF',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
