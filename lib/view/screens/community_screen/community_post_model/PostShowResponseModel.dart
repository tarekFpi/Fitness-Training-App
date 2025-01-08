// To parse this JSON data, do
//
//     final postShowResponseModel = postShowResponseModelFromJson(jsonString);

import 'dart:convert';

PostShowResponseModel postShowResponseModelFromJson(String str) => PostShowResponseModel.fromJson(json.decode(str));

String postShowResponseModelToJson(PostShowResponseModel data) => json.encode(data.toJson());

class PostShowResponseModel {
  String? id;
  String? content;
  List<String>? media;
  String? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  UsersData? usersData;
  List<dynamic>? likes;
  List<Comment>? comments;
  bool? isLiked;
  bool? isCommented;

  PostShowResponseModel({
    this.id,
    this.content,
    this.media,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.usersData,
    this.likes,
    this.comments,
    this.isLiked,
    this.isCommented,
  });

  factory PostShowResponseModel.fromJson(Map<String, dynamic> json) => PostShowResponseModel(
    id: json["_id"],
    content: json["content"],
    media: json["media"] == null ? [] : List<String>.from(json["media"]!.map((x) => x)),
    userId: json["user_id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    usersData: json["usersData"] == null ? null : UsersData.fromJson(json["usersData"]),
    likes: json["likes"] == null ? [] : List<dynamic>.from(json["likes"]!.map((x) => x)),
    comments: json["comments"] == null ? [] : List<Comment>.from(json["comments"]!.map((x) => Comment.fromJson(x))),
    isLiked: json["isLiked"],
    isCommented: json["isCommented"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "content": content,
    "media": media == null ? [] : List<dynamic>.from(media!.map((x) => x)),
    "user_id": userId,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "usersData": usersData?.toJson(),
    "likes": likes == null ? [] : List<dynamic>.from(likes!.map((x) => x)),
    "comments": comments == null ? [] : List<dynamic>.from(comments!.map((x) => x.toJson())),
    "isLiked": isLiked,
    "isCommented": isCommented,
  };
}

class Comment {
  String? id;
  String? userId;
  String? postId;
  String? type;
  List<dynamic>? media;
  String? content;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Comment({
    this.id,
    this.userId,
    this.postId,
    this.type,
    this.media,
    this.content,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    id: json["_id"],
    userId: json["user_id"],
    postId: json["post_id"],
    type: json["type"],
    media: json["media"] == null ? [] : List<dynamic>.from(json["media"]!.map((x) => x)),
    content: json["content"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "user_id": userId,
    "post_id": postId,
    "type": type,
    "media": media == null ? [] : List<dynamic>.from(media!.map((x) => x)),
    "content": content,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class UsersData {
  String? id;
  String? email;
  String? name;
  dynamic img;

  UsersData({
    this.id,
    this.email,
    this.name,
    this.img,
  });

  factory UsersData.fromJson(Map<String, dynamic> json) => UsersData(
    id: json["_id"],
    email: json["email"],
    name: json["name"],
    img: json["img"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "email": email,
    "name": name,
    "img": img,
  };
}
