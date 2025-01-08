// To parse this JSON data, do
//
//     final workoutLatestResponse = workoutLatestResponseFromJson(jsonString);

import 'dart:convert';

WorkoutLatestResponse workoutLatestResponseFromJson(String str) => WorkoutLatestResponse.fromJson(json.decode(str));

String workoutLatestResponseToJson(WorkoutLatestResponse data) => json.encode(data.toJson());

class WorkoutLatestResponse {
  String? id;
  String? title;
  DateTime? time;
  String? img;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? type;
  dynamic description;
  dynamic duration;

  WorkoutLatestResponse({
    this.id,
    this.title,
    this.time,
    this.img,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.type,
    this.description,
    this.duration,
  });

  factory WorkoutLatestResponse.fromJson(Map<String, dynamic> json) => WorkoutLatestResponse(
    id: json["_id"],
    title: json["title"],
    time: json["time"] == null ? null : DateTime.parse(json["time"]),
    img: json["img"],
    isActive: json["is_active"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    type: json["type"],
    description: json["description"],
    duration: json["duration"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "time": time?.toIso8601String(),
    "img": img,
    "is_active": isActive,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "type": type,
    "description": description,
    "duration": duration,
  };
}
