import 'package:flutter/material.dart';

Future<DateTime?>? getSelectedDate(context) async {
  final date = await showDatePicker(
    context: context,
    firstDate: DateTime.now(),
    lastDate: DateTime(3030),
  );

  final time = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );

  if (date == null || time == null) return null;

  return DateTime(date.year, date.month, date.day, time.hour, time.minute);
}