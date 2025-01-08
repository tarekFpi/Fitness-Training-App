// To parse this JSON data, do
//
//     final progressTrackingResponseModel = progressTrackingResponseModelFromJson(jsonString);

import 'dart:convert';

ProgressTrackingResponseModel progressTrackingResponseModelFromJson(String str) => ProgressTrackingResponseModel.fromJson(json.decode(str));

String progressTrackingResponseModelToJson(ProgressTrackingResponseModel data) => json.encode(data.toJson());

class ProgressTrackingResponseModel {
  String? id;
  String? userId;
  String? exerciseId;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  DateTime? dateString;
  Exercise? exercise;

  ProgressTrackingResponseModel({
    this.id,
    this.userId,
    this.exerciseId,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.dateString,
    this.exercise,
  });

  factory ProgressTrackingResponseModel.fromJson(Map<String, dynamic> json) => ProgressTrackingResponseModel(
    id: json["_id"],
    userId: json["user_id"],
    exerciseId: json["exercise_id"],
    isActive: json["is_active"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    dateString: json["dateString"] == null ? null : DateTime.parse(json["dateString"]),
    exercise: json["exercise"] == null ? null : Exercise.fromJson(json["exercise"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "user_id": userId,
    "exercise_id": exerciseId,
    "is_active": isActive,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "dateString": "${dateString!.year.toString().padLeft(4, '0')}-${dateString!.month.toString().padLeft(2, '0')}-${dateString!.day.toString().padLeft(2, '0')}",
    "exercise": exercise?.toJson(),
  };
}

class Exercise {
  String? id;
  String? title;
  String? workoutId;
  String? round;
  String? video;
  int? setsNo;
  int? rep;
  String? duration;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Exercise({
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

  factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
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
