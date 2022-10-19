import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:luso_american_financial/helper/date_helper.dart';
import 'package:luso_american_financial/model/calendar_model.dart';
import 'package:luso_american_financial/modules/calendar/service/calendar_servicec.dart';
import 'package:luso_american_financial/utils/app_colors.dart';
import 'package:luso_american_financial/utils/assets_path.dart';
import 'package:luso_american_financial/utils/size_utils.dart';
import 'package:luso_american_financial/utils/strings_utils.dart';
import 'package:luso_american_financial/utils/styles.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:luso_american_financial/model/schedule_unavailable_model.dart'
    as time_model;

class CalendarScreenController extends GetxController  with SingleGetTickerProviderMixin {
  late TabController tabController;

List expandIndex = [];

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);


    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  DateRangePickerController controller = DateRangePickerController();
  final DateRangePickerController greenController = DateRangePickerController();
  RxBool isViewChange = false.obs;
  RxBool isSelectionChange = false.obs;

  DateTime dateRangePicker = DateTime.now();
  RxBool messageSizeButton = false.obs;
  RxList<time_model.UnAvailableDateTimeModel> unAvailableDateTimeModel =
      <time_model.UnAvailableDateTimeModel>[].obs;
  Rx<DateTimeRange> dateRange = DateTimeRange(
    start:
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
    end:
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
  ).obs;
  Rx<DateTimeRange> monthChangeFirstAndLAstDateRange = DateTimeRange(
    start:
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
    end:
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
  ).obs;
  RxList<String> availableDateTimeModelStringList = <String>[].obs;
  RxList<String> unavailableDateTimeModelStringList = <String>[].obs;
  RxInt daysInMonth = 0.obs;

  TextEditingController searchCalendarController = TextEditingController();
  RxString headerString = ''.obs;
  RxList<CalendarModel> calendarModal = <CalendarModel>[].obs;
  RxList<CalendarModel> SearchResult = <CalendarModel>[].obs;
  RxBool isLoading = false.obs;
  List<DateTime> dateAll = <DateTime>[];

  // @override
  // void onInit() {
  //   calendarData();
  //   super.onInit();
  // }

  Future scheduleGreenActivity(
      {required int fromDate, required int toDate}) async {
    try {
      if (calendarModal.value != null) {
        List<PickerDateRange> scheduledDetailsListGreen = <PickerDateRange>[];
        for (var element in calendarModal.value) {
          DateTime date1 = DateTime.parse(element.date.toString());
          DateTime date2 = DateTime.parse(element.date.toString());
          scheduledDetailsListGreen.add(
            PickerDateRange(date1, date2),
          );
          availableDateTimeModelStringList
              .add(DateFormats(element.date, "dd-MM–yyyy'"));
          availableDateTimeModelStringList
              .add(DateFormats(element.date, "dd-MM–yyyy'"));
        }
        greenController.selectedRanges = scheduledDetailsListGreen;
      }
    } catch (e) {
      rethrow;
    }
  }

  Widget days(DateRangePickerCellDetails cellDetails) {
    DateTime date = cellDetails.date;
    DateTime selectDate = date;

    print("date$date");
    print("selectDate$selectDate");
    if (controller.view == DateRangePickerView.month) {
      return Center(
        child: Text(
          cellDetails.date.day.toString(),
          style: TextStyle(
            color: AppColors.darkBlue,
            fontFamily: AssetsPath.roboto,
            fontWeight: FontWeight.w700,
            fontSize: SizeUtils.fSize_16(),
          ),
        ),
      );
    } else if (controller.view == DateRangePickerView.month) {
      return Center(
        child: Text(
          DateFormat.d().format(selectDate).toString(),
          style: TextStyle(
            color: AppColors.white,
            fontFamily: AssetsPath.roboto,
            fontWeight: FontWeight.w700,
            fontSize: SizeUtils.fSize_16(),
          ),
        ),
      );
    } else if (controller.view == DateRangePickerView.year) {
      return Center(
        child: Text(
          DateFormat.MMMM().format(date).toString(),
          style: TextStyle(
              color: AppColors.darkBlue,
              fontFamily: AssetsPath.roboto,
              fontWeight: FontWeight.w700,
              fontSize: SizeUtils.fSize_16()),
        ),
      );
    } else if (controller.view == DateRangePickerView.decade) {
      return Center(
          child: Text(cellDetails.date.year.toString(),
              style: TextStyle(
                  color: AppColors.darkBlue,
                  fontFamily: AssetsPath.roboto,
                  fontWeight: FontWeight.w700,
                  fontSize: SizeUtils.fSize_16()),
              textAlign: TextAlign.center));
    } else {
      final int yearValue = (cellDetails.date.year ~/ 10) * 10;
      return Center(
        child: Text(
          yearValue.toString() + ' - ' + (yearValue + 10).toString(),
          style: TextStyle(
              color: AppColors.white,
              fontFamily: AssetsPath.roboto,
              fontWeight: FontWeight.w700,
              fontSize: SizeUtils.fSize_16()),
        ),
      );
    }
  }

  void viewChanged(DateRangePickerViewChangedArgs args) {
    DateTime firstDayOfMonth = DateTime(args.visibleDateRange.startDate!.year,
        args.visibleDateRange.startDate!.month, 1);
    headerString.value =
        DateFormat('MMMM yyyy').format(firstDayOfMonth).toString();
    dateRange.value = DateTimeRange(
        start: DateTime(
            args.visibleDateRange.startDate!.year,
            args.visibleDateRange.startDate!.month,
            args.visibleDateRange.startDate!.day),
        end: DateTime(
            args.visibleDateRange.startDate!.year,
            args.visibleDateRange.startDate!.month,
            args.visibleDateRange.startDate!.day));
    monthChangeFirstAndLAstDateRange.value = DateTimeRange(
        start: DateTime(
            args.visibleDateRange.startDate!.year,
            args.visibleDateRange.startDate!.month,
            args.visibleDateRange.startDate!.day),
        end: DateTime(
            args.visibleDateRange.endDate!.year,
            args.visibleDateRange.endDate!.month,
            args.visibleDateRange.endDate!.day));
    isViewChange.value = true;
    unAvailableDateTimeModel.clear();
    SchedulerBinding.instance.addPostFrameCallback((duration) async {
      unavailableDateTimeModelStringList.clear();
      availableDateTimeModelStringList.clear();
      daysInMonth.value = (((args.visibleDateRange.endDate
                  ?.difference(
                      args.visibleDateRange.startDate ?? DateTime.now())
                  .inDays) ??
              0) +
          1);
      await scheduleGreenActivity(
          fromDate:
              firstDate(args.visibleDateRange.startDate ?? DateTime.now()),
          toDate: lastDate(args.visibleDateRange.endDate ?? DateTime.now()));
      isViewChange.value = false;
    });
  }

  firstDate(DateTime selectionModeDateTime) {
    DateTime firstDayOfMonth =
        DateTime(selectionModeDateTime.year, selectionModeDateTime.month, 1);
    var last =
        dateInMillisecondsSinceEpoch(firstDayOfMonth, StringsUtils.ddMmYy);
    print("deleteSchedule ----firstDate$last");
    return last;
  }

  lastDate(DateTime selectionModeDateTime) {
    DateTime lastDayOfMonth = DateTime(
        selectionModeDateTime.year, selectionModeDateTime.month + 1, 0);
    var first =
        dateInMillisecondsSinceEpoch(lastDayOfMonth, StringsUtils.ddMmYy);
    print("deleteSchedule ----firstDate$first");
    return first;
  }

  Future calendarData() async {
    try {
      isLoading.value = true;
      calendarModal.value = await CalendarService.calendarEvents();
      log("calendarModal.value:- ${calendarModal.value.length}");
      calendarModal.forEach((element) {
        if (element.date != null && element.date != '') {
          dateAll.add(DateTime.parse(element.date.toString()));
        }
      });
      isLoading.value = false;
    } catch (e, st) {
      log("e:- $e,st:-$st");
    } finally {
      isLoading.value = false;
    }
  }

// void selectionChanged(DateRangePickerSelectionChangedArgs args) {
//   SchedulerBinding.instance.addPostFrameCallback((duration) {
//     // setState(() {
//     //   _date=DateFormat('dd, MMMM yyyy').format(args.value).toString();
//     // });
//   });
// }
}
