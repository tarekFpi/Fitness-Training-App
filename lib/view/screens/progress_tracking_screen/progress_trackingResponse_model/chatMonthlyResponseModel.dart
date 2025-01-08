// To parse this JSON data, do
//
//     final chatMonthlyResponseModel = chatMonthlyResponseModelFromJson(jsonString);

import 'dart:convert';

List<ChatMonthlyResponseModel> chatMonthlyResponseModelFromJson(String str) => List<ChatMonthlyResponseModel>.from(json.decode(str).map((x) => ChatMonthlyResponseModel.fromJson(x)));

String chatMonthlyResponseModelToJson(List<ChatMonthlyResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChatMonthlyResponseModel {
  String? month;
  int? exercise;

  ChatMonthlyResponseModel({
    this.month,
    this.exercise,
  });

  factory ChatMonthlyResponseModel.fromJson(Map<String, dynamic> json) => ChatMonthlyResponseModel(
    month: json["month"],
    exercise: json["exercise"],
  );

  Map<String, dynamic> toJson() => {
    "month": month,
    "exercise": exercise,
  };
}
