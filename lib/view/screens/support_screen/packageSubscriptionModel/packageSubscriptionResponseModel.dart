// To parse this JSON data, do
//
//     final packageSubscriptionResponseModel = packageSubscriptionResponseModelFromJson(jsonString);

import 'dart:convert';

SubscriptionResponseModel packageSubscriptionResponseModelFromJson(String str) => SubscriptionResponseModel.fromJson(json.decode(str));

String packageSubscriptionResponseModelToJson(SubscriptionResponseModel data) => json.encode(data.toJson());

class SubscriptionResponseModel {
  String? id;
  String? title;
  int? price;
  String? description;
  List<String>? accessItems;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? packageSubscriptionResponseModelId;

  SubscriptionResponseModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.accessItems,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.packageSubscriptionResponseModelId,
  });

  factory SubscriptionResponseModel.fromJson(Map<String, dynamic> json) => SubscriptionResponseModel(
    id: json["_id"],
    title: json["title"],
    price: json["price"],
    description: json["description"],
    accessItems: json["access_items"] == null ? [] : List<String>.from(json["access_items"]!.map((x) => x)),
    isActive: json["is_active"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    packageSubscriptionResponseModelId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "price": price,
    "description": description,
    "access_items": accessItems == null ? [] : List<dynamic>.from(accessItems!.map((x) => x)),
    "is_active": isActive,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "id": packageSubscriptionResponseModelId,
  };
}
