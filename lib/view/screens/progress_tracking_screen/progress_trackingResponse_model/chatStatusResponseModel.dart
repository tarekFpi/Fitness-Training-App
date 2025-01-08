// To parse this JSON data, do
//
//     final chatStatusResponseModel = chatStatusResponseModelFromJson(jsonString);

import 'dart:convert';

ChatStatusResponseModel chatStatusResponseModelFromJson(String str) => ChatStatusResponseModel.fromJson(json.decode(str));

String chatStatusResponseModelToJson(ChatStatusResponseModel data) => json.encode(data.toJson());

class ChatStatusResponseModel {
  int? totalExercise;
  int? totalEnergy;
  String? totalDuration;
  int? totalRep;

  ChatStatusResponseModel({
    this.totalExercise,
    this.totalEnergy,
    this.totalDuration,
    this.totalRep,
  });

  factory ChatStatusResponseModel.fromJson(Map<String, dynamic> json) => ChatStatusResponseModel(
    totalExercise: json["totalExercise"],
    totalEnergy: json["totalEnergy"],
    totalDuration: json["totalDuration"],
    totalRep: json["totalRep"],
  );

  Map<String, dynamic> toJson() => {
    "totalExercise": totalExercise,
    "totalEnergy": totalEnergy,
    "totalDuration": totalDuration,
    "totalRep": totalRep,
  };
}
