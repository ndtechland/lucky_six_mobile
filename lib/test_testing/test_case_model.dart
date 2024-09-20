// lib/models/event_model.dart
class EventModel {
  final DateTime date;
  final String title;
  final String subtitle;

  EventModel({
    required this.date,
    required this.title,
    required this.subtitle,
  });

  // Convert a JSON map to an EventModel instance
  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      date: DateTime.parse(json['date']),
      title: json['title'],
      subtitle: json['subtitle'],
    );
  }

  // Convert an EventModel instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'title': title,
      'subtitle': subtitle,
    };
  }
}
