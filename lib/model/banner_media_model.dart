// To parse this JSON data, do
//
//     final bannerMediaModal = bannerMediaModalFromJson(jsonString);

import 'dart:convert';

BannerMediaModal bannerMediaModalFromJson(String str) => BannerMediaModal.fromJson(json.decode(str));

String bannerMediaModalToJson(BannerMediaModal data) => json.encode(data.toJson());

class BannerMediaModal {
  BannerMediaModal({
    this.testData,
  });

  List<String>? testData;

  factory BannerMediaModal.fromJson(Map<String, dynamic> json) => BannerMediaModal(
        testData: List<String>.from(json["testData"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "testData": List<dynamic>.from(testData!.map((x) => x)),
      };
}
