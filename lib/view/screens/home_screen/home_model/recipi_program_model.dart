// To parse this JSON data, do
//
//     final recipiProgramModel = recipiProgramModelFromJson(jsonString);

import 'dart:convert';

RecipiProgramModel recipiProgramModelFromJson(String str) => RecipiProgramModel.fromJson(json.decode(str));

String recipiProgramModelToJson(RecipiProgramModel data) => json.encode(data.toJson());

class RecipiProgramModel {
    String? id;
    String? title;
    DateTime? date;
    String? description;
    String? img;
    double? protein;
    int? energy;
    int? carbs;
    int? fat;
    String? duration;
    int? quantity;
    bool? isActive;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;
    List<SDatum>? ingredientsData;
    List<SDatum>? instructionsData;

    RecipiProgramModel({
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
        this.ingredientsData,
        this.instructionsData,
    });

    factory RecipiProgramModel.fromJson(Map<String, dynamic> json) => RecipiProgramModel(
        id: json["_id"],
        title: json["title"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        description: json["description"],
        img: json["img"],
        protein: json["protein"]?.toDouble(),
        energy: json["energy"],
        carbs: json["carbs"],
        fat: json["fat"],
        duration: json["duration"],
        quantity: json["quantity"],
        isActive: json["is_active"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        ingredientsData: json["ingredientsData"] == null ? [] : List<SDatum>.from(json["ingredientsData"]!.map((x) => SDatum.fromJson(x))),
        instructionsData: json["instructionsData"] == null ? [] : List<SDatum>.from(json["instructionsData"]!.map((x) => SDatum.fromJson(x))),
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
        "ingredientsData": ingredientsData == null ? [] : List<dynamic>.from(ingredientsData!.map((x) => x.toJson())),
        "instructionsData": instructionsData == null ? [] : List<dynamic>.from(instructionsData!.map((x) => x.toJson())),
    };
}

class SDatum {
    String? id;
    String? recipeId;
    String? title;
    String? img;
    String? quantity;
    String? description;
    bool? isActive;
    int? v;
    DateTime? createdAt;
    DateTime? updatedAt;

    SDatum({
        this.id,
        this.recipeId,
        this.title,
        this.img,
        this.quantity,
        this.description,
        this.isActive,
        this.v,
        this.createdAt,
        this.updatedAt,
    });

    factory SDatum.fromJson(Map<String, dynamic> json) => SDatum(
        id: json["_id"],
        recipeId: json["recipe_id"],
        title: json["title"],
        img: json["img"],
        quantity: json["quantity"],
        description: json["description"],
        isActive: json["is_active"],
        v: json["__v"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "recipe_id": recipeId,
        "title": title,
        "img": img,
        "quantity": quantity,
        "description": description,
        "is_active": isActive,
        "__v": v,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
}
