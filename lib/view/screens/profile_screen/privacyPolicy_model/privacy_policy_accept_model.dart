
// To parse this JSON data, do
//
//     final privacyPolicyInsertResponseModel = privacyPolicyInsertResponseModelFromJson(jsonString);

import 'dart:convert';

PrivacyPolicyInsertResponseModel privacyPolicyInsertResponseModelFromJson(String str) => PrivacyPolicyInsertResponseModel.fromJson(json.decode(str));

String privacyPolicyInsertResponseModelToJson(PrivacyPolicyInsertResponseModel data) => json.encode(data.toJson());

class PrivacyPolicyInsertResponseModel {
  String? userId;
  String? privacyPolicyId;
  bool? isActive;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? privacyPolicyInsertResponseModelId;

  PrivacyPolicyInsertResponseModel({
    this.userId,
    this.privacyPolicyId,
    this.isActive,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.privacyPolicyInsertResponseModelId,
  });

  factory PrivacyPolicyInsertResponseModel.fromJson(Map<String, dynamic> json) => PrivacyPolicyInsertResponseModel(
    userId: json["user_id"],
    privacyPolicyId: json["privacy_policy_id"],
    isActive: json["is_active"],
    id: json["_id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    privacyPolicyInsertResponseModelId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "privacy_policy_id": privacyPolicyId,
    "is_active": isActive,
    "_id": id,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "id": privacyPolicyInsertResponseModelId,
  };
}
