// To parse this JSON data, do
//
//     final findCouncilModel = findCouncilModelFromJson(jsonString);

import 'dart:convert';

List<FindCouncilModel> findCouncilModelFromJson(String str) => List<FindCouncilModel>.from(json.decode(str).map((x) => FindCouncilModel.fromJson(x)));

String findCouncilModelToJson(List<FindCouncilModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FindCouncilModel {
  FindCouncilModel({
    this.id,
    this.userEmail,
    this.displayName,
    this.imageUrl,
    this.councilAddress,
    this.councilPhone,
    this.councilItemcode,
  });

  int? id;
  String? userEmail;
  String? displayName;
  dynamic imageUrl;
  String? councilAddress;
  String? councilPhone;
  String? councilItemcode;

  factory FindCouncilModel.fromJson(Map<String, dynamic> json) => FindCouncilModel(
    id: json["ID"]??"",
    userEmail: json["user_email"]??"",
    displayName: json["display_name"]??"",
    imageUrl: json["image_url"]??"",
    councilAddress: json["council_address"]??"",
    councilPhone: json["council_phone"]??"",
    councilItemcode: json["council_itemcode"]??"",
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "user_email": userEmail,
    "display_name": displayName,
    "image_url": imageUrl,
    "council_address": councilAddress,
    "council_phone": councilPhone,
    "council_itemcode": councilItemcode,
  };
}
