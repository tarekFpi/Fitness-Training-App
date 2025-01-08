// To parse this JSON data, do
//
//     final userProfileResponseModel = userProfileResponseModelFromJson(jsonString);

import 'dart:convert';

UserProfileResponseModel userProfileResponseModelFromJson(String str) => UserProfileResponseModel.fromJson(json.decode(str));

String userProfileResponseModelToJson(UserProfileResponseModel data) => json.encode(data.toJson());

class UserProfileResponseModel {
  String? id;
  String? email;
  String? name;
  String? role;
  dynamic img;
  DateTime? createdAt;
  DateTime? updatedAt;
  UserData? userData;

  UserProfileResponseModel({
    this.id,
    this.email,
    this.name,
    this.role,
    this.img,
    this.createdAt,
    this.updatedAt,
    this.userData,
  });

  factory UserProfileResponseModel.fromJson(Map<String, dynamic> json) => UserProfileResponseModel(
    id: json["_id"],
    email: json["email"],
    name: json["name"],
    role: json["role"],
    img: json["img"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    userData: json["userData"] == null ? null : UserData.fromJson(json["userData"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "email": email,
    "name": name,
    "role": role,
    "img": img,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "userData": userData?.toJson(),
  };
}

class UserData {
  String? id;
  dynamic name;
  String? userId;
  dynamic contactNumber;
  dynamic dateOfBirth;
  dynamic address;
  dynamic location;
  dynamic profileImage;
  dynamic weight;
  dynamic height;
  dynamic age;
  String? physicalLevel;
  dynamic fingerData;
  dynamic fcmToken;
  bool? isSocialLog;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? fitnessGoal;

  UserData({
    this.id,
    this.name,
    this.userId,
    this.contactNumber,
    this.dateOfBirth,
    this.address,
    this.location,
    this.profileImage,
    this.weight,
    this.height,
    this.age,
    this.physicalLevel,
    this.fingerData,
    this.fcmToken,
    this.isSocialLog,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.fitnessGoal,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    id: json["_id"],
    name: json["name"],
    userId: json["user_id"],
    contactNumber: json["contact_number"],
    dateOfBirth: json["date_of_birth"],
    address: json["address"],
    location: json["location"],
    profileImage: json["profile_image"],
    weight: json["weight"],
    height: json["height"],
    age: json["age"],
    physicalLevel: json["physical_level"],
    fingerData: json["finger_data"],
    fcmToken: json["fcm_token"],
    isSocialLog: json["is_social_log"],
    isActive: json["is_active"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    fitnessGoal: json["fitness_goal"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "user_id": userId,
    "contact_number": contactNumber,
    "date_of_birth": dateOfBirth,
    "address": address,
    "location": location,
    "profile_image": profileImage,
    "weight": weight,
    "height": height,
    "age": age,
    "physical_level": physicalLevel,
    "finger_data": fingerData,
    "fcm_token": fcmToken,
    "is_social_log": isSocialLog,
    "is_active": isActive,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "fitness_goal": fitnessGoal,
  };
}
