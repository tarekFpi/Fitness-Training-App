// To parse this JSON data, do
//
//     final likeShowByIdResponseModel = likeShowByIdResponseModelFromJson(jsonString);

import 'dart:convert';

LikeShowByIdResponseModel likeShowByIdResponseModelFromJson(String str) => LikeShowByIdResponseModel.fromJson(json.decode(str));

String likeShowByIdResponseModelToJson(LikeShowByIdResponseModel data) => json.encode(data.toJson());

class LikeShowByIdResponseModel {
  String? id;
  DateTime? createdAt;
  User? user;

  LikeShowByIdResponseModel({
    this.id,
    this.createdAt,
    this.user,
  });

  factory LikeShowByIdResponseModel.fromJson(Map<String, dynamic> json) => LikeShowByIdResponseModel(
    id: json["_id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "createdAt": createdAt?.toIso8601String(),
    "user": user?.toJson(),
  };
}

class User {
  String? id;
  String? name;
  dynamic img;

  User({
    this.id,
    this.name,
    this.img,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    name: json["name"],
    img: json["img"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "img": img,
  };
}
