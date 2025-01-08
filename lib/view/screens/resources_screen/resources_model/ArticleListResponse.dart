// To parse this JSON data, do
//
//     final articleListResponse = articleListResponseFromJson(jsonString);

import 'dart:convert';

ArticleListResponse articleListResponseFromJson(String str) => ArticleListResponse.fromJson(json.decode(str));

String articleListResponseToJson(ArticleListResponse data) => json.encode(data.toJson());

class ArticleListResponse {
  String? id;
  String? topic;
  String? title;
  DateTime? publishedDate;
  String? img;
  String? description;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? articleListResponseId;

  ArticleListResponse({
    this.id,
    this.topic,
    this.title,
    this.publishedDate,
    this.img,
    this.description,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.articleListResponseId,
  });

  factory ArticleListResponse.fromJson(Map<String, dynamic> json) => ArticleListResponse(
    id: json["_id"],
    topic: json["topic"],
    title: json["title"],
    publishedDate: json["published_date"] == null ? null : DateTime.parse(json["published_date"]),
    img: json["img"],
    description: json["description"],
    isActive: json["is_active"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    articleListResponseId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "topic": topic,
    "title": title,
    "published_date": publishedDate?.toIso8601String(),
    "img": img,
    "description": description,
    "is_active": isActive,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "id": articleListResponseId,
  };
}
