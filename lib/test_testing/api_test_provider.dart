// import 'dart:convert';
//
// import 'package:game_app/test_testing/test_case_model.dart';
// import 'package:http/http.dart' as http;
//
// class ApiProvider {
//   // JSONPlaceholder API URL
//   final String apiUrl = 'https://jsonplaceholder.typicode.com/posts';
//
//   // Fetch events from the dummy API
//   Future<List<Event>> fetchEvents() async {
//     final response = await http.get(Uri.parse(apiUrl));
//
//     if (response.statusCode == 200) {
//       List<dynamic> data = jsonDecode(response.body);
//       return data.map((json) => Event.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load events');
//     }
//   }
// }
///todo: calender

// import 'package:game_app/test_testing/test_case_model.dart';
//
// ///
// // lib/models/static_event_data.dart
//
// // lib/models/static_event_data.dart
//
// class StaticEventData {
//   static List<EventModel> getEvents() {
//     return [
//       EventModel(
//         date: DateTime.utc(2024, 9, 2),
//         title: "Event 1",
//         subtitle: "Subtitle 1",
//       ),
//       EventModel(
//         date: DateTime.utc(2024, 9, 2),
//         title: "Event 1.2",
//         subtitle: "Subtitle 1.2",
//       ),
//       EventModel(
//         date: DateTime.utc(2024, 9, 5),
//         title: "Event 2",
//         subtitle: "Subtitle 2",
//       ),
//       EventModel(
//         date: DateTime.utc(2024, 9, 10),
//         title: "Event 3",
//         subtitle: "Subtitle 3",
//       ),
//       EventModel(
//         date: DateTime.utc(2024, 9, 15),
//         title: "Event 4",
//         subtitle: "Subtitle 4",
//       ),
//       EventModel(
//         date: DateTime.utc(2024, 9, 20),
//         title: "Event 5",
//         subtitle: "Subtitle 5",
//       ),
//     ];
//   }
// }

///sqflite...
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    String path = join(dbPath, 'mydatabase.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE userDetails (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          field1 TEXT,
          field2 TEXT,
          field3 TEXT,
          field4 TEXT,
          field5 TEXT,
          dropdownValue TEXT
        )
        ''');
      },
    );
  }

  Future<void> insertData(Map<String, dynamic> data) async {
    final db = await database;
    await db.insert('userDetails', data);
  }

  Future<Map<String, dynamic>?> getData(int id) async {
    final db = await database;
    List<Map<String, dynamic>> result =
        await db.query('userDetails', where: 'id = ?', whereArgs: [id]);
    return result.isNotEmpty ? result.first : null;
  }

  Future<void> updateField(int id, String updatedValue) async {
    final db = await database;
    await db.update('userDetails', {'field1': updatedValue},
        where: 'id = ?', whereArgs: [id]);
  }
}
