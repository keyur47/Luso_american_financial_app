import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:luso_american_financial/utils/app_colors.dart';
import 'package:luso_american_financial/utils/size_utils.dart';

import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class MultiRangeSelection extends CustomPainter {
  MultiRangeSelection(this.date, this.redController, this.greenController);

  final DateTime date;
  final DateRangePickerController redController;
  final DateRangePickerController greenController;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.clipRect(Rect.fromLTWH(0, 0, size.width, size.height));
    setColor(redController.selectedRanges, AppColors.red[200]!, canvas, size, date);
    setColor(greenController.selectedRanges, AppColors.green, canvas, size, date);
  }

  @override
  bool shouldRepaint(MultiRangeSelection oldDelegate) {
    return true;
  }
}

class RangeSelection extends CustomPainter {
  RangeSelection(this.date, this.redController, this.greenController);

  final DateTime date;
  final DateRangePickerController redController;
  final DateRangePickerController greenController;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.clipRect(Rect.fromLTWH(0, 0, size.width, size.height));

    setColor(redController.selectedRanges, AppColors.red[200]!, canvas, size, date);
    setColor(greenController.selectedRanges, AppColors.green, canvas, size, date);
  }

  @override
  bool shouldRepaint(RangeSelection oldDelegate) {
    return true;
  }
}

class SingleSelection extends CustomPainter {
  SingleSelection(this.date, this.controller, this.greenController);

  final DateTime date;
  final DateRangePickerController controller;
  final DateRangePickerController greenController;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.clipRect(Rect.fromLTWH(0, 0, size.width, size.height));
    setColor(controller.selectedRanges, AppColors.red[200]!, canvas, size, date);
    setColor(greenController.selectedRanges, AppColors.darkBlue, canvas, size, date);
  }

  @override
  bool shouldRepaint(SingleSelection oldDelegate) {
    return true;
  }
}

bool isSameDate(DateTime start, DateTime end) {
  return start.year == end.year && start.month == end.month && start.day == end.day;
}

Future<void> setColor(List<PickerDateRange>? selectedRanges, Color selectedColor, Canvas canvas, Size size, date) async {
  // bool isSelectedDate = false;
  double radius = SizeUtils.isTablet() ? 53 : 26;
  if (selectedRanges != null) {
    for (int i = 0; i < selectedRanges.length; i++) {
      PickerDateRange range = selectedRanges[i];
      DateTime startDate = range.startDate!;
      DateTime endDate = range.endDate ?? startDate;
      if (isSameDate(startDate, endDate)) {
        if (isSameDate(startDate, date)) {
          log("object");
          // isSelectedDate = true;
          double x = size.width / 2;
          double y = size.height / 2;
          // double radius = 28;
          // double radius = x > y ? y : x;
          // radius = radius - 1;
          canvas.drawCircle(Offset(x, y), radius, Paint()..color = selectedColor);
          break;
        }
      } else if (isSameDate(startDate, date)) {
        // isSelectedDate = true;
        double x = size.width / 2;
        double y = size.height / 2;
        // double radius = 28;
        // double radius = x > y ? y : x;
        // radius = radius - 1;
        canvas.drawCircle(Offset(x, y), radius, Paint()..color = selectedColor);
        // canvas.drawRect(Rect.fromLTRB(x, y - radius, size.width, y + radius), Paint()..color = selectedColor);
        break;
      } else if (isSameDate(endDate, date)) {
        // isSelectedDate = true;
        double x = size.width / 2;
        double y = size.height / 2;
        // double radius = 28;
        // double radius = x > y ? y : x;
        // radius = radius - 1;
        canvas.drawCircle(Offset(x, y), radius, Paint()..color = selectedColor);
        // canvas.drawRect(Rect.fromLTRB(x, y - radius, 0, y + radius), Paint()..color = selectedColor);
        break;
      } else if (startDate.isBefore(date) && endDate.isAfter(date)) {
        // double x = size.width / 2;
        double y = size.height / 2;
        // double radius = 28;
        // double radius = x > y ? y : x;
        // radius = radius - 1;
        canvas.drawRect(Rect.fromLTRB(0, y - radius, size.width, y + radius), Paint()..color = selectedColor);
        break;
      }
    }
  }
}
