// api_service.dart

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model_test.dart';

class ApiService {
  static Future<DocumentResponse?> fetchAllDocuments(int memberNameId) async {
    final String url =
        'https://new.signatureresorts.in/api/AddmemberApi/GetAllDocument?MemberNameid=$memberNameId';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Parse the JSON response and return a DocumentResponse object
        return DocumentResponse.fromJson(json.decode(response.body));
      } else {
        print('Failed to load documents. Status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching documents: $e');
      return null;
    }
  }
}
