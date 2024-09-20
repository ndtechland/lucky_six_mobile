// import 'package:flutter/material.dart';
// import 'package:game_app/test_testing/showcase_test_controller.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'package:table_calendar/table_calendar.dart';
//
// import 'test_case_model.dart';
//
// class EventsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final EventsController controller = Get.put(EventsController());
//
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text("Events Calendar"),
//       // ),
//       body: Obx(() {
//         final selectedDay = controller.selectedDay.value;
//         final focusedDay = controller.focusedDay.value;
//
//         // Detect screen orientation
//         final isLandscape =
//             MediaQuery.of(context).orientation == Orientation.landscape;
//
//         return Column(
//           children: [
//             // Calendar widget
//             _buildCalendar(controller, isLandscape),
//
//             // List of events for the selected day
//             Expanded(
//               child: _buildEventList(controller, selectedDay),
//             ),
//           ],
//         );
//       }),
//     );
//   }
//
//   ///todo: calender weight...
//
//   Widget _buildCalendar(EventsController controller, bool isLandscape) {
//     return Column(
//       children: [
//         SizedBox(
//           height: 35,
//         ),
//         // Custom Header
//         Container(
//           padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 2),
//           color: Colors.blueAccent,
//           child: Center(
//             child: Obx(() {
//               final focusedDay = controller.focusedDay.value;
//               final monthYearFormat =
//                   DateFormat('MMM yyyy'); // Full month name and year
//               final formattedDate = monthYearFormat.format(focusedDay);
//               return Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     SizedBox(
//                       width: 50,
//                       height: 40,
//                       child: Align(
//                         alignment: Alignment.centerLeft,
//                         child: InkWell(
//                           onTap: () {
//                             Get.back();
//                           },
//                           child: Icon(
//                             Icons.arrow_back,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 55,
//                       height: 40,
//                       child: Center(
//                         child: Text(
//                           "Events",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 18.0,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 99,
//                       height: 40,
//                       child: Center(
//                         child: Row(
//                           children: [
//                             InkWell(
//                                 onTap: () {
//                                   // Navigate to previous month
//                                   final newFocusedDay = DateTime(
//                                     focusedDay.year,
//                                     focusedDay.month - 1,
//                                   );
//                                   controller.onPageChanged(newFocusedDay);
//                                 },
//                                 child: Icon(
//                                   Icons.arrow_back_ios_new,
//                                   color: Colors.grey.shade300,
//                                   size: 16,
//                                 )),
//                             Text(
//                               formattedDate,
//                               style: GoogleFonts.roboto(
//                                 color: Colors.yellow.shade700,
//                                 fontSize: 15.0,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             InkWell(
//                                 onTap: () {
//                                   // Navigate to previous month
//                                   final newFocusedDay = DateTime(
//                                     focusedDay.year,
//                                     focusedDay.month + 1,
//                                   );
//                                   controller.onPageChanged(newFocusedDay);
//                                 },
//                                 child: Icon(
//                                   Icons.arrow_forward_ios_rounded,
//                                   color: Colors.grey.shade300,
//                                   size: 16,
//                                 )),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             }),
//           ),
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         // Calendar widget
//         TableCalendar(
//           headerVisible: false,
//           focusedDay: controller.focusedDay.value,
//           firstDay: DateTime.utc(2023, 1, 1),
//           lastDay: DateTime.utc(2040, 12, 31),
//           calendarFormat: isLandscape
//               ? CalendarFormat.twoWeeks
//               : controller.calendarFormat.value,
//           selectedDayPredicate: (day) {
//             return controller.selectedDay.value?.isSameDay(day) ?? false;
//           },
//           onDaySelected: (selectedDay, focusedDay) {
//             controller.onDaySelected(selectedDay, focusedDay);
//           },
//           onFormatChanged: (format) {
//             controller.onFormatChanged(format);
//           },
//           onPageChanged: (focusedDay) {
//             controller.onPageChanged(focusedDay);
//           },
//           calendarStyle: CalendarStyle(
//             todayDecoration: BoxDecoration(
//               color: Colors.blueAccent,
//               shape: BoxShape.circle,
//             ),
//             selectedDecoration: BoxDecoration(
//               color: Colors.orange, // Transparent as custom markers are used
//               shape: BoxShape.circle,
//             ),
//             defaultDecoration: BoxDecoration(
//               color: Colors.transparent,
//             ),
//             weekendDecoration: BoxDecoration(
//               color: Colors.red,
//             ),
//             outsideDecoration: BoxDecoration(
//               color: Colors.grey.shade100,
//               shape: BoxShape.circle,
//             ),
//           ),
//           calendarBuilders: CalendarBuilders(
//             markerBuilder: (context, date, events) {
//               final eventModels = events.cast<EventModel>();
//
//               if (eventModels.isNotEmpty) {
//                 // Show only one marker if there are events
//                 return Positioned(
//                   bottom: 4, // Position at the bottom of the date cell
//                   child: _buildSingleEventMarker(), // Show the marker
//                 );
//               }
//               return SizedBox.shrink(); // No marker if no events
//             },
//             defaultBuilder: (context, day, focusedDay) {
//               final eventDate = DateTime(day.year, day.month, day.day);
//               final hasEvent = controller.hasEvents(eventDate);
//
//               return Padding(
//                 padding: const EdgeInsets.all(6.0),
//                 child: Material(
//                   elevation: 5,
//                   shape: CircleBorder(), // Shape of the marker (can be changed
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: hasEvent
//                           ? Colors.red
//                           : (controller.selectedDay.value?.isSameDay(day) ??
//                                   false
//                               ? Colors.redAccent
//                               : Colors.transparent),
//                       shape: BoxShape.circle,
//                     ),
//                     child: Center(
//                       child: Text(
//                         '${day.day}',
//                         style: TextStyle(
//                           color: hasEvent ? Colors.white : Colors.black,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildSingleEventMarker() {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 1.5),
//       width: 10, // Adjust size as necessary
//       height: 10,
//       decoration: BoxDecoration(
//         color: Colors.redAccent, // Marker color
//         shape: BoxShape.circle,
//       ),
//     );
//   }
//
//   // Build event list
//   Widget _buildEventList(EventsController controller, DateTime? selectedDay) {
//     if (selectedDay == null) {
//       return Center(child: Text("No date selected"));
//     }
//
//     List<EventModel> selectedEvents = controller.getEventsForDay(selectedDay);
//
//     // Debugging
//     print('Events for $selectedDay: $selectedEvents');
//
//     if (selectedEvents.isEmpty) {
//       return Center(child: Text("No events available for this date"));
//     }
//
//     return ListView.builder(
//       itemCount: selectedEvents.length,
//       itemBuilder: (context, index) {
//         final event = selectedEvents[index];
//         return Card(
//           clipBehavior: Clip.antiAlias,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           elevation: 2,
//           color: Colors.white,
//           child: Row(
//             children: [
//               Container(
//                 color: colorrs[index % colorrs.length],
//                 width: 10,
//                 height: 72,
//               ),
//               SizedBox(
//                 width: 10.0,
//               ),
//               Expanded(
//                 child: ListTile(
//                   title: Text(event.title),
//                   subtitle: Text(event.subtitle),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
// }
//
// // Extension to compare date only
// extension DateTimeComparison on DateTime {
//   bool isSameDay(DateTime other) {
//     return this.year == other.year &&
//         this.month == other.month &&
//         this.day == other.day;
//   }
// }
//
// List<Color> colorrs = [
//   Colors.blue,
//   Colors.green,
//   Colors.pink,
//   Colors.yellow,
//   Colors.orange,
//   Colors.red,
//   Colors.brown,
//   Colors.deepPurple,
//   Colors.cyan,
// ];
///todo: sqflite
import 'package:flutter/material.dart';
import 'package:game_app/test_testing/showcase_test_controller.dart';
import 'package:game_app/test_testing/test_view_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constantt/color_text.dart';

// Update the import path

class InputPage extends StatelessWidget {
  final TextEditingController field1Controller = TextEditingController();
  final TextEditingController field2Controller = TextEditingController();
  final TextEditingController field3Controller = TextEditingController();
  final TextEditingController field4Controller = TextEditingController();
  final TextEditingController field5Controller = TextEditingController();

  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Input Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: field1Controller,
                decoration: InputDecoration(labelText: 'Field 1'),
                onChanged: (value) => userController.field1.value = value,
              ),
              TextField(
                controller: field2Controller,
                decoration: InputDecoration(labelText: 'Field 2'),
                onChanged: (value) => userController.field2.value = value,
              ),
              TextField(
                controller: field3Controller,
                decoration: InputDecoration(labelText: 'Field 3'),
                onChanged: (value) => userController.field3.value = value,
              ),
              TextField(
                controller: field4Controller,
                decoration: InputDecoration(labelText: 'Field 4'),
                onChanged: (value) => userController.field4.value = value,
              ),
              TextField(
                controller: field5Controller,
                decoration: InputDecoration(labelText: 'Field 5'),
                onChanged: (value) => userController.field5.value = value,
              ),
              Obx(() => DropdownButton<String>(
                    value: userController.dropdownValue.value.isNotEmpty
                        ? userController.dropdownValue.value
                        : null,
                    hint: Text('Select an option'),
                    items: <String>['Option 1', 'Option 2', 'Option 3']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      userController.dropdownValue.value = value ?? '';
                    },
                  )),
              ElevatedButton(
                onPressed: () async {
                  await _updateSingleField();
                  Get.to(() => DetailPage());
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _updateSingleField() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('field1', userController.field1.value);
    await prefs.setString('field2', userController.field2.value);
    await prefs.setString('field3', userController.field3.value);
    await prefs.setString('field4', userController.field4.value);
    await prefs.setString('field5', userController.field5.value);
    await prefs.setString('dropdownValue', userController.dropdownValue.value);
  }
}

///todo: task ui..

// class TaskScreen extends StatelessWidget {
//   final TaskController controller = Get.put(TaskController());
//   final List<Color> colors = [
//     Colors.blue,
//     Colors.green,
//     Colors.pink,
//     Colors.yellow,
//     Colors.orange,
//     Colors.red,
//     Colors.brown,
//     Colors.deepPurple,
//     Colors.cyan,
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     // Determine the calendar format based on the screen orientation
//     bool isPortrait =
//         MediaQuery.of(context).orientation == Orientation.portrait;
//     CalendarFormat calendarFormat =
//         isPortrait ? CalendarFormat.week : CalendarFormat.week;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Task Manager'),
//       ),
//       body: OrientationBuilder(
//         builder: (context, orientation) {
//           return LayoutBuilder(
//             builder: (context, constraints) {
//               var screenWidth = constraints.maxWidth;
//               var screenHeight = constraints.maxHeight;
//
//               var imageWidth = orientation == Orientation.portrait
//                   ? screenWidth * 0.55
//                   : screenWidth * 0.25;
//               var imageHeight = orientation == Orientation.portrait
//                   ? screenHeight * 0.2
//                   : screenHeight * 0.5;
//
//               var imageWidth2 = orientation == Orientation.portrait
//                   ? screenWidth * 0.3
//                   : screenWidth * 0.19;
//               var imageHeight2 = orientation == Orientation.portrait
//                   ? screenHeight * 0.32
//                   : screenHeight * 0.8;
//
//               var categoryWidth = orientation == Orientation.portrait
//                   ? screenWidth * 0.5
//                   : screenWidth * 0.28;
//               var categoryHeight = orientation == Orientation.portrait
//                   ? screenHeight * 0.4
//                   : screenHeight * 0.9;
//               var taskListWidth = orientation == Orientation.portrait
//                   ? screenWidth * 0.5
//                   : screenWidth * 0.28;
//               var taskListHeight = orientation == Orientation.portrait
//                   ? screenHeight * 0.3
//                   : screenHeight * 0.9;
//               return Column(
//                 children: [
//                   // Calendar Widget
//                   Obx(() => TableCalendar(
//                         focusedDay: controller.selectedDate.value,
//                         firstDay: DateTime(2020),
//                         lastDay: DateTime(2040),
//                         calendarFormat: calendarFormat,
//                         startingDayOfWeek: StartingDayOfWeek.monday,
//                         onDaySelected: (selectedDay, focusedDay) {
//                           controller.selectDate(selectedDay);
//                         },
//                         selectedDayPredicate: (day) {
//                           return controller.isSameDay(
//                               controller.selectedDate.value, day);
//                         },
//                         calendarStyle: CalendarStyle(
//                           isTodayHighlighted: true,
//                           selectedDecoration: BoxDecoration(
//                             color: Colors
//                                 .blue[900], // Dark color for selected date
//                             borderRadius:
//                                 BorderRadius.circular(8.0), // Rounded corners
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black
//                                     .withOpacity(0.5), // Shadow color
//                                 offset: Offset(0, 3), // Shadow offset
//                                 blurRadius: 4, // Shadow blur radius
//                               ),
//                             ],
//                           ),
//                           todayDecoration: BoxDecoration(
//                             color: Colors.orange,
//                             shape: BoxShape.circle,
//                           ),
//                           defaultDecoration: BoxDecoration(
//                             color: Colors
//                                 .transparent, // Default transparent for unselected dates
//                           ),
//                         ),
//                         calendarBuilders: CalendarBuilders(
//                           // Customize day builder
//                           defaultBuilder: (context, day, focusedDay) {
//                             // Check if the day has a task
//                             bool hasTask = controller.allTasks.any(
//                                 (task) => controller.isSameDay(task.date, day));
//
//                             return Container(
//                               margin: const EdgeInsets.all(4.0),
//                               decoration: BoxDecoration(
//                                 color: controller.isSameDay(
//                                         day, controller.selectedDate.value)
//                                     ? Colors
//                                         .transparent // Transparent for selected date
//                                     : Colors.grey[
//                                         200], // Light color for unselected dates
//                                 borderRadius: BorderRadius.circular(
//                                     8.0), // Rounded corners
//                                 border: Border.all(
//                                   color: controller.isSameDay(
//                                           day, controller.selectedDate.value)
//                                       ? Colors
//                                           .black // Border color for the selected date
//                                       : Colors
//                                           .transparent, // Transparent border for non-selected dates
//                                   width: 2.0, // Border width
//                                 ),
//                                 boxShadow: controller.isSameDay(
//                                         day, controller.selectedDate.value)
//                                     ? [
//                                         BoxShadow(
//                                           color: Colors.black
//                                               .withOpacity(0.5), // Shadow color
//                                           offset: Offset(0, 3), // Shadow offset
//                                           blurRadius: 4, // Shadow blur radius
//                                         ),
//                                       ]
//                                     : [], // No shadow for unselected dates
//                               ),
//                               child: Stack(
//                                 children: [
//                                   // Centered red marker
//                                   if (hasTask)
//                                     Positioned(
//                                       bottom:
//                                           4.0, // Adjust the position as needed
//                                       left: 0.0,
//                                       right: 0.0,
//                                       child: Center(
//                                         child: Container(
//                                           width: 8.0,
//                                           height: 8.0,
//                                           decoration: BoxDecoration(
//                                             color: Colors.red, // Marker color
//                                             shape: BoxShape.circle,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   Center(
//                                     child: Text(
//                                       '${day.day}',
//                                       style: TextStyle(
//                                         color: Colors.black,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         ),
//                         headerStyle: HeaderStyle(
//                           formatButtonVisible: false,
//                           titleCentered: true,
//                         ),
//                       )),
//                   SizedBox(height: 16.0),
//                   // Task List
//                   Expanded(
//                     child: Obx(() => ListView.builder(
//                           itemCount: controller.taskList.length,
//                           itemBuilder: (context, index) {
//                             final task = controller.taskList[index];
//                             return Padding(
//                               padding:
//                                   const EdgeInsets.fromLTRB(14.0, 0, 14, 14),
//                               child: Card(
//                                 clipBehavior: Clip.antiAlias,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 elevation: 2,
//                                 child: Container(
//                                   height: orientation == Orientation.portrait
//                                       ? MediaQuery.of(context).size.height *
//                                           0.11
//                                       : constraints.maxHeight *
//                                           0.25, // Adjust height based on orientation
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(12),
//                                   ),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Container(
//                                         color: colors[index % colors.length],
//                                         width: orientation ==
//                                                 Orientation.portrait
//                                             ? MediaQuery.of(context)
//                                                     .size
//                                                     .width *
//                                                 0.03
//                                             : constraints.maxWidth *
//                                                 0.015, // Adjust width based on orientation
//                                         height: orientation ==
//                                                 Orientation.portrait
//                                             ? MediaQuery.of(context)
//                                                     .size
//                                                     .height *
//                                                 0.12
//                                             : constraints.maxHeight *
//                                                 0.3, // Adjust height based on orientation
//                                       ),
//                                       Expanded(
//                                         child: Padding(
//                                           padding: EdgeInsets.symmetric(
//                                               horizontal: 12, vertical: 5),
//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Text("Project",
//                                                   style: GoogleFonts.montserrat(
//                                                       textStyle: TextStyle(
//                                                           fontWeight:
//                                                               FontWeight.w600,
//                                                           fontSize: 13))),
//                                               Text(
//                                                 task.name,
//                                                 style: GoogleFonts.poppins(
//                                                   fontSize: 16,
//                                                   fontWeight: FontWeight.w600,
//                                                 ),
//                                               ),
//                                               Spacer(),
//                                               SizedBox(
//                                                 width: orientation ==
//                                                         Orientation.portrait
//                                                     ? MediaQuery.of(context)
//                                                             .size
//                                                             .width *
//                                                         0.3
//                                                     : constraints.maxWidth *
//                                                         0.4, // Adjust width based on orientation
//                                                 height: orientation ==
//                                                         Orientation.portrait
//                                                     ? MediaQuery.of(context)
//                                                             .size
//                                                             .height *
//                                                         0.02
//                                                     : constraints.maxHeight *
//                                                         0.05, // Adjust height based on orientation
//                                                 child: Row(
//                                                   children: [
//                                                     Icon(
//                                                       Icons.alarm,
//                                                       size: orientation ==
//                                                               Orientation
//                                                                   .portrait
//                                                           ? MediaQuery.of(
//                                                                       context)
//                                                                   .size
//                                                                   .height *
//                                                               0.02
//                                                           : constraints
//                                                                   .maxHeight *
//                                                               0.05,
//                                                     ),
//                                                     Text(
//                                                       "9:30 - 6:30",
//                                                       style:
//                                                           GoogleFonts.poppins(
//                                                         fontSize: 11,
//                                                         fontWeight:
//                                                             FontWeight.w500,
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                       Expanded(
//                                         child: SizedBox(
//                                           width: orientation ==
//                                                   Orientation.portrait
//                                               ? MediaQuery.of(context)
//                                                       .size
//                                                       .width *
//                                                   0.2
//                                               : constraints.maxWidth *
//                                                   0.25, // Adjust width based on orientation
//                                           height: orientation ==
//                                                   Orientation.portrait
//                                               ? MediaQuery.of(context)
//                                                       .size
//                                                       .height *
//                                                   0.12
//                                               : constraints.maxHeight *
//                                                   0.26, // Adjust height based on orientation
//                                           child: Padding(
//                                             padding: const EdgeInsets.all(4.0),
//                                             child: Column(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.end,
//                                               children: [
//                                                 Icon(
//                                                   Icons.timelapse,
//                                                   color: Colors.green,
//                                                   size: orientation ==
//                                                           Orientation.portrait
//                                                       ? MediaQuery.of(context)
//                                                               .size
//                                                               .height *
//                                                           0.04
//                                                       : constraints.maxHeight *
//                                                           0.06, // Adjust size based on orientation
//                                                 ),
//                                                 InkWell(
//                                                   onTap: () {
//                                                     Get.to(() => TaskDetailPage(
//                                                         taskId: '$index'));
//                                                   },
//                                                   child: Container(
//                                                     width: orientation ==
//                                                             Orientation.portrait
//                                                         ? MediaQuery.of(context)
//                                                                 .size
//                                                                 .width *
//                                                             0.2
//                                                         : constraints.maxWidth *
//                                                             0.13, // Adjust width based on orientation
//                                                     height: orientation ==
//                                                             Orientation.portrait
//                                                         ? MediaQuery.of(context)
//                                                                 .size
//                                                                 .height *
//                                                             0.03
//                                                         : constraints
//                                                                 .maxHeight *
//                                                             0.07, // Adjust height based on orientation
//                                                     decoration: BoxDecoration(
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(20),
//                                                         border: Border.all(
//                                                             color: Colors
//                                                                 .blue.shade900,
//                                                             width: 1.3)),
//                                                     child: Center(
//                                                       child: Text("See Details",
//                                                           style: GoogleFonts.montserrat(
//                                                               textStyle: TextStyle(
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .w500,
//                                                                   fontSize:
//                                                                       11))),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                         )),
//                   ),
//                 ],
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

///todo:..

class TaskList extends StatelessWidget {
  final DateTaskController dateTaskController = Get.put(DateTaskController());
  final ScrollController _scrollController = ScrollController();

  final List<Color> colors = [
    Colors.blue,
    Colors.green,
    Colors.pink,
    Colors.yellow,
    Colors.orange,
    Colors.red,
    Colors.brown,
    Colors.deepPurple,
    Colors.cyan,
  ];

  final Color taskDateColor = Colors.red; // Color for task dates
  final Color noTaskDateColor =
      Colors.blue[100]!; // Color for dates without tasks

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            appColor2, // Make sure to define appColor2 in your project
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            // Uncomment and implement navigation if needed
            // bottomNavController.changeTabIndex(0);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          'Task Calendar',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return LayoutBuilder(
            builder: (context, constraints) {
              final screenWidth = constraints.maxWidth;
              final screenHeight = constraints.maxHeight;

              final imageWidth = orientation == Orientation.portrait
                  ? screenWidth * 0.55
                  : screenWidth * 0.25;
              final imageHeight = orientation == Orientation.portrait
                  ? screenHeight * 0.2
                  : screenHeight * 0.5;

              final imageWidth2 = orientation == Orientation.portrait
                  ? screenWidth * 0.3
                  : screenWidth * 0.19;
              final imageHeight2 = orientation == Orientation.portrait
                  ? screenHeight * 0.32
                  : screenHeight * 0.8;

              final categoryWidth = orientation == Orientation.portrait
                  ? screenWidth * 0.5
                  : screenWidth * 0.28;
              final categoryHeight = orientation == Orientation.portrait
                  ? screenHeight * 0.4
                  : screenHeight * 0.9;
              final taskListWidth = orientation == Orientation.portrait
                  ? screenWidth * 0.5
                  : screenWidth * 0.28;
              final taskListHeight = orientation == Orientation.portrait
                  ? screenHeight * 0.3
                  : screenHeight * 0.9;

              final currentMonth = DateFormat('MMMM yyyy')
                  .format(dateTaskController.selectedDate.value);

              // Scroll to the current date
              WidgetsBinding.instance.addPostFrameCallback((_) {
                scrollToCurrentDate();
              });

              return SingleChildScrollView(
                child: Container(
                  height: screenHeight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.only(left: 14.0),
                        child: Text(
                          currentMonth,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'poppins',
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: categoryHeight * 0.28,
                        child: Obx(() {
                          return ListView.builder(
                            controller: _scrollController,
                            scrollDirection: Axis.horizontal,
                            itemCount: dateTaskController.dates.length,
                            itemBuilder: (context, index) {
                              final date = dateTaskController.dates[index];
                              final isSelected = dateTaskController.isSameDay(
                                dateTaskController.selectedDate.value,
                                date,
                              );
                              final hasTasks = dateTaskController
                                  .getTasksForDate(date)
                                  .isNotEmpty;
                              final weekday = DateFormat('EEEE').format(date);

                              return GestureDetector(
                                onTap: () {
                                  dateTaskController.selectDate(date);
                                  // Update the state to trigger a UI refresh
                                  dateTaskController.update();
                                },
                                child: Container(
                                  width: categoryWidth * 0.3,
                                  margin: EdgeInsets.symmetric(horizontal: 8.0),
                                  decoration: BoxDecoration(
                                    color: dateTaskController.isSameDay(
                                            dateTaskController
                                                .selectedDate.value,
                                            date)
                                        ? Colors
                                            .green // Change container color when selected
                                        : hasTasks
                                            ? taskDateColor
                                            : noTaskDateColor, // Set color based on tasks
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: dateTaskController.isSameDay(
                                              dateTaskController
                                                  .selectedDate.value,
                                              date)
                                          ? Colors
                                              .deepOrange // Highlight border color when selected
                                          : Colors.black,
                                      width: 2,
                                    ),
                                  ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${date.day}",
                                          style: TextStyle(
                                            color: dateTaskController.isSameDay(
                                                    dateTaskController
                                                        .selectedDate.value,
                                                    date)
                                                ? Colors
                                                    .white // Change text color when selected
                                                : isSelected
                                                    ? Colors.white
                                                    : Colors.blue.shade900,
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          weekday.substring(0, 3),
                                          style: TextStyle(
                                            color: dateTaskController.isSameDay(
                                                    dateTaskController
                                                        .selectedDate.value,
                                                    date)
                                                ? Colors
                                                    .white // Change text color when selected
                                                : isSelected
                                                    ? Colors.white
                                                    : Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );

                              //   GestureDetector(
                              //   onTap: () {
                              //     dateTaskController.selectDate(date);
                              //   },
                              //   child: Container(
                              //     width: categoryWidth * 0.3,
                              //     margin: EdgeInsets.symmetric(horizontal: 8.0),
                              //     decoration: BoxDecoration(
                              //       color: hasTasks
                              //           ? taskDateColor
                              //           : noTaskDateColor, // Set color based on tasks
                              //       borderRadius: BorderRadius.circular(10),
                              //       border: isSelected
                              //           ? Border.all(
                              //               color: Colors
                              //                   .red, // Highlight border in green
                              //               width: 2)
                              //           : Border.all(
                              //               color: Colors.black, width: 0),
                              //     ),
                              //     child: Center(
                              //       child: Column(
                              //         mainAxisAlignment:
                              //             MainAxisAlignment.center,
                              //         children: [
                              //           Text(
                              //             "${date.day}",
                              //             style: TextStyle(
                              //               color: isSelected
                              //                   ? Colors.white
                              //                   : Colors.blue.shade900,
                              //               fontSize: 18,
                              //             ),
                              //           ),
                              //           Text(
                              //             weekday.substring(0, 3),
                              //             style: TextStyle(
                              //               color: isSelected
                              //                   ? Colors.white
                              //                   : Colors.black,
                              //               fontSize: 14,
                              //             ),
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //   ),
                              // );
                            },
                          );
                        }),
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        child: Obx(() {
                          final tasks = dateTaskController.getTasksForDate(
                              dateTaskController.selectedDate.value);

                          if (tasks.isEmpty) {
                            return Center(
                                child: Text('No tasks for this date'));
                          }

                          return ListView.builder(
                            itemCount: tasks.length,
                            itemBuilder: (context, index) {
                              final task = tasks[index];
                              return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(14.0, 0, 14, 14),
                                child: Card(
                                  clipBehavior: Clip.antiAlias,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 2,
                                  child: Container(
                                    height: taskListHeight * 0.5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          color: colors[index % colors.length],
                                          width: imageWidth2 * 0.1,
                                          height: taskListHeight * 0.3,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Text(
                                              task,
                                              style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void scrollToCurrentDate() {
    final currentDate = dateTaskController.selectedDate.value;
    final currentIndex = dateTaskController.dates.indexWhere(
      (date) => dateTaskController.isSameDay(currentDate, date),
    );

    if (currentIndex != -1) {
      _scrollController.animateTo(
        currentIndex * 80.0, // Adjust this value to control the scroll offset
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}
