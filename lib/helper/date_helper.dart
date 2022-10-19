import 'dart:developer';

import 'package:intl/intl.dart';

String displayTimeAgoFromTimestamp(int time) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(time);
  String result = '';
  final DateFormat formatter = DateFormat("d - MMM - y");
  result = formatter.format(date);
  return result;
}

String displayTimeAndDateTimestamp(int time) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(time);
  String result = '';
  final DateFormat formatter = DateFormat("dd-MM – hh:mm a");
  result = formatter.format(date);
  return result;
}

int dateFormat(int time) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(time);
  String result = '';
  final DateFormat formatter = DateFormat("dd-MM–yyyy");
  result = formatter.format(date);
  DateTime parseDate = DateFormat("dd-MM–yyyy").parse(result);
  return parseDate.millisecondsSinceEpoch;
}

int dateInMillisecondsSinceEpoch(DateTime date, String format) {
  String result = '';
  final DateFormat formatter = DateFormat(format);
  result = formatter.format(date);
  DateTime parseDate = DateFormat(format).parse(result);
  log("parseDate $parseDate");
  return parseDate.millisecondsSinceEpoch;
}

String displayDayAndDateTimestamp(int time) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(time);
  String result = '';
  final DateFormat formatter = DateFormat("EEEE,MMMM d, hh:mm a");
  result = formatter.format(date);
  return result;
}

String displayMonthAndDateTimestamp(int time) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(time);
  String result = '';
  final DateFormat formatter = DateFormat("MMMM d, hh:mm a");
  result = formatter.format(date);
  return result;
}

// DateFormats(String? date, String format) {
//   String result = '';
//   final DateFormat formatter = DateFormat(format);
//   result = formatter.format(DateTime.parse("${date}"));
//   return result;
// }

DateFormats(DateTime? date, String format) {
  String result = '';
  final DateFormat formatter = DateFormat(format);
  result = formatter.format(
    date ?? DateTime.now(),
  );
  return result;
}
