// To parse this JSON data, do
//
//     final settingFaqResponseModel = settingFaqResponseModelFromJson(jsonString);

import 'dart:convert';

SettingFaqResponseModel settingFaqResponseModelFromJson(String str) => SettingFaqResponseModel.fromJson(json.decode(str));

String settingFaqResponseModelToJson(SettingFaqResponseModel data) => json.encode(data.toJson());

class SettingFaqResponseModel {
  String? id;
  String? question;
  String? answer;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? settingFaqResponseModelId;

  SettingFaqResponseModel({
    this.id,
    this.question,
    this.answer,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.settingFaqResponseModelId,
  });

  factory SettingFaqResponseModel.fromJson(Map<String, dynamic> json) => SettingFaqResponseModel(
    id: json["_id"],
    question: json["question"],
    answer: json["answer"],
    isActive: json["is_active"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    settingFaqResponseModelId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "question": question,
    "answer": answer,
    "is_active": isActive,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "id": settingFaqResponseModelId,
  };
}
