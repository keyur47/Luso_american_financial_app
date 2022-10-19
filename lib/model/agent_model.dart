// To parse this JSON data, do
//
//     final findAgentsModel = findAgentsModelFromJson(jsonString);

import 'dart:convert';

FindAgentsModel findAgentsModelFromJson(String str) => FindAgentsModel.fromJson(json.decode(str));

String findAgentsModelToJson(FindAgentsModel data) => json.encode(data.toJson());

class FindAgentsModel {
  FindAgentsModel({
    this.output,
  });

  List<Output>? output;

  factory FindAgentsModel.fromJson(Map<String, dynamic> json) => FindAgentsModel(
    output: List<Output>.from(json["output"].map((x) => Output.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "output": List<dynamic>.from(output!.map((x) => x.toJson())),
  };
}

class Output {
  Output({
    this.name,
    this.address,
    this.phone,
    this.zip,
    this.email,
  });

  String? name;
  String? address;
  String? phone;
  String? zip;
  String? email;

  factory Output.fromJson(Map<String, dynamic> json) => Output(
    name: json["name"],
    address: json["address"],
    phone: json["phone"],
    zip: json["zip"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "address": address,
    "phone": phone,
    "zip": zip,
    "email": email,
  };
}
