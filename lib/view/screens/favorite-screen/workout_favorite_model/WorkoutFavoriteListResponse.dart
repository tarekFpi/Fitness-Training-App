// To parse this JSON data, do
//
//     final workoutFavoriteListResponse = workoutFavoriteListResponseFromJson(jsonString);

import 'dart:convert';

WorkoutFavoriteListResponse workoutFavoriteListResponseFromJson(String str) => WorkoutFavoriteListResponse.fromJson(json.decode(str));

String workoutFavoriteListResponseToJson(WorkoutFavoriteListResponse data) => json.encode(data.toJson());

class WorkoutFavoriteListResponse {
  String? id;
  String? workoutId;
  String? userId;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  WorkoutsData? workoutsData;
  UsersData? usersData;

  WorkoutFavoriteListResponse({
    this.id,
    this.workoutId,
    this.userId,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.workoutsData,
    this.usersData,
  });

  factory WorkoutFavoriteListResponse.fromJson(Map<String, dynamic> json) => WorkoutFavoriteListResponse(
    id: json["_id"],
    workoutId: json["workout_id"],
    userId: json["user_id"],
    isActive: json["is_active"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    workoutsData: json["workoutsData"] == null ? null : WorkoutsData.fromJson(json["workoutsData"]),
    usersData: json["usersData"] == null ? null : UsersData.fromJson(json["usersData"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "workout_id": workoutId,
    "user_id": userId,
    "is_active": isActive,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "workoutsData": workoutsData?.toJson(),
    "usersData": usersData?.toJson(),
  };
}

class UsersData {
  String? id;
  String? email;
  String? name;
  String? password;
  String? role;
  dynamic verifyCode;
  dynamic fingerData;
  dynamic verifyExpiration;
  bool? isVerified;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  UsersData({
    this.id,
    this.email,
    this.name,
    this.password,
    this.role,
    this.verifyCode,
    this.fingerData,
    this.verifyExpiration,
    this.isVerified,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory UsersData.fromJson(Map<String, dynamic> json) => UsersData(
    id: json["_id"],
    email: json["email"],
    name: json["name"],
    password: json["password"],
    role: json["role"],
    verifyCode: json["verify_code"],
    fingerData: json["finger_data"],
    verifyExpiration: json["verify_expiration"],
    isVerified: json["is_verified"],
    isActive: json["is_active"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "email": email,
    "name": name,
    "password": password,
    "role": role,
    "verify_code": verifyCode,
    "finger_data": fingerData,
    "verify_expiration": verifyExpiration,
    "is_verified": isVerified,
    "is_active": isActive,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
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
