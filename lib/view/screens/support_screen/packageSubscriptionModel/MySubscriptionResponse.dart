// To parse this JSON data, do
//
//     final mySubscriptionResponse = mySubscriptionResponseFromJson(jsonString);

import 'dart:convert';

MySubscriptionResponse mySubscriptionResponseFromJson(String str) => MySubscriptionResponse.fromJson(json.decode(str));

String mySubscriptionResponseToJson(MySubscriptionResponse data) => json.encode(data.toJson());

class MySubscriptionResponse {
  String? id;
  String? userId;
  String? stripeCustomerId;
  String? packageId;
  int? price;
  String? status;
  bool? isActive;
  DateTime? expireTime;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  PackageData? packageData;

  MySubscriptionResponse({
    this.id,
    this.userId,
    this.stripeCustomerId,
    this.packageId,
    this.price,
    this.status,
    this.isActive,
    this.expireTime,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.packageData,
  });

  factory MySubscriptionResponse.fromJson(Map<String, dynamic> json) => MySubscriptionResponse(
    id: json["_id"],
    userId: json["user_id"],
    stripeCustomerId: json["stripe_customer_id"],
    packageId: json["package_id"],
    price: json["price"],
    status: json["status"],
    isActive: json["is_active"],
    expireTime: json["expire_time"] == null ? null : DateTime.parse(json["expire_time"]),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    packageData: json["packageData"] == null ? null : PackageData.fromJson(json["packageData"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "user_id": userId,
    "stripe_customer_id": stripeCustomerId,
    "package_id": packageId,
    "price": price,
    "status": status,
    "is_active": isActive,
    "expire_time": expireTime?.toIso8601String(),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "packageData": packageData?.toJson(),
  };
}

class PackageData {
  String? id;
  String? title;
  int? price;
  String? description;
  List<String>? accessItems;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  PackageData({
    this.id,
    this.title,
    this.price,
    this.description,
    this.accessItems,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory PackageData.fromJson(Map<String, dynamic> json) => PackageData(
    id: json["_id"],
    title: json["title"],
    price: json["price"],
    description: json["description"],
    accessItems: json["access_items"] == null ? [] : List<String>.from(json["access_items"]!.map((x) => x)),
    isActive: json["is_active"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
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
  };
}
