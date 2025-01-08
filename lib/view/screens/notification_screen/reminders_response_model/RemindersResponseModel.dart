
// To parse this JSON data, do
//
//     final remindersResponseModel = remindersResponseModelFromJson(jsonString);

import 'dart:convert';

RemindersResponseModel remindersResponseModelFromJson(String str) => RemindersResponseModel.fromJson(json.decode(str));

String remindersResponseModelToJson(RemindersResponseModel data) => json.encode(data.toJson());

class RemindersResponseModel {
  String? id;
  String? title;
  String? description;
  String? type;
  DateTime? expireTime;
  String? resourceName;
  String? resourceId;
  String? receivers;
  bool? isLockScreen;
  bool? isActive;
  String? createdAt;
  DateTime? updatedAt;
  int? v;
  ResourceDetails? resourceDetails;

  RemindersResponseModel({
    this.id,
    this.title,
    this.description,
    this.type,
    this.expireTime,
    this.resourceName,
    this.resourceId,
    this.receivers,
    this.isLockScreen,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.resourceDetails,
  });

  factory RemindersResponseModel.fromJson(Map<String, dynamic> json) => RemindersResponseModel(
    id: json["_id"],
    title: json["title"],
    description: json["description"],
    type: json["type"],
    expireTime: json["expire_time"] == null ? null : DateTime.parse(json["expire_time"]),
    resourceName: json["resource_name"],
    resourceId: json["resource_id"],
    receivers: json["receivers"],
    isLockScreen: json["is_lock_screen"],
    isActive: json["is_active"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    resourceDetails: json["resource_details"] == null ? null : ResourceDetails.fromJson(json["resource_details"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "description": description,
    "type": type,
    "expire_time": expireTime?.toIso8601String(),
    "resource_name": resourceName,
    "resource_id": resourceId,
    "receivers": receivers,
    "is_lock_screen": isLockScreen,
    "is_active": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "resource_details": resourceDetails?.toJson(),
  };
}

class ResourceDetails {
  String? id;
  String? title;
  DateTime? date;
  String? description;
  String? programmeId;
  String? duration;
  int? setsNo;
  int? rep;
  String? img;
  String? muscleGroupImg;
  String? equipmentImg;
  dynamic? energy;
  String? fitnessLevel;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  ResourceDetails({
    this.id,
    this.title,
    this.date,
    this.description,
    this.programmeId,
    this.duration,
    this.setsNo,
    this.rep,
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

  factory ResourceDetails.fromJson(Map<String, dynamic> json) => ResourceDetails(
    id: json["_id"],
    title: json["title"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    description: json["description"],
    programmeId: json["programme_id"],
    duration: json["duration"],
    setsNo: json["sets_no"],
    rep: json["rep"],
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

