// To parse this JSON data, do
//
//     final chatWeekResponseModel = chatWeekResponseModelFromJson(jsonString);

import 'dart:convert';

List<ChatWeekResponseModel> chatWeekResponseModelFromJson(String str) => List<ChatWeekResponseModel>.from(json.decode(str).map((x) => ChatWeekResponseModel.fromJson(x)));

String chatWeekResponseModelToJson(List<ChatWeekResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChatWeekResponseModel {
  String? day;
  int? exercise;

  ChatWeekResponseModel({
    this.day,
    this.exercise,
  });

  factory ChatWeekResponseModel.fromJson(Map<String, dynamic> json) => ChatWeekResponseModel(
    day: json["day"],
    exercise: json["exercise"],
  );

  Map<String, dynamic> toJson() => {
    "day": day,
    "exercise": exercise,
  };
}
