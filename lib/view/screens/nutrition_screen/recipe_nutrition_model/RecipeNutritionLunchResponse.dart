// To parse this JSON data, do
//
//     final recipeNutritionLunchResponse = recipeNutritionLunchResponseFromJson(jsonString);

import 'dart:convert';

RecipeNutritionLunchResponse recipeNutritionLunchResponseFromJson(String str) => RecipeNutritionLunchResponse.fromJson(json.decode(str));

String recipeNutritionLunchResponseToJson(RecipeNutritionLunchResponse data) => json.encode(data.toJson());

class RecipeNutritionLunchResponse {
  String? id;
  String? recipeId;
  String? caloricGoal;
  String? cookTime;
  String? dietary;
  String? mealType;
  String? days;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  RecipeprogrammesData? recipeprogrammesData;

  RecipeNutritionLunchResponse({
    this.id,
    this.recipeId,
    this.caloricGoal,
    this.cookTime,
    this.dietary,
    this.mealType,
    this.days,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.recipeprogrammesData,
  });

  factory RecipeNutritionLunchResponse.fromJson(Map<String, dynamic> json) => RecipeNutritionLunchResponse(
    id: json["_id"],
    recipeId: json["recipe_id"],
    caloricGoal: json["caloric_goal"],
    cookTime: json["cook_time"],
    dietary: json["dietary"],
    mealType: json["meal_type"],
    days: json["days"],
    isActive: json["is_active"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    recipeprogrammesData: json["recipeprogrammesData"] == null ? null : RecipeprogrammesData.fromJson(json["recipeprogrammesData"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "recipe_id": recipeId,
    "caloric_goal": caloricGoal,
    "cook_time": cookTime,
    "dietary": dietary,
    "meal_type": mealType,
    "days": days,
    "is_active": isActive,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "recipeprogrammesData": recipeprogrammesData?.toJson(),
  };
}

class RecipeprogrammesData {
  String? id;
  String? title;
  DateTime? date;
  String? description;
  String? img;
  dynamic? protein;
  int? energy;
  int? carbs;
  int? fat;
  String? duration;
  int? quantity;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  RecipeprogrammesData({
    this.id,
    this.title,
    this.date,
    this.description,
    this.img,
    this.protein,
    this.energy,
    this.carbs,
    this.fat,
    this.duration,
    this.quantity,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory RecipeprogrammesData.fromJson(Map<String, dynamic> json) => RecipeprogrammesData(
    id: json["_id"],
    title: json["title"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    description: json["description"],
    img: json["img"],
    protein: json["protein"],
    energy: json["energy"],
    carbs: json["carbs"],
    fat: json["fat"],
    duration: json["duration"],
    quantity: json["quantity"],
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
    "img": img,
    "protein": protein,
    "energy": energy,
    "carbs": carbs,
    "fat": fat,
    "duration": duration,
    "quantity": quantity,
    "is_active": isActive,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
