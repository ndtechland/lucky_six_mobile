// lib/controllers/events_controller.dart
// import 'package:game_app/test_testing/test_case_model.dart';
// import 'package:get/get.dart';
// import 'package:table_calendar/table_calendar.dart';
//
// import 'api_test_provider.dart';
//
// class EventsController extends GetxController {
//   final Rx<DateTime> focusedDay = DateTime.now().obs;
//   final Rx<DateTime?> selectedDay = Rxn<DateTime>(null);
//   final Rx<CalendarFormat> calendarFormat = CalendarFormat.month.obs;
//
//   // Static event data
//   final RxMap<DateTime, List<EventModel>> events =
//       <DateTime, List<EventModel>>{}.obs;
//
//   EventsController() {
//     _initializeEvents();
//   }
//
//   void _initializeEvents() {
//     final eventsList = StaticEventData.getEvents();
//
//     for (var event in eventsList) {
//       final eventDate =
//           DateTime(event.date.year, event.date.month, event.date.day);
//       if (events.containsKey(eventDate)) {
//         events[eventDate]?.add(event);
//       } else {
//         events[eventDate] = [event];
//       }
//     }
//
//     // Automatically select the first date with events
//     _autoSelectDatesWithEvents();
//   }
//
//   void _autoSelectDatesWithEvents() {
//     final datesWithEvents = events.keys.toList();
//     if (datesWithEvents.isNotEmpty) {
//       selectedDay.value = datesWithEvents.first;
//       focusedDay.value = datesWithEvents.first;
//     }
//   }
//
//   void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
//     this.selectedDay.value = selectedDay;
//     this.focusedDay.value = focusedDay;
//   }
//
//   void onFormatChanged(CalendarFormat format) {
//     calendarFormat.value = format;
//   }
//
//   void onPageChanged(DateTime focusedDay) {
//     this.focusedDay.value = focusedDay;
//   }
//
//   List<EventModel> getEventsForDay(DateTime day) {
//     final eventDate = DateTime(day.year, day.month, day.day);
//     return events[eventDate] ?? [];
//   }
//
//   bool hasEvents(DateTime day) {
//     final eventDate = DateTime(day.year, day.month, day.day);
//     return events.containsKey(eventDate);
//   }
// }

///todo: sqflite
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  var field1 = ''.obs;
  var field2 = ''.obs;
  var field3 = ''.obs;
  var field4 = ''.obs;
  var field5 = ''.obs;
  var dropdownValue = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _loadPreferences();
  }

  // Load saved preferences
  void _loadPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      field1.value = prefs.getString('field1') ?? '';
      field2.value = prefs.getString('field2') ?? '';
      field3.value = prefs.getString('field3') ?? '';
      field4.value = prefs.getString('field4') ?? '';
      field5.value = prefs.getString('field5') ?? '';
      dropdownValue.value = prefs.getString('dropdownValue') ?? '';
    } catch (e) {
      print('Failed to load preferences: $e');
    }
  }

  // Save preferences
  void _savePreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('field1', field1.value);
      await prefs.setString('field2', field2.value);
      await prefs.setString('field3', field3.value);
      await prefs.setString('field4', field4.value);
      await prefs.setString('field5', field5.value);
      await prefs.setString('dropdownValue', dropdownValue.value);
    } catch (e) {
      print('Failed to save preferences: $e');
    }
  }

  @override
  void onClose() {
    _savePreferences();
    super.onClose();
  }

  // Method to handle data submission or processing
  void insertData() {
    print('Field 1: ${field1.value}');
    print('Field 2: ${field2.value}');
    print('Field 3: ${field3.value}');
    print('Field 4: ${field4.value}');
    print('Field 5: ${field5.value}');
    print('Dropdown: ${dropdownValue.value}');
  }

  // Method to clear all form fields without removing saved preferences
  void clearFields() {
    field1.value = '';
    field2.value = '';
    field3.value = '';
    field4.value = '';
    field5.value = '';
    dropdownValue.value = '';
  }

  // Method to update a specific field by index and value
  void updateField(int index, String value) {
    switch (index) {
      case 1:
        field1.value = value;
        break;
      case 2:
        field2.value = value;
        break;
      case 3:
        field3.value = value;
        break;
      case 4:
        field4.value = value;
        break;
      case 5:
        field5.value = value;
        break;
      default:
        print('Invalid field index');
    }
  }
}

///todo: task controller..

// class TaskController extends GetxController {
//   // Initialize selectedDate with the current date
//   var selectedDate = DateTime.now().obs;
//
//   // List of tasks for the selected date
//   var taskList = <Task>[].obs;
//
//   // All tasks (this would typically come from a data source)
//   final allTasks = <Task>[
//     Task(name: 'Task 1', date: DateTime(2024, 9, 1)),
//     Task(name: 'Task 2', date: DateTime(2024, 9, 3)),
//     Task(name: 'Task 3', date: DateTime(2024, 9, 5)),
//     Task(name: 'Task 4', date: DateTime(2024, 9, 10)),
//     Task(name: 'Task 4.1', date: DateTime(2024, 9, 10)),
//     Task(name: 'Task 5', date: DateTime(2024, 9, 15)),
//   ];
//
//   @override
//   void onInit() {
//     super.onInit();
//     // Select the nearest task date
//     selectNearestTaskDate();
//   }
//
//   void selectDate(DateTime date) {
//     selectedDate.value = date;
//     // Update task list based on selected date
//     updateTasksForSelectedDate();
//   }
//
//   void selectNearestTaskDate() {
//     // Find the nearest task date
//     final today = DateTime.now();
//     final nearestTask = allTasks
//         .where((task) => task.date.isAfter(today))
//         .toList()
//       ..sort((a, b) => a.date.compareTo(b.date));
//
//     if (nearestTask.isNotEmpty) {
//       selectedDate.value = nearestTask.first.date;
//       updateTasksForSelectedDate();
//     }
//   }
//
//   void updateTasksForSelectedDate() {
//     // Update tasks for the selected date
//     taskList.clear();
//     taskList.addAll(allTasks
//         .where((task) => isSameDay(task.date, selectedDate.value))
//         .toList());
//   }
//
//   bool isSameDay(DateTime date1, DateTime date2) {
//     return date1.year == date2.year &&
//         date1.month == date2.month &&
//         date1.day == date2.day;
//   }
// }
//
// class Task {
//   final String name;
//   final DateTime date;
//
//   Task({required this.name, required this.date});
// }

///todo:............

class DateTaskController extends GetxController {
  var selectedDate = DateTime.now().obs; // Initially the current date
  var dates = <DateTime>[].obs;

  // Sample task data by date
  final Map<String, List<String>> tasksByDate = {
    '2024-09-10': ['Task 1', 'Task 2'],
    '2024-09-11': ['Task 3', 'Task 4'],
    '2024-09-12': ['Task 5', 'Task 6'],
    '2024-09-13': ['Task 7'],
  };

  @override
  void onInit() {
    super.onInit();
    generateDatesForMonths(3); // Generate dates for 3 months
    // Automatically select a particular date if needed
    selectDate(DateTime.now()); // Selects today by default
  }

  // Function to generate all dates for a specific month and year
  List<DateTime> getDatesInMonth(int month, int year) {
    List<DateTime> dates = [];
    int daysInMonth =
        DateTime(year, month + 1, 0).day; // Get the number of days in the month

    for (int i = 1; i <= daysInMonth; i++) {
      dates.add(DateTime(year, month, i)); // Generate dates without time
    }

    return dates;
  }

  // Generate dates for the next n months
  void generateDatesForMonths(int numberOfMonths) {
    DateTime currentDate = DateTime.now();
    dates.clear();

    for (int i = 0; i < numberOfMonths; i++) {
      int currentMonth = currentDate.month + i;
      int currentYear = currentDate.year;

      // Adjust the year if the month exceeds 12
      if (currentMonth > 12) {
        currentMonth -= 12;
        currentYear += 1;
      }

      dates.addAll(getDatesInMonth(currentMonth, currentYear));
    }
  }

  // Get tasks for the selected date
  List<String> getTasksForDate(DateTime date) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(date);
    return tasksByDate[formattedDate] ?? [];
  }

  // Strip time from DateTime for accurate comparison
  DateTime stripTime(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }

  // Helper method to compare two DateTime objects and check if they represent the same day
  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  // Method to select a specific date
  void selectDate(DateTime date) {
    selectedDate.value = stripTime(date);
  }

  // Optional: Add a method to get the current date
  DateTime getCurrentDate() {
    return DateTime.now();
  }

  // Optional: Add a method to clear tasks for a specific date
  void clearTasksForDate(DateTime date) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(date);
    tasksByDate.remove(formattedDate);
  }
}
