// To parse this JSON data, do
//
//     final nutritionCustomSingleModel = nutritionCustomSingleModelFromJson(jsonString);

import 'dart:convert';

NutritionCustomSingleModel nutritionCustomSingleModelFromJson(String str) => NutritionCustomSingleModel.fromJson(json.decode(str));

String nutritionCustomSingleModelToJson(NutritionCustomSingleModel data) => json.encode(data.toJson());

class NutritionCustomSingleModel {
  String? id;
  String? userId;
  List<String>? caloricGoal;
  List<String>? cookTime;
  List<String>? dietary;
  String? days;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? nutritionCustomSingleModelId;

  NutritionCustomSingleModel({
    this.id,
    this.userId,
    this.caloricGoal,
    this.cookTime,
    this.dietary,
    this.days,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.nutritionCustomSingleModelId,
  });

  factory NutritionCustomSingleModel.fromJson(Map<String, dynamic> json) => NutritionCustomSingleModel(
    id: json["_id"],
    userId: json["user_id"],
    caloricGoal: json["caloric_goal"] == null ? [] : List<String>.from(json["caloric_goal"]!.map((x) => x)),
    cookTime: json["cook_time"] == null ? [] : List<String>.from(json["cook_time"]!.map((x) => x)),
    dietary: json["dietary"] == null ? [] : List<String>.from(json["dietary"]!.map((x) => x)),
    days: json["days"],
    isActive: json["is_active"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    nutritionCustomSingleModelId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "user_id": userId,
    "caloric_goal": caloricGoal == null ? [] : List<dynamic>.from(caloricGoal!.map((x) => x)),
    "cook_time": cookTime == null ? [] : List<dynamic>.from(cookTime!.map((x) => x)),
    "dietary": dietary == null ? [] : List<dynamic>.from(dietary!.map((x) => x)),
    "days": days,
    "is_active": isActive,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "id": nutritionCustomSingleModelId,
  };
}
