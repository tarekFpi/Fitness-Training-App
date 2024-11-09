// To parse this JSON data, do
//
//     final workoutResponse = workoutResponseFromJson(jsonString);

import 'dart:convert';

WorkoutResponse workoutResponseFromJson(String str) => WorkoutResponse.fromJson(json.decode(str));

String workoutResponseToJson(WorkoutResponse data) => json.encode(data.toJson());

class WorkoutResponse {
  String? id;
  String? title;
  DateTime? time;
  String? img;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  WorkoutData? workoutData;

  WorkoutResponse({
    this.id,
    this.title,
    this.time,
    this.img,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.workoutData,
  });

  factory WorkoutResponse.fromJson(Map<String, dynamic> json) => WorkoutResponse(
    id: json["_id"],
    title: json["title"],
    time: json["time"] == null ? null : DateTime.parse(json["time"]),
    img: json["img"],
    isActive: json["is_active"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    workoutData: json["workoutData"] == null ? null : WorkoutData.fromJson(json["workoutData"]),
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
    "workoutData": workoutData?.toJson(),
  };
}

class WorkoutData {
  String? id;
  String? title;
  DateTime? date;
  String? description;
  String? programmeId;
  String? duration;
  int? setsNo;
  int? rep;
  String? muscleGroup;
  String? muscleGroupImg;
  String? equipmentImg;
  String? energy;
  String? fitnessLevel;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  List<Exercise>? exercises;

  WorkoutData({
    this.id,
    this.title,
    this.date,
    this.description,
    this.programmeId,
    this.duration,
    this.setsNo,
    this.rep,
    this.muscleGroup,
    this.muscleGroupImg,
    this.equipmentImg,
    this.energy,
    this.fitnessLevel,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.exercises,
  });

  factory WorkoutData.fromJson(Map<String, dynamic> json) => WorkoutData(
    id: json["_id"],
    title: json["title"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    description: json["description"],
    programmeId: json["programme_id"],
    duration: json["duration"],
    setsNo: json["sets_no"],
    rep: json["rep"],
    muscleGroup: json["muscle_group"],
    muscleGroupImg: json["muscle_group_img"],
    equipmentImg: json["equipment_img"],
    energy: json["energy"],
    fitnessLevel: json["fitness_level"],
    isActive: json["is_active"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    exercises: json["exercises"] == null ? [] : List<Exercise>.from(json["exercises"]!.map((x) => Exercise.fromJson(x))),
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
    "muscle_group_img": muscleGroupImg,
    "equipment_img": equipmentImg,
    "energy": energy,
    "fitness_level": fitnessLevel,
    "is_active": isActive,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "exercises": exercises == null ? [] : List<dynamic>.from(exercises!.map((x) => x.toJson())),
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
