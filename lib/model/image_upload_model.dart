// To parse this JSON data, do
//
//     final imageUploadModel = imageUploadModelFromJson(jsonString);

import 'dart:convert';

ImageUploadModel imageUploadModelFromJson(String str) => ImageUploadModel.fromJson(json.decode(str));

String imageUploadModelToJson(ImageUploadModel data) => json.encode(data.toJson());

class ImageUploadModel {
  ImageUploadModel({
    this.data,
    this.status,
    this.message,
  });

  Data? data;
  String? status;
  String? message;

  factory ImageUploadModel.fromJson(Map<String, dynamic> json) => ImageUploadModel(
        data: Data.fromJson(json["data"] ?? []),
        status: json["status"] ?? "",
        message: json["message"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "status": status,
        "message": message,
      };
}

class Data {
  Data({
    this.image,
  });

  String? image;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        image: json["image"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "image": image,
      };
}
