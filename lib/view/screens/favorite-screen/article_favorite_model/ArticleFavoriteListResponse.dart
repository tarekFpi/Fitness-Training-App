// To parse this JSON data, do
//
//     final articleFavoriteListResponse = articleFavoriteListResponseFromJson(jsonString);

import 'dart:convert';

ArticleFavoriteListResponse articleFavoriteListResponseFromJson(String str) => ArticleFavoriteListResponse.fromJson(json.decode(str));

String articleFavoriteListResponseToJson(ArticleFavoriteListResponse data) => json.encode(data.toJson());

class ArticleFavoriteListResponse {
  String? id;
  String? articleId;
  String? userId;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  ArticlesData? articlesData;

  ArticleFavoriteListResponse({
    this.id,
    this.articleId,
    this.userId,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.articlesData,
  });

  factory ArticleFavoriteListResponse.fromJson(Map<String, dynamic> json) => ArticleFavoriteListResponse(
    id: json["_id"],
    articleId: json["article_id"],
    userId: json["user_id"],
    isActive: json["is_active"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    articlesData: json["articlesData"] == null ? null : ArticlesData.fromJson(json["articlesData"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "article_id": articleId,
    "user_id": userId,
    "is_active": isActive,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "articlesData": articlesData?.toJson(),
  };
}

class ArticlesData {
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

  ArticlesData({
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
  });

  factory ArticlesData.fromJson(Map<String, dynamic> json) => ArticlesData(
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
  };
}
