// To parse this JSON data, do
//
//     final privacyPolicyResponseModel = privacyPolicyResponseModelFromJson(jsonString);

import 'dart:convert';

PrivacyPolicyResponseModel privacyPolicyResponseModelFromJson(String str) => PrivacyPolicyResponseModel.fromJson(json.decode(str));

String privacyPolicyResponseModelToJson(PrivacyPolicyResponseModel data) => json.encode(data.toJson());

class PrivacyPolicyResponseModel {
  String? id;
  String? text;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? privacyPolicyResponseModelId;

  PrivacyPolicyResponseModel({
    this.id,
    this.text,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.privacyPolicyResponseModelId,
  });

  factory PrivacyPolicyResponseModel.fromJson(Map<String, dynamic> json) => PrivacyPolicyResponseModel(
    id: json["_id"],
    text: json["text"],
    isActive: json["is_active"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    privacyPolicyResponseModelId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "text": text,
    "is_active": isActive,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "id": privacyPolicyResponseModelId,
  };
}
