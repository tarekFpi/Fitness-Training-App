// To parse this JSON data, do
//
//     final customPlanWorkoutResponse = customPlanWorkoutResponseFromJson(jsonString);

import 'dart:convert';

CustomPlanWorkoutResponse customPlanWorkoutResponseFromJson(String str) => CustomPlanWorkoutResponse.fromJson(json.decode(str));

String customPlanWorkoutResponseToJson(CustomPlanWorkoutResponse data) => json.encode(data.toJson());

class CustomPlanWorkoutResponse {
  String? id;
  String? title;
  DateTime? time;
  String? description;
  String? week;
  List<String>? fitnessGoal;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  WorkoutsData? workoutsData;
  List<String>? workoutIds;

  CustomPlanWorkoutResponse({
    this.id,
    this.title,
    this.time,
    this.description,
    this.week,
    this.fitnessGoal,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.workoutsData,
    this.workoutIds,
  });

  factory CustomPlanWorkoutResponse.fromJson(Map<String, dynamic> json) => CustomPlanWorkoutResponse(
    id: json["_id"],
    title: json["title"],
    time: json["time"] == null ? null : DateTime.parse(json["time"]),
    description: json["description"],
    week: json["week"],
    fitnessGoal: json["fitness_goal"] == null ? [] : List<String>.from(json["fitness_goal"]!.map((x) => x)),
    isActive: json["is_active"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    workoutsData: json["workoutsData"] == null ? null : WorkoutsData.fromJson(json["workoutsData"]),
    workoutIds: json["workout_ids"] == null ? [] : List<String>.from(json["workout_ids"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "time": time?.toIso8601String(),
    "description": description,
    "week": week,
    "fitness_goal": fitnessGoal == null ? [] : List<dynamic>.from(fitnessGoal!.map((x) => x)),
    "is_active": isActive,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "workoutsData": workoutsData?.toJson(),
    "workout_ids": workoutIds == null ? [] : List<dynamic>.from(workoutIds!.map((x) => x)),
  };
}

class WorkoutsData {
  String? id;
  String? title;
  DateTime? date;
  String? description;
  String? programmeId;
  String? duration;
  int? setsNo;
  int? rep;
  String? muscleGroup;
  String? img;
  String? muscleGroupImg;
  String? equipmentImg;
  String? energy;
  String? fitnessLevel;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  WorkoutsData({
    this.id,
    this.title,
    this.date,
    this.description,
    this.programmeId,
    this.duration,
    this.setsNo,
    this.rep,
    this.muscleGroup,
    this.img,
    this.muscleGroupImg,
    this.equipmentImg,
    this.energy,
    this.fitnessLevel,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory WorkoutsData.fromJson(Map<String, dynamic> json) => WorkoutsData(
    id: json["_id"],
    title: json["title"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    description: json["description"],
    programmeId: json["programme_id"],
    duration: json["duration"],
    setsNo: json["sets_no"],
    rep: json["rep"],
    muscleGroup: json["muscle_group"],
    img: json["img"],
    muscleGroupImg: json["muscle_group_img"],
    equipmentImg: json["equipment_img"],
    energy: json["energy"],
    fitnessLevel: json["fitness_level"],
    isActive: json["is_active"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "date": date?.toIso8601String(),
    "description": description,
    "programme_id": programmeId,
    "duration": duration,
    "sets_no": setsNo,
    "rep": rep,
    "muscle_group": muscleGroup,
    "img": img,
    "muscle_group_img": muscleGroupImg,
    "equipment_img": equipmentImg,
    "energy": energy,
    "fitness_level": fitnessLevel,
    "is_active": isActive,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
