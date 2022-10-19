import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:intl/intl.dart';
import 'package:luso_american_financial/helper/date_helper.dart';
import 'package:luso_american_financial/helper/loading_helper.dart';
import 'package:luso_american_financial/modules/calendar/controller/calendar_screen_controller.dart';
import 'package:luso_american_financial/modules/dashbord/presentation/dashbord_screen.dart';
import 'package:luso_american_financial/utils/app_colors.dart';
import 'package:luso_american_financial/utils/assets_path.dart';
import 'package:luso_american_financial/utils/navigation_utils/navigation.dart';
import 'package:luso_american_financial/utils/navigation_utils/routes.dart';
import 'package:luso_american_financial/utils/size_utils.dart';
import 'package:luso_american_financial/utils/strings_utils.dart';
import 'package:luso_american_financial/utils/styles.dart';
import 'package:luso_american_financial/widgets/app_text.dart';
import 'package:luso_american_financial/widgets/custom_text_field.dart';
import 'package:shimmer/shimmer.dart';

import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'multi_range_selection.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final CalendarScreenController calendarScreenController = Get.find();
  String _date = DateFormat('dd, MMMM yyyy').format(DateTime.now()).toString();
  List screen = [
    DashBordScreen(),
    DashBordScreen(),
  ];

  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    calendarScreenController.calendarData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double cellWidth = width / 9;
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: SizeUtils.horizontalBlockSize * 25,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeUtils.horizontalBlockSize * 10),
              child: CustomTextField(
                focusedColor: Colors.transparent,
                enableColor: Colors.transparent,
                disabledColor: Colors.transparent,
                isPrefixIcon: true,
                cursorColor: Colors.transparent,
                controller: calendarScreenController.searchCalendarController,
                fillColor: AppColors.white,
                hintText: StringsUtils.search,
                hintTextColor: AppColors.grey,
                onChanged: (value) {
                  value =
                      calendarScreenController.searchCalendarController.text;
                  print(
                      'notificationsScreenController.FindAgentController.text--->onchange--->${calendarScreenController.searchCalendarController.text}');

                  calendarScreenController.SearchResult.clear();
                  calendarScreenController.SearchResult.value =
                      calendarScreenController.calendarModal.where((e) {
                    return (e.title?.rendered ?? '').contains(
                        calendarScreenController.searchCalendarController.text);
                  }).toList();
                  setState(() {});
                  print(
                      'object--onChange-->main list--->${calendarScreenController.calendarModal.length}');
                  print(
                      'object--onChange-->search list--->${calendarScreenController.SearchResult.length}');
                },
                onFieldSubmitted: (value) {
                  print(
                      'findAgentScreenController.FindAgentController.text--->onTextFieldSubmit--->${calendarScreenController.searchCalendarController.text}');

                  calendarScreenController.SearchResult.clear();
                  calendarScreenController.SearchResult.value =
                      calendarScreenController.calendarModal.where((e) {
                    return (e.title?.rendered ?? '').contains(
                        calendarScreenController.searchCalendarController.text);
                  }).toList();
                  setState(() {});
                  print(
                      'object--onTextFieldSubmit-->main list--->${calendarScreenController.calendarModal.length}');
                  print(
                      'object--onTextFieldSubmit-->search list--->${calendarScreenController.SearchResult.length}');
                },
              ),
            ),
            SizedBox(
              height: SizeUtils.horizontalBlockSize * 11,
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(SizeUtils.horizontalBlockSize * 10),
                  topRight: Radius.circular(SizeUtils.horizontalBlockSize * 10),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: SizeUtils.horizontalBlockSize * 8,
                  horizontal: SizeUtils.horizontalBlockSize * 5,
                ),
                child: Column(
                  children: [
                    AppText(
                      text: StringsUtils.eventCalendar,
                      fontSize: SizeUtils.fSize_15(),
                      fontWeight: FontWeight.w800,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: SizeUtils.horizontalBlockSize * 2.5,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.darkBlue,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeUtils.horizontalBlockSize * 13,
                              vertical: SizeUtils.horizontalBlockSize * 0.5),
                          child: const AppText(
                            text: "",
                            fontSize: 0,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: SizeUtils.horizontalBlockSize * 4,
                          left: SizeUtils.horizontalBlockSize * 1,
                          right: SizeUtils.horizontalBlockSize * 1),
                      child: AppText(
                        text: StringsUtils.eventCalendarDetail,
                        fontSize: SizeUtils.fSize_12(),
                        fontWeight: FontWeight.w500,
                        height: 1.3,
                        wordSpacing: 1,
                        color: AppColors.darkBlue.withOpacity(0.4),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: SizeUtils.horizontalBlockSize * 4,
                          top: SizeUtils.horizontalBlockSize * 3,
                          right: SizeUtils.horizontalBlockSize * 2),
                      child: Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                calendarScreenController.controller.backward!();
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: SizeUtils.horizontalBlockSize * 1.5),
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                size: SizeUtils.horizontalBlockSize * 5,
                                color: AppColors.darkBlue.withOpacity(0.4),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: SizeUtils.horizontalBlockSize * 4,
                          ),
                          AppText(
                            text: calendarScreenController.headerString.value,
                            textAlign: TextAlign.center,
                            fontSize: SizeUtils.fSize_15(),
                            color: AppColors.black,
                            height: 1.8,
                            fontWeight: FontWeight.w500,
                          ),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.only(
                                top: SizeUtils.horizontalBlockSize * 1.3),
                            child: Stack(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            SizeUtils.horizontalBlockSize * 5),
                                        border: Border.all(
                                            width: 2,
                                            color: AppColors.darkBlue)),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              SizeUtils.horizontalBlockSize *
                                                  4.8,
                                          vertical:
                                              SizeUtils.horizontalBlockSize *
                                                  1.6),
                                      child: const AppText(
                                        text: "",
                                        fontSize: 0,
                                      ),
                                    )),
                                Positioned(
                                  left: SizeUtils.horizontalBlockSize * 1.6,
                                  top: SizeUtils.horizontalBlockSize * 1.3,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.arrow_back_ios,
                                        size: 8,
                                      ),
                                      AppText(
                                        text: "Time Zone",
                                        fontSize: SizeUtils.fSize_4(),
                                        fontWeight: FontWeight.w600,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: SizeUtils.horizontalBlockSize * 5,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: SizeUtils.horizontalBlockSize * 1.5),
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    calendarScreenController
                                        .controller.backward!();
                                  });
                                },
                                child: Image.asset(
                                  AssetsPath.leftCalenderIcon,
                                  // width: cellWidth,
                                  height: 30,
                                )),
                          ),
                          SizedBox(
                            width: SizeUtils.horizontalBlockSize * 1,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: SizeUtils.horizontalBlockSize * 1),
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    calendarScreenController
                                        .controller.forward!();
                                  });
                                },
                                child: Image.asset(
                                  AssetsPath.rightCalenderIcon,
                                  // width: cellWidth,
                                  height: cellWidth,
                                  scale: 1,
                                )),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeUtils.horizontalBlockSize * 5,
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: SfDateRangePicker(
                        // onSelectionChanged: ,
                        // selectionMode: DateRangePickerSelectionMode.single,
                        // selectableDayPredicate: (DateTime a) {
                        //   ///multi range selection change disable
                        //   return true;
                        // },
                        controller: calendarScreenController.controller,
                        onViewChanged: viewChanged,
                        headerHeight: 0,
                        selectionColor: AppColors.darkBlue,
                        selectionShape: DateRangePickerSelectionShape.rectangle,
                        selectionTextStyle: TextStyle(
                            color: AppColors.white,
                            fontFamily: AssetsPath.roboto,
                            fontWeight: FontWeight.w700,
                            fontSize: SizeUtils.fSize_16()),
                        view: DateRangePickerView.month,
                        initialSelectedDate: DateTime.now(),
                        initialDisplayDate: DateTime.now(),
                        monthCellStyle: DateRangePickerMonthCellStyle(
                          specialDatesDecoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.darkBlue,
                          ),
                          textStyle: TextStyle(
                              fontFamily: AssetsPath.roboto,
                              color: AppColors.darkBlue,
                              fontWeight: FontWeight.w700,
                              fontSize: SizeUtils.fSize_16()),
                          specialDatesTextStyle: TextStyle(
                              color: AppColors.white,
                              fontFamily: AssetsPath.roboto,
                              fontWeight: FontWeight.w700,
                              fontSize: SizeUtils.fSize_16()),
                          cellDecoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          todayTextStyle: TextStyle(
                              color: AppColors.darkBlue,
                              fontFamily: AssetsPath.roboto,
                              fontWeight: FontWeight.w700,
                              fontSize: SizeUtils.fSize_16()),
                        ),
                        monthViewSettings: DateRangePickerMonthViewSettings(
                            dayFormat: 'EE',
                            weekendDays: const [7, 6],
                            specialDates: calendarScreenController.dateAll,
                            // specialDates: [
                            //   DateTime(2022, 09, 17),
                            //   DateTime(2022, 10, 05),
                            //   DateTime(2022, 10, 1),
                            //   DateTime(2022, 11, 8),
                            //   DateTime(2022, 10, 23),
                            //   DateTime(2022, 10, 27),
                            // ],
                            showTrailingAndLeadingDates: false,
                            viewHeaderStyle: DateRangePickerViewHeaderStyle(
                                textStyle: TextStyle(
                                    fontFamily: AssetsPath.roboto,
                                    color: AppColors.darkBlue,
                                    fontWeight: FontWeight.w700,
                                    fontSize: SizeUtils.fSize_16()),
                                backgroundColor: AppColors.white)),
                        minDate: DateTime(2022, 1, 1),
                        maxDate: DateTime(2044, 1, 1),
                        allowViewNavigation: true,
                      ),
                    ),
                    // child: SfDateRangePicker(
                    //   controller: calendarScreenController.controller,
                    //   onViewChanged: calendarScreenController.viewChanged,
                    //   headerHeight: 0,
                    //   selectionColor: Colors.transparent,
                    //   selectableDayPredicate: (DateTime a) {
                    //     ///multi range selection change disable
                    //     return true;
                    //   },
                    //   enablePastDates: false,
                    //   showNavigationArrow: true,
                    //   selectionShape: DateRangePickerSelectionShape.rectangle,
                    //   monthCellStyle: DateRangePickerMonthCellStyle(
                    //     blackoutDateTextStyle: TextStyle(
                    //         color: AppColors.white, fontFamily: AssetsPath.roboto, fontWeight: FontWeight.w700, fontSize: SizeUtils.fSize_16()),
                    //     textStyle: TextStyle(
                    //         color: AppColors.white, fontFamily: AssetsPath.roboto, fontWeight: FontWeight.w700, fontSize: SizeUtils.fSize_16()),
                    //   ),
                    //   selectionTextStyle: TextStyle(
                    //       color: AppColors.white, fontFamily: AssetsPath.roboto, fontWeight: FontWeight.w700, fontSize: SizeUtils.fSize_16()),
                    //   view: DateRangePickerView.month,
                    //   initialSelectedDate: DateTime.now(),
                    //   initialDisplayDate: DateTime.now(),
                    //   monthViewSettings: DateRangePickerMonthViewSettings(
                    //     dayFormat: 'EE',
                    //     weekendDays: const [7, 6],
                    //     specialDates: calendarScreenController.dateAll,
                    //     showTrailingAndLeadingDates: false,
                    //     viewHeaderStyle: DateRangePickerViewHeaderStyle(
                    //       textStyle: TextStyle(
                    //         fontFamily: AssetsPath.roboto,
                    //         color: AppColors.darkBlue,
                    //         fontWeight: FontWeight.w700,
                    //         fontSize: SizeUtils.fSize_16(),
                    //       ),
                    //       backgroundColor: AppColors.white,
                    //     ),
                    //   ),
                    //   minDate: DateTime(2022, 1, 1),
                    //   maxDate: DateTime(2044, 1, 1),
                    //   allowViewNavigation: true,
                    //   cellBuilder: (BuildContext context, DateRangePickerCellDetails cellDetails) {
                    //     return Padding(
                    //       padding: EdgeInsets.only(
                    //         top: SizeUtils.horizontalBlockSize * 2.8425,
                    //         right: SizeUtils.horizontalBlockSize * 2.8425,
                    //       ),
                    //       child: CustomPaint(
                    //         child: calendarScreenController.days(cellDetails),
                    //         painter:
                    //             SingleSelection(cellDetails.date, calendarScreenController.controller, calendarScreenController.greenController),
                    //         size: Size(cellDetails.bounds.width, cellDetails.bounds.height),
                    //       ),
                    //     );
                    //   },
                    // ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeUtils.horizontalBlockSize * 3,
                      ),
                      child: Obx(
                        () => calendarScreenController.isLoading.value
                            ? Shimmer.fromColors(
                                baseColor: Colors.grey.withOpacity(0.3),
                                highlightColor: Colors.grey.withOpacity(0.1),
                                child: ListView.separated(
                                  itemCount: 30,
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return isLoadingEventBox();
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return Divider(
                                      height: SizeUtils.horizontalBlockSize * 5,
                                      color: Colors.transparent,
                                      thickness: 1,
                                    );
                                  },
                                ),
                              )
                            : calendarScreenController.searchCalendarController
                                        .text.isNotEmpty &&
                                    calendarScreenController
                                        .SearchResult.isEmpty
                                ? Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                            0,
                                            50,
                                            0,
                                            30,
                                          ),
                                          child: Text(
                                            'No result found',
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                : calendarScreenController
                                            .calendarModal.length ==
                                        0
                                    ? Text("No Data Available")
                                    : ListView.separated(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: calendarScreenController
                                                .searchCalendarController
                                                .text
                                                .isNotEmpty
                                            ? calendarScreenController
                                                .SearchResult.length
                                            : calendarScreenController
                                                .calendarModal.length,
                                        itemBuilder: (context, index) {
                                          return LiveEventBox(
                                            title: calendarScreenController
                                                    .searchCalendarController
                                                    .text
                                                    .isNotEmpty
                                                ? calendarScreenController
                                                    .SearchResult[index]
                                                    .title
                                                    ?.rendered
                                                : calendarScreenController
                                                    .calendarModal[index]
                                                    .title
                                                    ?.rendered,
                                            text: calendarScreenController
                                                    .searchCalendarController
                                                    .text
                                                    .isNotEmpty
                                                ? calendarScreenController
                                                    .SearchResult[index]
                                                    .content
                                                    ?.rendered
                                                : calendarScreenController
                                                    .calendarModal[index]
                                                    .content
                                                    ?.rendered,
                                            time1: calendarScreenController
                                                    .searchCalendarController
                                                    .text
                                                    .isNotEmpty
                                                ? DateFormats(
                                                    calendarScreenController
                                                        .SearchResult[index]
                                                        .date,
                                                    "h:mm a",
                                                  )
                                                : DateFormats(
                                                    calendarScreenController
                                                        .calendarModal[index]
                                                        .date,
                                                    "h:mm a"),
                                            time2: calendarScreenController
                                                    .searchCalendarController
                                                    .text
                                                    .isNotEmpty
                                                ? DateFormats(
                                                    calendarScreenController
                                                        .SearchResult[index]
                                                        .modified,
                                                    "h:mm")
                                                : DateFormats(
                                                    calendarScreenController
                                                        .calendarModal[index]
                                                        .modified,
                                                    "h:mm"),
                                            date: calendarScreenController
                                                    .searchCalendarController
                                                    .text
                                                    .isNotEmpty
                                                ? DateFormats(
                                                    calendarScreenController
                                                        .calendarModal[index]
                                                        .date,
                                                    "d")
                                                : DateFormats(
                                                    calendarScreenController
                                                        .calendarModal[index]
                                                        .date,
                                                    "d"),
                                            months: calendarScreenController
                                                    .searchCalendarController
                                                    .text
                                                    .isNotEmpty
                                                ? DateFormats(
                                                    calendarScreenController
                                                        .calendarModal[index]
                                                        .date,
                                                    "MMMM")
                                                : DateFormats(
                                                    calendarScreenController
                                                        .calendarModal[index]
                                                        .date,
                                                    "MMMM",
                                                  ),
                                            index: index,
                                          );
                                        },
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return Divider(
                                            height:
                                                SizeUtils.horizontalBlockSize *
                                                    5,
                                            color: Colors.transparent,
                                            thickness: 1,
                                          );
                                        },
                                      ),
                      ),
                    ),
                    SizedBox(height: SizeUtils.horizontalBlockSize * 15,)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// viewChanged
  void viewChanged(DateRangePickerViewChangedArgs args) {
    DateTime firstDayOfMonth = DateTime(args.visibleDateRange.startDate!.year,
        args.visibleDateRange.startDate!.month, 1);
    calendarScreenController.headerString.value =
        DateFormat('MMMM yyyy').format(firstDayOfMonth).toString();
    SchedulerBinding.instance.addPostFrameCallback((duration) {
      setState(() {});
    });
  }

  // void selectionChanged(DateRangePickerSelectionChangedArgs args) {
  //   SchedulerBinding.instance.addPostFrameCallback((duration) {
  //     setState(() {
  //       List<CalendarModel> scheduledDetailsListGreen = <CalendarModel>[];
  //
  //       for (var element in calendarScreenController.calendarModal.value) {
  //         DateTime date1 = DateTime.fromMillisecondsSinceEpoch(element.fromDate!);
  //         DateTime date2 = DateTime.fromMillisecondsSinceEpoch(element.toDate!);
  //         scheduledDetailsListGreen.add(
  //           PickerDateRange(date1, date2),
  //         );
  //         availableDateTimeModelStringList
  //             .add(displayTimeAndDateTimestamp(element.fromDate ?? 0, StringsUtils.ddMmYyy));
  //         availableDateTimeModelStringList
  //             .add(displayTimeAndDateTimestamp(element.toDate ?? 0, StringsUtils.ddMmYyy));
  //       }
  //       _date = DateFormat('dd, MMMM yyyy').format(args.value).toString();
  //     });
  //   });
  // }

  // /// viewChanged
  // void viewChanged(DateRangePickerViewChangedArgs args) {
  //   DateTime firstDayOfMonth = DateTime(args.visibleDateRange.startDate!.year, args.visibleDateRange.startDate!.month, 1);
  //   calendarScreenController.headerString.value = DateFormat('MMMM yyyy').format(firstDayOfMonth).toString();
  //   SchedulerBinding.instance.addPostFrameCallback((duration) {
  //     setState(() {});
  //   });
  //   await scheduleGreenActivity(
  //       fromDate: firstDate(args.visibleDateRange.startDate ?? DateTime.now()), toDate: lastDate(args.visibleDateRange.endDate ?? DateTime.now()));
  // }

  // void selectionChanged(DateRangePickerSelectionChangedArgs args) {
  //   calendarScreenController.controller.selectedRange = PickerDateRange(
  //     DateTime.now(),
  //     DateTime.now(),
  //   );
  // }

  Widget LiveEventBox(
      {String? title,
      String? text,
      String? time1,
      String? time2,
      String? date,
      String? months,
      required int index}) {
    // print('calendarScreenController.selectedIndex?.value--->${calendarScreenController.expandIndex}');
    // print('calendarScreenController.selectedIndex?.value--->${calendarScreenController.expandIndex.contains(index)}');
    return Column(
      children: [
        Container(
          // height: calendarScreenController.expandIndex.contains(index) ? SizeUtils.horizontalBlockSize * 12.8 : SizeUtils.horizontalBlockSize * 0,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              width: 1,
              color: AppColors.darkBlue.withOpacity(0.2),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              right: SizeUtils.horizontalBlockSize * 3,
              left: SizeUtils.horizontalBlockSize * 2,
              top: SizeUtils.horizontalBlockSize * 1.3,
              bottom: SizeUtils.horizontalBlockSize * 1.3,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: SizeUtils.horizontalBlockSize * 7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        text: "${months}",
                        fontWeight: FontWeight.w300,
                        color: AppColors.darkBlue,
                        maxLines: 1,
                        fontSize: SizeUtils.fSize_12(),
                      ),
                      AppText(
                        text: "$date",
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkBlue,
                        fontSize: SizeUtils.fSize_14(),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: SizeUtils.horizontalBlockSize * 2,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: SizeUtils.horizontalBlockSize * 60,
                        child: AppText(
                          text: parse(title).documentElement!.text,
                          fontWeight: FontWeight.w600,
                          color: AppColors.darkBlue,
                          maxLines: 1,
                          fontSize: SizeUtils.fSize_12(),
                        ),
                      ),
                      SizedBox(
                        height: SizeUtils.horizontalBlockSize * 1,
                      ),
                      Row(
                        children: [
                          AppText(
                            text: "$time1 to ",
                            fontWeight: FontWeight.w300,
                            color: AppColors.darkBlue,
                            fontSize: SizeUtils.fSize_11(),
                          ),
                          AppText(
                            text: "$time2",
                            fontWeight: FontWeight.w300,
                            color: AppColors.darkBlue,
                            fontSize: SizeUtils.fSize_11(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: SizeUtils.horizontalBlockSize * 1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AppText(
                        text: "Locations Surat",
                        fontWeight: FontWeight.w400,
                        color: AppColors.darkBlue,
                        fontSize: SizeUtils.fSize_8(),
                      ),
                      SizedBox(
                        height: SizeUtils.horizontalBlockSize * 2,
                      ),
                      GestureDetector(
                        onTap: () {
                          print('selectedIndex---1>${index}');
                          if (!calendarScreenController.expandIndex
                              .contains(index)) {
                            calendarScreenController.expandIndex.add(index);
                            print('calendarScreenController.expandIndex--->if');
                          } else {
                            calendarScreenController.expandIndex.remove(index);
                            print(
                                'calendarScreenController.expandIndex--->else');
                          }

                          // calendarScreenController.messageSizeButton.value = !calendarScreenController.messageSizeButton.value;
                          setState(() {});
                          print(
                              'calendarScreenController.expandIndex--->${calendarScreenController.expandIndex}');
                        },
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                CircleAvatar(
                                  radius: 5.6,
                                  backgroundColor: AppColors.darkBlue,
                                ),
                                Positioned(
                                    top: SizeUtils.horizontalBlockSize * 0.8,
                                    left: SizeUtils.horizontalBlockSize * 0.8,
                                    child: CircleAvatar(
                                      radius: 2,
                                      backgroundColor:
                                          AppColors.backGroundColor,
                                    )),
                              ],
                            ),
                            SizedBox(
                              width: SizeUtils.horizontalBlockSize * 1,
                            ),
                            AppText(
                              text: "More",
                              fontWeight: FontWeight.w400,
                              color: AppColors.darkBlue,
                              fontSize: SizeUtils.fSize_8(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        calendarScreenController.expandIndex.contains(index)
            ? SizedBox(
                height: SizeUtils.horizontalBlockSize * 5,
              )
            : SizedBox(),
        calendarScreenController.expandIndex.contains(index)
            ? Container(
                decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(width: 0.6, color: AppColors.darkBlue)),
                child: Padding(
                  padding: EdgeInsets.only(
                    right: SizeUtils.horizontalBlockSize * 3,
                    left: SizeUtils.horizontalBlockSize * 3,
                    top: SizeUtils.horizontalBlockSize * 3.3,
                    bottom: SizeUtils.horizontalBlockSize * 3.3,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: "Title more information",
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkBlue,
                        fontSize: SizeUtils.fSize_14(),
                      ),
                      // SizedBox(height: SizeUtils.horizontalBlockSize * 3,),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: SizeUtils.horizontalBlockSize * 2),
                        child: SizedBox(
                          width: SizeUtils.horizontalBlockSize * 80,
                          child: AppText(
                            text: parse(text).documentElement!.text,
                            fontWeight: FontWeight.w500,
                            color: AppColors.darkBlue,
                            fontSize: SizeUtils.fSize_12(),
                          ),
                        ),
                      ),
                      AppText(
                        text: "Add to Google Calendar",
                        fontWeight: FontWeight.w500,
                        color: AppColors.darkBlue,
                        fontSize: SizeUtils.fSize_10(),
                      ),
                    ],
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
    // : Obx(
    //     () => Container(
    //       height: calendarScreenController.messageSizeButton.value ? SizeUtils.horizontalBlockSize * 12.8 : SizeUtils.horizontalBlockSize * 12.8,
    //       decoration: BoxDecoration(
    //           color: AppColors.white,
    //           borderRadius: BorderRadius.circular(6),
    //           border: Border.all(width: 1, color: AppColors.darkBlue.withOpacity(0.2))),
    //       child: Padding(
    //         padding: EdgeInsets.only(
    //           right: SizeUtils.horizontalBlockSize * 3,
    //           left: SizeUtils.horizontalBlockSize * 2,
    //           top: SizeUtils.horizontalBlockSize * 1.3,
    //           bottom: SizeUtils.horizontalBlockSize * 1.3,
    //         ),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: [
    //             SizedBox(
    //               width: SizeUtils.horizontalBlockSize * 7,
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   AppText(
    //                     text: "${months}",
    //                     fontWeight: FontWeight.w300,
    //                     color: AppColors.darkBlue,
    //                     maxLines: 1,
    //                     fontSize: SizeUtils.fSize_12(),
    //                   ),
    //                   AppText(
    //                     text: "$date",
    //                     fontWeight: FontWeight.w600,
    //                     color: AppColors.darkBlue,
    //                     fontSize: SizeUtils.fSize_14(),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             SizedBox(
    //               width: SizeUtils.horizontalBlockSize * 2,
    //             ),
    //             Expanded(
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   SizedBox(
    //                     width: SizeUtils.horizontalBlockSize * 60,
    //                     child: AppText(
    //                       text: parse(title).documentElement!.text,
    //                       fontWeight: FontWeight.w600,
    //                       color: AppColors.darkBlue,
    //                       maxLines: 1,
    //                       fontSize: SizeUtils.fSize_12(),
    //                     ),
    //                   ),
    //                   SizedBox(
    //                     height: SizeUtils.horizontalBlockSize * 1,
    //                   ),
    //                   Row(
    //                     children: [
    //                       AppText(
    //                         text: "$time1 to ",
    //                         fontWeight: FontWeight.w300,
    //                         color: AppColors.darkBlue,
    //                         fontSize: SizeUtils.fSize_11(),
    //                       ),
    //                       AppText(
    //                         text: "$time2",
    //                         fontWeight: FontWeight.w300,
    //                         color: AppColors.darkBlue,
    //                         fontSize: SizeUtils.fSize_11(),
    //                       ),
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             Padding(
    //               padding: EdgeInsets.only(top: SizeUtils.horizontalBlockSize * 1),
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.end,
    //                 children: [
    //                   AppText(
    //                     text: "Locations Surat",
    //                     fontWeight: FontWeight.w400,
    //                     color: AppColors.darkBlue,
    //                     fontSize: SizeUtils.fSize_8(),
    //                   ),
    //                   SizedBox(
    //                     height: SizeUtils.horizontalBlockSize * 2,
    //                   ),
    //                   GestureDetector(
    //                     onTap: () {
    //                       if (!calendarScreenController.expandIndex.contains(index.toString())) {
    //                         print('selectedIndex---1>${index}');
    //                         print('selectedIndex---1>${calendarScreenController.expandIndex}');
    //                         calendarScreenController.expandIndex.add(index.toString());
    //                       } else {
    //                         print('selectedIndex---1>${index}');
    //                         print('selectedIndex---1>${calendarScreenController.expandIndex}');
    //                         calendarScreenController.expandIndex.removeAt(index);
    //                       }
    //                       // calendarScreenController.messageSizeButton.value = !calendarScreenController.messageSizeButton.value;
    //                       // setState(() {});
    //                     },
    //                     child: Row(
    //                       children: [
    //                         Stack(
    //                           children: [
    //                             CircleAvatar(
    //                               radius: 5.6,
    //                               backgroundColor: AppColors.darkBlue,
    //                             ),
    //                             Positioned(
    //                                 top: SizeUtils.horizontalBlockSize * 0.8,
    //                                 left: SizeUtils.horizontalBlockSize * 0.8,
    //                                 child: CircleAvatar(
    //                                   radius: 2,
    //                                   backgroundColor: AppColors.backGroundColor,
    //                                 )),
    //                           ],
    //                         ),
    //                         SizedBox(
    //                           width: SizeUtils.horizontalBlockSize * 1,
    //                         ),
    //                         AppText(
    //                           text: "More",
    //                           fontWeight: FontWeight.w400,
    //                           color: AppColors.darkBlue,
    //                           fontSize: SizeUtils.fSize_8(),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   );
  }

  Widget isLoadingEventBox() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(width: 2, color: AppColors.darkBlue),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeUtils.horizontalBlockSize * 2,
          vertical: SizeUtils.horizontalBlockSize * 2.5,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.darkBlue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: AppText(
                    text: "Finsrr",
                    fontWeight: FontWeight.w500,
                    color: Colors.transparent,
                    fontSize: SizeUtils.fSize_6(),
                  ),
                ),
                SizedBox(
                  height: SizeUtils.horizontalBlockSize * 2.5,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.darkBlue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: AppText(
                    text: "Finsrr",
                    fontWeight: FontWeight.w500,
                    color: Colors.transparent,
                    fontSize: SizeUtils.fSize_6(),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: SizeUtils.horizontalBlockSize * 2,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.darkBlue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: AppText(
                      text:
                          "FindCouFisLoadingNotificationsBoxFindCouFisnsBoxFindCouFi",
                      fontWeight: FontWeight.w500,
                      color: Colors.transparent,
                      fontSize: SizeUtils.fSize_6(),
                    ),
                  ),
                  SizedBox(
                    height: SizeUtils.horizontalBlockSize * 2.5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.darkBlue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: AppText(
                      text: "FindCouFisLoadingNotificationsBoxFindCo",
                      fontWeight: FontWeight.w500,
                      color: Colors.transparent,
                      fontSize: SizeUtils.fSize_6(),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.darkBlue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: AppText(
                    text: "FindCouFindCou",
                    fontWeight: FontWeight.w500,
                    color: Colors.transparent,
                    fontSize: SizeUtils.fSize_6(),
                  ),
                ),
                SizedBox(
                  height: SizeUtils.horizontalBlockSize * 2.5,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.darkBlue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: AppText(
                    text: "FiuFindCou",
                    fontWeight: FontWeight.w500,
                    color: Colors.transparent,
                    fontSize: SizeUtils.fSize_6(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
// List<DateTime> _getBlackoutDates() {
//   final List<DateTime> dates = <DateTime>[];
//   final DateTime blackoutDate = DateTime.now();
//   dates.add(blackoutDate.add(Duration(days: 1)));
//   dates.add(blackoutDate.add(Duration(days: 2)));
//   dates.add(blackoutDate.add(Duration(days: 3)));
//
//   return dates;
// }
//
// List<DateTime> _getSpecialDates() {
//   final List<DateTime> dates = <DateTime>[];
//   final DateTime startDate =
//       DateTime.now().subtract(const Duration(days: 990));
//   final DateTime endDate = DateTime.now().add(const Duration(days: 990));
//   final Random random = Random();
//   for (DateTime date = startDate;
//       date.isBefore(endDate);
//       date = date.add(const Duration(days: 29))) {
//     for (int i = 0; i < 3; i++) {
//       dates.add(date.add(Duration(days: random.nextInt(i + 4))));
//     }
//   }
//
//   return dates;
// }
}
