// To parse this JSON data, do
//
//     final qouteResponse = qouteResponseFromJson(jsonString);

import 'dart:convert';

QouteResponse qouteResponseFromJson(String str) => QouteResponse.fromJson(json.decode(str));

String qouteResponseToJson(QouteResponse data) => json.encode(data.toJson());

class QouteResponse {
  String? id;
  String? topic;
  DateTime? time;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? qouteResponseId;

  QouteResponse({
    this.id,
    this.topic,
    this.time,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.qouteResponseId,
  });

  factory QouteResponse.fromJson(Map<String, dynamic> json) => QouteResponse(
    id: json["_id"],
    topic: json["topic"],
    time: json["time"] == null ? null : DateTime.parse(json["time"]),
    isActive: json["is_active"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    qouteResponseId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "topic": topic,
    "time": "${time!.year.toString().padLeft(4, '0')}-${time!.month.toString().padLeft(2, '0')}-${time!.day.toString().padLeft(2, '0')}",
    "is_active": isActive,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "id": qouteResponseId,
  };
}
