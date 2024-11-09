// To parse this JSON data, do
//
//     final workoutVidoeResponse = workoutVidoeResponseFromJson(jsonString);

import 'dart:convert';

WorkoutVidoeResponse workoutVidoeResponseFromJson(String str) => WorkoutVidoeResponse.fromJson(json.decode(str));

String workoutVidoeResponseToJson(WorkoutVidoeResponse data) => json.encode(data.toJson());

class WorkoutVidoeResponse {
  String? id;
  String? title;
  String? workoutId;
  dynamic? round;
  String? video;
  int? setsNo;
  int? rep;
  String? duration;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  WorkoutVidoeResponse({
    this.id,
    this.title,
    this.workoutId,
    this.round,
    this.video,
    this.setsNo,
    this.rep,
    this.duration,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory WorkoutVidoeResponse.fromJson(Map<String, dynamic> json) => WorkoutVidoeResponse(
    id: json["_id"],
    title: json["title"],
    workoutId: json["workout_id"],
    round: json["round"],
    video: json["video"],
    setsNo: json["sets_no"],
    rep: json["rep"],
    duration: json["duration"],
    isActive: json["is_active"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "workout_id": workoutId,
    "round": round,
    "video": video,
    "sets_no": setsNo,
    "rep": rep,
    "duration": duration,
    "is_active": isActive,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
