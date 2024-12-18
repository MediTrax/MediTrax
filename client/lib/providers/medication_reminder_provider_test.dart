// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';
// import 'package:meditrax/models/medication_reminder.dart';
// import 'package:meditrax/providers/medication_reminder_provider.dart';

// final _mockClient = GraphQLClient(
//   link: HttpLink(''),
//   cache: GraphQLCache(),
// );

// class MedicationReminderNotifierTest extends MedicationReminderNotifier {
//   MedicationReminderNotifierTest() : super(_mockClient);

//   @override
//   Future<void> fetchReminders() async {
//     state = const AsyncValue.loading();
    
//     await Future.delayed(const Duration(milliseconds: 500));
    
//     final reminders = [
//       MedicationReminder(
//         id: "test_reminder_1",
//         medicationId: "test_med_1",
//         userId: "test_user",
//         reminderTime: DateTime.now().add(const Duration(hours: 1)),
//         isTaken: false,
//         createdAt: DateTime.now(),
//       ),
//       MedicationReminder(
//         id: "test_reminder_2",
//         medicationId: "test_med_2",
//         userId: "test_user",
//         reminderTime: DateTime.now().add(const Duration(hours: 2)),
//         isTaken: true,
//         createdAt: DateTime.now(),
//       ),
//     ];

//     state = AsyncValue.data(reminders);
//   }

//   @override
//   Future<bool> addReminder({
//     required String medicationId,
//     required String reminderTime,
//     String? frequency,
//     int? intervalDays,
//     String? dayOfWeek,
//   }) async {
//     try {
//       // Validate inputs
//       if (medicationId.isEmpty) {
//         print('Error: MedicationId cannot be empty');
//         return false;
//       }

//       // Validate reminder time
//       DateTime? parsedTime;
//       try {
//         parsedTime = DateTime.parse(reminderTime);
//         if (parsedTime.isBefore(DateTime.now())) {
//           print('Error: Reminder time cannot be in the past');
//           return false;
//         }
//       } catch (e) {
//         print('Error: Invalid reminder time format');
//         return false;
//       }

//       await Future.delayed(const Duration(milliseconds: 500));

//       final newReminder = MedicationReminder(
//         id: "new_test_reminder_${DateTime.now().millisecondsSinceEpoch}",
//         medicationId: medicationId,
//         userId: "test_user",
//         reminderTime: parsedTime,
//         isTaken: false,
//         createdAt: DateTime.now(),
//       );

//       state.whenData((reminders) {
//         state = AsyncValue.data([...reminders, newReminder]);
//       });

//       return true;
//     } catch (e) {
//       print('Error in addReminder: $e');
//       return false;
//     }
//   }

//   @override
//   Future<bool> updateReminder({
//     required String reminderId,
//     required String reminderTime,
//     required bool isTaken,
//   }) async {
//     try {
//       // Validate inputs
//       if (reminderId.isEmpty) {
//         print('Error: ReminderId cannot be empty');
//         return false;
//       }

//       // Check if reminder exists
//       bool exists = false;
//       state.whenData((reminders) {
//         exists = reminders.any((rem) => rem.id == reminderId);
//       });

//       if (!exists) {
//         print('Error: Reminder not found');
//         return false;
//       }

//       // Validate reminder time
//       DateTime? parsedTime;
//       try {
//         parsedTime = DateTime.parse(reminderTime);
//       } catch (e) {
//         print('Error: Invalid reminder time format');
//         return false;
//       }

//       await Future.delayed(const Duration(milliseconds: 500));

//       state.whenData((reminders) {
//         final index = reminders.indexWhere((rem) => rem.id == reminderId);
//         if (index != -1) {
//           final oldReminder = reminders[index];
//           final updatedReminder = MedicationReminder(
//             id: oldReminder.id,
//             medicationId: oldReminder.medicationId,
//             userId: oldReminder.userId,
//             reminderTime: parsedTime!,
//             isTaken: isTaken,
//             createdAt: oldReminder.createdAt,
//           );
          
//           final updatedList = [...reminders];
//           updatedList[index] = updatedReminder;
//           state = AsyncValue.data(updatedList);
//         }
//       });

//       return true;
//     } catch (e) {
//       print('Error in updateReminder: $e');
//       return false;
//     }
//   }

//   @override
//   Future<bool> deleteReminder(String reminderId) async {
//     try {
//       if (reminderId.isEmpty) {
//         print('Error: ReminderId cannot be empty');
//         return false;
//       }

//       // Check if reminder exists
//       bool exists = false;
//       state.whenData((reminders) {
//         exists = reminders.any((rem) => rem.id == reminderId);
//       });

//       if (!exists) {
//         print('Error: Reminder not found');
//         return false;
//       }

//       await Future.delayed(const Duration(milliseconds: 500));

//       state.whenData((reminders) {
//         final updatedList = reminders.where((rem) => rem.id != reminderId).toList();
//         state = AsyncValue.data(updatedList);
//       });

//       return true;
//     } catch (e) {
//       print('Error in deleteReminder: $e');
//       return false;
//     }
//   }

//   @override
//   Future<bool> toggleReminderStatus(String reminderId, bool isTaken) async {
//     try {
//       if (reminderId.isEmpty) {
//         print('Error: ReminderId cannot be empty');
//         return false;
//       }

//       // Check if reminder exists
//       bool exists = false;
//       state.whenData((reminders) {
//         exists = reminders.any((rem) => rem.id == reminderId);
//       });

//       if (!exists) {
//         print('Error: Reminder not found');
//         return false;
//       }

//       await Future.delayed(const Duration(milliseconds: 500));

//       state.whenData((reminders) {
//         final updatedList = reminders.map((reminder) {
//           if (reminder.id == reminderId) {
//             return MedicationReminder(
//               id: reminder.id,
//               medicationId: reminder.medicationId,
//               userId: reminder.userId,
//               reminderTime: reminder.reminderTime,
//               isTaken: isTaken,
//               createdAt: reminder.createdAt,
//             );
//           }
//           return reminder;
//         }).toList();
//         state = AsyncValue.data(updatedList);
//       });

//       return true;
//     } catch (e) {
//       print('Error in toggleReminderStatus: $e');
//       return false;
//     }
//   }
// }

// // Test provider
// final medicationReminderTestProvider = StateNotifierProvider<MedicationReminderNotifierTest, AsyncValue<List<MedicationReminder>>>((ref) {
//   return MedicationReminderNotifierTest();
// });
