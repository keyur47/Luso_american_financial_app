import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UnAvailableDateTimeModel {
  String? date;
  List<TimeList>? timeList;

  UnAvailableDateTimeModel({this.date, this.timeList});

  UnAvailableDateTimeModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    if (json['timeList'] != null) {
      timeList = <TimeList>[];
      json['timeList'].forEach((v) {
        timeList!.add(TimeList.fromJson(v));
      });
    }
  }

  static List<UnAvailableDateTimeModel> fromList(json) {
    List<UnAvailableDateTimeModel> tempList = [];

    json.forEach((element) {
      tempList.add(UnAvailableDateTimeModel.fromJson(element));
    });

    return tempList;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    if (timeList != null) {
      data['timeList'] = timeList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TimeList {
  String? fromTime;
  String? toTime;
  String? day;
  int? id;
  TextEditingController? textEditingControllerFrom1;
  TextEditingController? textEditingControllerFrom2;
  TextEditingController? textEditingControllerTo1;
  TextEditingController? textEditingControllerTo2;
  String? hrCounterFrom;
  String? hrCounterTo;
  String? minCounterFrom;
  String? minCounterTo;
  RxBool ?isDeleteLoading;

  TimeList({
    this.fromTime,
    this.toTime,
    this.day,
    this.id,
    this.textEditingControllerFrom1,
    this.textEditingControllerFrom2,
    this.textEditingControllerTo1,
    this.textEditingControllerTo2,
    this.hrCounterTo = '00',
    this.minCounterTo = '00',
    this.hrCounterFrom = '00',
    this.minCounterFrom = '00',
    this.isDeleteLoading ,
  }) {
    textEditingControllerFrom1 = TextEditingController();
    textEditingControllerTo1 = TextEditingController();
    textEditingControllerTo2 =TextEditingController();
    textEditingControllerFrom2 =TextEditingController();
    isDeleteLoading = false.obs;
  }

  TimeList.fromJson(Map<String, dynamic> json) {
    fromTime = json['fromTime'];
    toTime = json['toTime'];
    day = json['day'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fromTime'] = fromTime;
    data['toTime'] = toTime;
    data['day'] = day;
    data['id'] = id;
    return data;
  }
}
